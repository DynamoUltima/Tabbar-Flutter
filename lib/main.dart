import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tabbar/general_page.dart';

import 'package:tabbar/pages/home_page.dart';
import 'package:tabbar/services/services.dart';

import 'package:shared_preferences/shared_preferences.dart';

void main() {
  String loginKey = "LoginToken";

  // print("--tokenId---");
  // print(tokenId);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String loginKey = "LoginTokener";
  var tokenId;
  Future checkUser() async {
    // SharedPreferences preferences = await SharedPreferences.getInstance();
    // //var tokenId= preferences.getString(loginKey)??null;

    // var tokenId = preferences.getBool(loginKey) ?? false;
    print('--login status from main---');
    // print(tokenId);

    // print("------tokenId----1--");
    // print(tokenId);

    // if (tokenId == true) {
    //   return HomePage();
    // } else {
    //   return MyHomePage();
    // }
  }

  @override
  void initState() {
    super.initState();
    // const MethodChannel('plugins.flutter.io/shared_preferences')
    //     .setMockMethodCallHandler(
    //   (MethodCall methodCall) async {
    //     if (methodCall.method == 'getAll') {
    //       return {"flutter." + loginKey: false};
    //     }
    //     return null;
    //   },
    // );
    startTimer();
  }

  void startTimer() {
    Timer(Duration(seconds: 3), () {
      navigateUser(); //It will redirect  after 3 seconds
    });
  }

 void navigateUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    
    setState(() {
      tokenId = preferences.getBool(loginKey);
    });
    print("------tokenId----main.dart--navUser");
    print(tokenId);

    var test =preferences.getStringList(user_list_key);

    print("---testing prefrences----main.dart");
    print(test);
    

    print("navidgateUser is being called");

    // if (tokenId) {
    //   return HomePage();
    // } else {
    //   return MyHomePage();
    // }
  }

  @override
  Widget build(BuildContext context) {
    // checkUser();
    print("------tokenId----main.dart--");
    print(tokenId);

    if (tokenId == true) {
      return MaterialApp(
          theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
        home: Scaffold(
          body: HomePage(),
        ),
      );
    } else {
      return MaterialApp(
          theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
        home: Scaffold(
          body: MyHomePage(),
        ),
      );
    }

    // return MaterialApp(
    //   theme: ThemeData(
    //     primarySwatch: Colors.blue,
    //   ),
    //   home: Scaffold(
    //     body: Container(
    //       child: Center(
    //         child: Text("Welcome"),
    //       ),
    //       // decoration: BoxDecoration(
    //       //   image: DecorationImage(
    //       //       image: AssetImage("assets/images/clinician_splash.png"),
    //       //       fit: BoxFit.cover),
    //       // ),
    //     ),
    //   ),
    // );

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
