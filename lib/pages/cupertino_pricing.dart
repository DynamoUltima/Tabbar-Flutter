import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      // giveCenter('Price', context),
      Container(child: PricingPager()),

      giveCenter('Logo 3', context)
    ];

    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 100,
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
