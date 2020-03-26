import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tabbar/authenticate/accounts.dart';
import 'package:tabbar/authenticate/phone_auth.dart';
import 'package:tabbar/general_page.dart';
import 'package:tabbar/home/log_in.dart';

class Intro extends StatefulWidget {
  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {

  FacebookLogin fblogin = new FacebookLogin();


  Future _checkLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    print("_checkLogin called  MyHomePage");

    if (pref.getBool("isLogin")) {
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) => HomePage()));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //_checkLogin();
  }

  
  @override
  Widget build(BuildContext context) {
    var buttonIcon = Icon(FontAwesomeIcons.facebook);
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            buildContainerLogo(),
            SizedBox(height: 150),
            _buildLoginButton(screenWidth, context),
            SizedBox(height: 20),
            _buildSignUpButton(screenWidth, context),
            SizedBox(height: 20,),
            _signinWithFaceBook(screenWidth)
          ],
        ),
      ),
    );
  }

  Widget _signinWithFaceBook(double screenWidth) {
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
                  _redirectPage(
                      signedInUser.user.email,
                      signedInUser.user.phoneNumber,
                      signedInUser.user.displayName);
                  print("signed in user" + signedInUser.user.displayName);
                });

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
        label: Text("Sign in"),
      ),
    );
  }

  Future _redirectPage(String mail, String phoneNumber, String displayName) {
    return Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => AccountPage(
          email: mail,
          phoneNumber: phoneNumber,
          displayName: displayName,
        ), //intro
      ),
    );
  }

  SizedBox _buildSignUpButton(double screenWidth, BuildContext context) {
    return SizedBox(
            width: screenWidth * 0.5,
            child: OutlineButton(
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(25.0),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => PhoneAuther()),
                );

              },
              child: Padding(
                child: Text(
                  "Sign up",
                ),
                padding: const EdgeInsets.all(16.0),
              ),
              textColor: Colors.grey,
            ),
          );
  }

  SizedBox _buildLoginButton(double screenWidth, BuildContext context) {
    return SizedBox(
            width: screenWidth * 0.5,
            child: RaisedButton(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(25.0),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => LoginPage()),
                );
              },
              child: Padding(
                child: Text(
                  "Log in",
                ),
                padding: const EdgeInsets.all(16.0),
              ),
              textColor: Colors.white,
              color: Colors.indigo[900],
            ),
          );
  }

  Container buildContainerLogo() {
    return Container(
            height: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/ic_launcher.png"),
                  fit: BoxFit.contain),
            ),
          );
  }
}
