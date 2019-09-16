import 'package:flutter/cupertino.dart';
import 'package:tabbar/general_page.dart';

class HomeCard extends StatefulWidget {
  @override
  _HomeCardState createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
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
