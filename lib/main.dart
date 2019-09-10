import 'package:flutter/material.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:tabbar/general_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: <Color>[Colors.purple[700], Colors.pink[300]],
              begin: Alignment.centerLeft,
              end: Alignment(2.0, 4.0))),
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
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15))),
                                    elevation: 0,
                                    child: Container(
                                      margin: EdgeInsets.only(bottom: 30),
                                      child: Stack(
                                        children: <Widget>[
                                          Column(
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 20,
                                                    left: 20,
                                                    right: 20),
                                                child: TextFormField(
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: 'Email Address',
                                                    prefixIcon: Icon(
                                                        Icons.mail_outline),
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
                                                padding: const EdgeInsets.only(
                                                    top: 20,
                                                    left: 20,
                                                    right: 20),
                                                child: TextFormField(
                                                  //controller: _emailController,

                                                  decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      hintText: 'Password',
                                                      prefixIcon: Icon(
                                                          Icons.lock_outline)),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
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
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) =>HomePage()));
                                  },
                                  textColor: Colors.white,
                                  padding: const EdgeInsets.all(0.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      gradient: LinearGradient(
                                        colors: <Color>[
                                          Colors.purple,
                                          Colors.pink,
                                          // Color(0xFF42A5F5),
                                        ],
                                      ),
                                    ),
                                    padding: const EdgeInsets.only(right:20.0,left: 25, top:7,bottom:7),
                                    child: const Text('Login',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                                ))
                          ],
                        ),
                        Stack(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Center(
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15))),
                                    elevation: 0,
                                    child: Container(
                                      margin: EdgeInsets.only(bottom: 30),
                                      child: Stack(
                                        children: <Widget>[
                                          Column(
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 20,
                                                    left: 20,
                                                    right: 20),
                                                child: TextFormField(
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: 'Name',
                                                    prefixIcon: Icon(
                                                        Icons.person_outline),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 10),
                                              Divider(
                                                color: Colors.grey,
                                                indent: 10,
                                                endIndent: 10,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 20,
                                                    left: 20,
                                                    right: 20),
                                                child: TextFormField(
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: 'Email Address',
                                                    prefixIcon: Icon(
                                                        Icons.mail_outline),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Divider(
                                                height: 15,
                                                color: Colors.grey,
                                                indent: 15,
                                                endIndent: 15,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 20,
                                                    left: 20,
                                                    right: 20),
                                                child: TextFormField(
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: 'Password',
                                                    prefixIcon: Icon(
                                                        Icons.lock_outline),
                                                    suffixIcon: Icon(Icons.remove_red_eye)    
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Divider(
                                                height: 15,
                                                color: Colors.grey,
                                                indent: 15,
                                                endIndent: 15,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 20, right: 20),
                                                child: TextFormField(
                                                  //controller: _emailController,

                                                  decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      hintText: 'Confirmation',
                                                      prefixIcon: Icon(
                                                          Icons.lock_outline),
                                                      suffixIcon: Icon(Icons.remove_red_eye)),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Positioned(
                              top: 337,
                              left: 110,
                              child: InkWell(
                                splashColor: Colors.grey,
                                child: RaisedButton(
                                  elevation: 15,
                                  shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(30.0),
                                  ),
                                  onPressed: () {},
                                  textColor: Colors.white,
                                  padding: const EdgeInsets.all(0.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(color: Colors.black26,offset: Offset(0, 9))
                                      ],
                                      borderRadius: BorderRadius.circular(10.0),
                                      gradient: LinearGradient(
                                        colors: <Color>[
                                          Colors.purple,
                                          Colors.pink,
                                          // Color(0xFF42A5F5),
                                        ],
                                      ),
                                    ),
                                    padding: const EdgeInsets.all(10.0),
                                    child: const Text('Sign Up',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ))
      ]),
    );
  }
}
