import 'package:flutter/material.dart';

class Chipper extends StatefulWidget {
  Chipper({Key key}) : super(key: key);

  _ChipperState createState() => _ChipperState();
}

class _ChipperState extends State<Chipper> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Chip(
        avatar: CircleAvatar(
          backgroundColor: Colors.grey.shade800,
          child: Text('AB'),
        ),
        label: Text('Aaron Burr'),
      ),
    );
  }
}
