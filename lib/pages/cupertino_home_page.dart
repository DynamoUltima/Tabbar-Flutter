import 'package:flutter/cupertino.dart';
import 'package:tabbar/general_page.dart';

class CupertinoHome extends StatefulWidget {
  @override
  _CupertinoHomeState createState() => _CupertinoHomeState();
}

class _CupertinoHomeState extends State<CupertinoHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:  ListView(
                    padding: EdgeInsets.all(16.0),
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      VeggieCard(),
                      SizedBox(
                        height: 10,
                      ),
                      VeggieCard(),
                      SizedBox(
                        height: 10,
                      ),
                      VeggieCard(),
                      SizedBox(
                        height: 10,
                      ),
                      VeggieCard(),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
      
    );
  }
}