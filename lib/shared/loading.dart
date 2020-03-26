import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Container(
        color: Colors.white54,
        child: Center(
            child: SpinKitDualRing(
          color: Colors.teal[400],
          size: 50,
        )),
      ),
    );
  }
}
