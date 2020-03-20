import 'dart:async';
import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart' as crypto;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tabbar/models/login/login_response.dart';
import 'package:tabbar/pages/home_page.dart';
import 'package:tabbar/services/services.dart';
import 'package:tabbar/shared/constant.dart';

import '../general_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _password;

  String _email;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  FacebookLogin fblogin = new FacebookLogin();

  var emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  generateMd5(String data) {
    var content = new Utf8Encoder().convert(data);
    var md5 = crypto.sha512;
    var digest = md5.convert(content);
    return hex.encode(digest.bytes);
  }

  Future _checkLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    print("_checkLogin called  MyHomePage");

    if (pref.getBool("isLogin")) {
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) => HomePage()));
    }
  }

  Future<bool> _saveListName(List myStrings) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    return await preferences.setStringList(UserListKey, myStrings);
  }

  Widget _buildEmail() {
    return Padding(
      child: TextFormField(
        decoration:
            TextInputDecoration.copyWith(labelText: 'Email', hintText: 'Email'),
        onChanged: (val) {
          setState(() {
            _email = val;
          });
        },
        validator: (val) {
          if (val.isEmpty || !emailValid.hasMatch(val)) {
            return "Enter Valid email";
          }
        },
      ),
      padding: EdgeInsets.symmetric(horizontal: 32.0),
    );
  }

  Widget _buildPassword() {
    return Padding(
      child: TextFormField(
        obscureText: true,
        decoration: TextInputDecoration.copyWith(
          labelText: 'Password',
          hintText: 'Password',
        ),
        onChanged: (val) {
          setState(() {
            _password = val;
          });
        },
        validator: (val) {
          if (val.isEmpty) {
            return "Enter Valid password";
          }
        },
      ),
      padding: EdgeInsets.symmetric(horizontal: 32.0),
    );
  }

  Widget _loginButton(double screenWidth) {
    return SizedBox(
      width: screenWidth * 0.5,
      child: RaisedButton(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(25.0),
        ),
        onPressed: () async {
          if (_formKey.currentState.validate()) {
            postLogin(_email.trim(), generateMd5(_password.trim()))
                .then(response)
                .catchError(onError());
          }
        },
        child: Padding(
          child: Text(
            "Log in",
          ),
          padding: const EdgeInsets.all(16.0),
        ),
        textColor: Colors.white,
        color: Colors.indigo,
      ),
    );
  }

  onError() => print(onError);

  Widget _loginWIthFaceBook(double screenWidth) {
    return SizedBox(
      width: screenWidth * 0.5,
      child: OutlineButton.icon(
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(25.0),
        ),
        onPressed: () async {
          fblogin.logIn(['email', 'public_profile']).then((result) async {
            switch (result.status) {
              case FacebookLoginStatus.loggedIn:
                final facebookAuthCred = FacebookAuthProvider.getCredential(
                    accessToken: result.accessToken.token);
                await FirebaseAuth.instance
                    .signInWithCredential(facebookAuthCred)
                    .then((signedInUser) {
                  print("signed in user" + signedInUser.user.displayName);
                });

                await _RedirectPage();

                break;
              case FacebookLoginStatus.cancelledByUser:
                // TODO: Handle this case.
                break;
              case FacebookLoginStatus.error:
                // TODO: Handle this case.
                print("error" + FacebookLoginStatus.error.toString());
                break;
            }
          }).catchError((e) {
            print(e);
          });
        },
        textColor: Colors.blue,
        color: Colors.blueAccent,
        icon: Icon(
          FontAwesomeIcons.facebook,
          color: Colors.blue,
        ),
        label: Text("login"),
      ),
    );
  }

  Future _RedirectPage() {
    return Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => MyHomePage(), //intro
      ),
    );
  }

  FutureOr<dynamic> response(response) async {
    print(response.statusCode);

    var loginMap = json.decode(response.body);
    LoginResponse loginResponse = new LoginResponse();
    setState(() {
      loginResponse = LoginResponse.fromJson(loginMap);
    });
    print(loginResponse.toJson());
    print(loginResponse.success);
    if (loginResponse.success == 0) {
      print(loginResponse.success);

      print("--- status code being called -- false---");
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool("isLogin", false);
      SnackBar snackBar = SnackBar(
        content: Text(
          "Invalid Credentials",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      );
      _scaffoldKey.currentState.showSnackBar(snackBar);
    }

    List<String> myStrings = [
      loginResponse.user.email,
      loginResponse.user.location,
      loginResponse.user.name,
      loginResponse.user.phone,
      loginResponse.user.home_reference,
      //loginResponse.user_id;
    ];

    var loginId = loginResponse.user.phone;
    print("--loginId--");
    print(loginId);
    _saveListName(myStrings);

    if (response.statusCode == 200) {
      print("--- status code being called---good ");
      SharedPreferences mprefs = await SharedPreferences.getInstance();
      mprefs.setBool("isLogin", true);
      mprefs.setString("userName", loginResponse.user.name);

      print(loginResponse.success);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => HomePage(),
        ),
      );
      // Navigator.pop(context);
    }
  }

  @override
  void initState() {
    super.initState();
    //_checkLogin(); this should be  at the intro page instead
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      //backgroundColor: Colors.indigo,
      key: _scaffoldKey,
      body: Container(
        alignment: Alignment.bottomCenter,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildEmail(),
              _buildPassword(),
              SizedBox(
                height: 15,
              ),
              _loginButton(screenWidth),
              SizedBox(
                height: 10,
              ),
              Text(
                "Or",
                style: TextStyle(
                    // color: Colors.white,
                    ),
              ),
              _loginWIthFaceBook(screenWidth)
            ],
          ),
        ),
      ),
    );
  }
}
