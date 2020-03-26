import 'dart:convert';
import 'dart:async';
import 'package:convert/convert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tabbar/authenticate/accounts.dart';
import 'package:tabbar/general_page.dart';
import 'package:tabbar/models/signup/signup_response_model.dart';
import 'package:tabbar/services/services.dart';
import 'package:tabbar/shared/constant.dart';
import 'package:crypto/crypto.dart' as crypto;
import 'package:tabbar/shared/loading.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
  final String number;

  SignUpPage({this.number});
}

class _SignUpPageState extends State<SignUpPage> {
  String _password;
  String _username;
  String _selectedLocation;
  String _email;
  //String _otherlocation;
  // String _phoneNumber;
  bool loading = false;

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

  Widget _buildPhoneNumber() {
    return Padding(
      child: TextFormField(
        initialValue: widget.number,
        enabled: false,
        decoration: TextInputDecoration.copyWith(
          labelText: 'number',
          hintText: widget.number,
        ),
        // onChanged: (val) {
        //   setState(() {
        //     _password = val;
        //   });
        // },
        validator: (val) {
          if (val.isEmpty) {
            return "Enter Valid password";
          }
          return null;
        },
      ),
      padding: EdgeInsets.symmetric(horizontal: 32.0),
    );
  }

  Widget _buildEmail() {
    return Padding(
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
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
          return null;
        },
      ),
      padding: EdgeInsets.symmetric(horizontal: 32.0),
    );
  }

  Widget _buildLocation() {
    return Padding(
      child: DropdownButtonHideUnderline(
        child: DropdownButtonFormField(
          value: _selectedLocation,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.add_location),
            // labelText: 'location',
          ),
          hint: Text("Select your location"),
          onChanged: (value) {
            setState(() {
              _selectedLocation = value;
            });
            print("-----on changed dropdown value-----");

            print(_selectedLocation);
          },
          items: locations.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 32),
    );
  }

  Widget _buildUsername() {
    return Padding(
      child: TextFormField(
        keyboardType: TextInputType.text,
        decoration: TextInputDecoration.copyWith(
          labelText: 'username',
          hintText: 'username',
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
          return null;
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
          return null;
        },
      ),
      padding: EdgeInsets.symmetric(horizontal: 32.0),
    );
  }

  Widget _signUpButton(double screenWidth) {
    return SizedBox(
      width: screenWidth * 0.5,
      child: RaisedButton(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(25.0),
        ),
        onPressed: () async {
          if (_formKey.currentState.validate()) {
            setState(() {
              loading = true;
            });
            await postSignUp(
              _email.trim(),
              generateMd5(_password.trim()),
              _username,
              _selectedLocation,
              _selectedLocation,
              widget.number,
            ).then(response).catchError(onError());
          }
        },
        child: Padding(
          child: Text(
            "Sign Up",
          ),
          padding: const EdgeInsets.all(16.0),
        ),
        textColor: Colors.white,
        color: Colors.indigo,
      ),
    );
  }

  onError() => print(onError);

  Future<dynamic> response(response) async {
    print(response.statusCode);

    var signupMap = json.decode(response.body);
    SignUpResponse signUpResponse = new SignUpResponse();

    setState(() {
      signUpResponse = SignUpResponse.fromJson(signupMap);
    });

    if (signUpResponse.success == "0") {
      print(signUpResponse.success);
      setState(() {
        loading = false;
      });

      print("--- status code being called -- false---");
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool("isLogin", false);
      SnackBar snackBar = SnackBar(
        content: Text(
          "Invalid Credentials",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      );
      _scaffoldKey.currentState.showSnackBar(snackBar);
    }

    List<String> myStrings = [
      signUpResponse.user.email,
      signUpResponse.user.location,
      signUpResponse.user.name,
      signUpResponse.user.phone,
      _selectedLocation
      // signUpResponse.user_id
    ];

    var loginId = signUpResponse.user.phone;
    print("--loginId--");
    print(loginId);
    _saveListName(myStrings);

    if (response.statusCode == 200) {
      print("--- status code being called---good ");

      print(signUpResponse.success);

      if (signUpResponse.success == "1") {
        SharedPreferences mprefs = await SharedPreferences.getInstance();
        mprefs.setBool("isLogin", true);
        mprefs.setString("userName", signUpResponse.user.name);
        setState(() {
          loading = false;
        });
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => HomePage(),
          ),
        );
      }

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
    return loading
        ? Loading()
        : Scaffold(
            body: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildEmail(),
                  _buildPassword(),
                  _buildUsername(),
                  _buildPhoneNumber(),
                  _buildLocation(),
                  SizedBox(height: 35),
                  _signUpButton(screenWidth),
                  // SizedBox(height: 15),
                  // _signinWIthFaceBook(screenWidth)
                ],
              ),
            ),
          );
  }
}
