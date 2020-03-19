import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tabbar/authenticate/phone_auth.dart';
import 'package:tabbar/general_page.dart';
import 'package:tabbar/home/intro.dart';

import 'package:tabbar/pages/home_page.dart';
import 'package:tabbar/services/services.dart';

import 'package:shared_preferences/shared_preferences.dart';

void main() {
  // print("--tokenId---");
  // print(tokenId);
  return runApp(
    MaterialApp(
      home: InitPage(),
      routes: <String, WidgetBuilder>{
        'MyHome': (context) => MyHomePage(),
      },
    ),
  );
}

class InitPage extends StatelessWidget {
  const InitPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var isLogin;
  Future _checkLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    setState(() {
      isLogin =pref.getBool("isLogin");
    });

    

    print("----this login method being called----");

    if(isLogin == null){
      print("---null option been called--");

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => MyHomePage(),//intro
        ),
      );

    }

    if (isLogin) {
      print("-----option 1 bein called----");//if you haven't logged in
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) =>Intro()));//HomePage()
         // Navigator.pop(context);
    } else {

      print("---alternative been called--");//if you have logged in
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => MyHomePage()// MyHomePage()
        ),
      );
     // Navigator.pop(context);
    }

    
  }

  @override
  void initState() {
    super.initState();
    _checkLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        child: Center(
          child: Container(
            height: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/ic_launcher.png"),
                  fit: BoxFit.contain),
            ),
          ),
        ),
      ),
    );

    // return MaterialApp (
    //   title: 'Flutter Demo',
    //   debugShowCheckedModeBanner: false,
    //   theme: ThemeData(
    //     primarySwatch: Colors.blue,
    //   ),
    //   home: Scaffold(
    //     body: HomePage(),
    //   ),
    // );
  }
}
