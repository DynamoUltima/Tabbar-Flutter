import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tabbar/general_page.dart';

import 'package:tabbar/pages/home_page.dart';
import 'package:tabbar/services/services.dart';

import 'package:shared_preferences/shared_preferences.dart';

void main() {
  // print("--tokenId---");
  // print(tokenId);
 return runApp(InitPage());
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
  String loginKey = "LoginTokener";
  var tokenId;
  

  

  @override
  void initState() {
    super.initState();
    //_checkLogin();

    //startTimer();
  }

  // void startTimer() {
  //   Timer(Duration(seconds: 3), () {
  //     navigateUser(); //It will redirect  after 3 seconds
  //   });
  // }

  // void navigateUser() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();

  //   setState(() {
  //     tokenId = preferences.getBool(loginKey);
  //   });
  //   print("------tokenId----main.dart--navUser");
  //   print(tokenId);

  //   var test = preferences.getStringList(user_list_key);

  //   print("---testing prefrences----main.dart");
  //   print(test);

  //   print("navidgateUser is being called");

  //   //MyHomePage();
  // }

  @override
  Widget build(BuildContext context) {
    

  

    return Container(
          child: Material(child: MyHomePage())
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //       image: AssetImage("assets/images/clinician_splash.png"),
          //       fit: BoxFit.cover),
          // ),
        
      
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
