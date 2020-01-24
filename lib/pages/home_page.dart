import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/services.dart';
import 'package:tabbar/general_page.dart';
import 'package:tabbar/models/login/login_response.dart';
import 'package:tabbar/services/services.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'signup.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

String user_list_key = "list_key";

Future<bool> saveListName(List myStrings) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();

  return await preferences.setStringList(user_list_key, myStrings);
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

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
    super.initState();
    _checkLogin();
    // const MethodChannel('plugins.flutter.io/shared_preferences')
    //     .setMockMethodCallHandler(
    //   (MethodCall methodCall) async {
    //     if (methodCall.method == 'getAll') {
    //       return {"flutter." + user_list_key: "No Name saved"};
    //     }
    //     return null;
    //   },
    // );
    // loadName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[Colors.purple[700], Colors.pink[300]],
            begin: Alignment.centerLeft,
            end: Alignment(2.0, 4.0),
          ),
        ),
        //color: Colors.purple[600],
        child: ListView(children: [
          Container(
            // color: Colors.indigoAccent,
            height: 150.0,
          ),
          DefaultTabController(
              length: 2,
              initialIndex: 0,
              child: Padding(
                padding: const EdgeInsets.all(58.0),
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(55)),
                          color: Colors.black.withOpacity(0.5)),
                      // color: Colors.pink,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TabBar(
                            //  indicatorSize: TabBarIndicatorSize.label,
                            indicator: BubbleTabIndicator(
                                padding: EdgeInsets.all(-0.5),
                                indicatorHeight: 40,
                                indicatorColor: Colors.white),
                            unselectedLabelColor: Colors.white,
                            // isScrollable: true,
                            labelColor: Colors.black,
                            tabs: [
                              Tab(
                                text: 'Login',
                              ),
                              Tab(text: 'Sign Up')
                            ]),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 30),
                      // color: Colors.blue,
                      height: 400.0,
                      child: TabBarView(
                        children: [
                          Stack(
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Center(
                                    child: buildCardFormField(),
                                  ),
                                ],
                              ),
                              Positioned(
                                  top: 157,
                                  left: 110,
                                  child: Container(
                                    child: RaisedButton(
                                      elevation: 15,
                                      shape: new RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      onPressed: () async {
                                        if (_emailController.value.text == "" ||
                                            _passwordController.value.text ==
                                                "") {
                                          print("---No Email or Password---");
                                        }

                                        postLogin(_emailController.text,
                                                _passwordController.text.trim())
                                            .then(
                                          (response) async {
                                            //Print response
                                            print(response.statusCode);
                                            print(">>>>Normal response<<<<<<");

                                            var loginMap =
                                                json.decode(response.body);

                                            LoginResponse loginResponse =
                                                new LoginResponse();
                                            setState(() {
                                              loginResponse =
                                                  LoginResponse.fromJson(
                                                      loginMap);
                                            });

                                            print(loginResponse.toJson());
                                            print(loginResponse.success);
                                            print("---");
                                            print(loginResponse.success);

                                            if (loginResponse.success == 0) {
                                              print(loginResponse.success);

                                              print(
                                                  "--- status code being called -- false---");
                                              SharedPreferences prefs =
                                                  await SharedPreferences
                                                      .getInstance();
                                              prefs.setBool("isLogin", false);
                                              SnackBar snackBar = SnackBar(
                                                content: Text(
                                                  "Invalid User",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                backgroundColor: Colors.green,
                                              );
                                              scaffoldKey.currentState
                                                  .showSnackBar(snackBar);
                                            }

                                            List<String> myStrings = [
                                              loginResponse.user.email,
                                              loginResponse.user.location,
                                              loginResponse.user.name,
                                              loginResponse.user.phone,
                                              loginResponse.user.homeReference,
                                              loginResponse.userId
                                            ];

                                            var loginId =
                                                loginResponse.user.phone;

                                            print("--loginId--");

                                            print(loginId);

                                            print(">>>>Normal response<<<<<<");
                                            print(loginResponse.success);

                                            saveListName(myStrings);

                                            if (response.statusCode == 200) {
                                              print(
                                                  "--- status code being called---good ");
                                              SharedPreferences mprefs =
                                                  await SharedPreferences
                                                      .getInstance();
                                              //  mprefs.setString("myLoginToken", loginId);
                                              // mprefs.setBool("LoginTokener", true);

                                              mprefs.setBool("isLogin", true);
                                              mprefs.setString("userName",
                                                  loginResponse.user.name);

                                              print(loginResponse.success);

                                              //  var tokener= mprefs.getBool("LoginTokener");
                                              //  print("--home_page.dart--");
                                              //  print(tokener);

                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          HomePage(),
                                                ),
                                              );
                                              // Navigator.pop(context);
                                            }
                                          },
                                        ).catchError((onError) {
                                          print(onError);
                                        });

                                        //  return FutureBuilder(
                                        //     future: postLogin(_emailController.text, _passwordController.text),
                                        //     builder: (BuildContext context,AsyncSnapshot snapshot){

                                        //       print(snapshot.data.toString());
                                        //       print('tapped');

                                        //       if(snapshot.connectionState ==ConnectionState.done){

                                        //           Navigator.push(
                                        //           context,
                                        //           MaterialPageRoute(
                                        //             builder:
                                        //                 (BuildContext context) =>
                                        //                     HomePage(),
                                        //           ),
                                        //         );

                                        //       } else{
                                        //         return CircularProgressIndicator()
                                        //       }
                                        //     },

                                        //   );
                                      },
                                      textColor: Colors.white,
                                      padding: const EdgeInsets.all(0.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          gradient: LinearGradient(
                                            colors: <Color>[
                                              Colors.purple,
                                              Colors.pink,
                                              // Color(0xFF42A5F5),
                                            ],
                                          ),
                                        ),
                                        padding: const EdgeInsets.only(
                                            right: 20.0,
                                            left: 25,
                                            top: 7,
                                            bottom: 7),
                                        child: const Text('Login',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                           widgetSignUp(),
                        ],
                      ),
                    )
                  ],
                ),
              ))
        ]),
      ),
    );
  }

  Card buildCardFormField() {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      elevation: 0,
      child: Container(
        margin: EdgeInsets.only(bottom: 30),
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Email Address',
                      prefixIcon: Icon(Icons.mail_outline),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  height: 5,
                  color: Colors.grey,
                  indent: 15,
                  endIndent: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    controller: _passwordController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Password',
                      prefixIcon: Icon(Icons.lock_outline),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
