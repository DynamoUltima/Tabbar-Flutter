import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tabbar/home/log_in.dart';

class Intro extends StatefulWidget {
  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {
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
            Container(
              height: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/ic_launcher.png"),
                    fit: BoxFit.contain),
              ),
            ),
            SizedBox(height: 150),
            SizedBox(
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
            ),
            SizedBox(height: 20),
            SizedBox(
              width: screenWidth * 0.5,
              child: OutlineButton(
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(25.0),
                ),
                onPressed: () {},
                child: Padding(
                  child: Text(
                    "Sign up",
                  ),
                  padding: const EdgeInsets.all(16.0),
                ),
                textColor: Colors.grey,
              ),
            )
          ],
        ),
      ),
    );
  }
}
