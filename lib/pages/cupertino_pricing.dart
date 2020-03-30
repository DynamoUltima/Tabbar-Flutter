import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tabbar/views/estimate_page.dart';
import 'package:tabbar/views/pricing_pageview.dart';

class CupertinoPricing extends StatefulWidget {
  @override
  _CupertinoPricingState createState() => _CupertinoPricingState();
}

class _CupertinoPricingState extends State<CupertinoPricing> {
  static Widget giveCenter(String myText, BuildContext context) {
    return Text(
      'This is: $myText',
      style: CupertinoTheme.of(context)
          .textTheme
          .navLargeTitleTextStyle
          .apply(color: CupertinoColors.activeBlue),
    );
  }

  int sharedValue = 0;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    final Map<int, Widget> logoWidgets = <int, Widget>{
      0: Text(
        'Price',
        style: CupertinoTheme.of(context)
            .textTheme
            .navTitleTextStyle
            .apply(color: CupertinoColors.activeBlue),
      ),
      1: Text(
        "Estimate",
        style: CupertinoTheme.of(context)
            .textTheme
            .textStyle
            .apply(color: CupertinoColors.activeBlue),
      ),
    };

    List<Widget> pages = [
      
      Container(child: PricingPager()),

     Container(child: Estimator(),)
    ];

    return Container(
      height:screenHeight,
      child: Column(
        
        children: <Widget>[
          SizedBox(
            height: 90,
          ),
          SizedBox(
            width: 500,
            child: CupertinoSegmentedControl(
              selectedColor: Colors.white,
              pressedColor: Colors.blueAccent,
              children: logoWidgets,
              onValueChanged: (value) {
                setState(() {
                  sharedValue = value;
                });
              },
            ),
          ),
          Column(
            children: <Widget>[
              //SizedBox(height: 40,),
              Center(
                child: pages[sharedValue],
              ),
            ],
          )
        ],
      ),
    );
  }
}
