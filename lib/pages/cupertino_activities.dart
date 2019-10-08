import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tabbar/customWidgets/cirlcle_animated_progress_bar.dart';
import 'package:tabbar/views/order_page.dart';

class CupertinoActivities extends StatefulWidget {
  @override
  _CupertinoActivitiesState createState() => _CupertinoActivitiesState();
}

class _CupertinoActivitiesState extends State<CupertinoActivities> {
  _myCuperStyle(BuildContext context) {
    var cuperStyle = CupertinoTheme.of(context)
        .textTheme
        .navTitleTextStyle
        .apply(color: CupertinoColors.activeBlue);
    return cuperStyle;
  }

  double progressPercent = 0;
  @override
  Widget build(BuildContext context) {
    Color foreground = Colors.red;

    if (progressPercent >= 0.8) {
      foreground = Colors.green;
    } else if (progressPercent >= 0.4) {
      foreground = Colors.orange;
    }
    Color background = foreground.withOpacity(0.2);

    return Container(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: SizedBox(
                height: 200,
                width: 200,
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    CircleProgressBar(
                      backgroundColor: background,
                      foregroundColor: foreground,
                      value: 0.4,
                    ),
                    ConstrainedBox(
                      child: Text(
                        'Your Articles are being processed',
                        textAlign: TextAlign.center,
                        style: _myCuperStyle(context),
                      ),
                      constraints: BoxConstraints(maxWidth: 100),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CupertinoButton(
              child: Text('Place Order'),
              onPressed: () {
                Navigator.of(context).push(CupertinoPageRoute(
                    builder: (BuildContext context) => OrderPage()));
              },
              color: CupertinoColors.activeBlue,
            )
          ],
        ),
      ),
    );
  }
}
