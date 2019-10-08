import 'package:flutter/cupertino.dart';

class myTextStyle{

  String color;

  myTextStyle();




  myCuperStyle(BuildContext context) {
    var cuperStyle = CupertinoTheme.of(context)
        .textTheme
        .navTitleTextStyle
        .apply(color: CupertinoColors.activeBlue);
    return cuperStyle;
  }
  myLargeCuperStyle(BuildContext context) {
    var cuperStyle = CupertinoTheme.of(context)
        .textTheme
        .navLargeTitleTextStyle
        .apply(color: CupertinoColors.activeBlue);
    return cuperStyle;
  }
  myActionCuperStyle(BuildContext context) {
    var cuperStyle = CupertinoTheme.of(context)
        .textTheme
        .navActionTextStyle
        .apply(color: CupertinoColors.activeBlue);
    return cuperStyle;
  }

  
  myDefaultCuperStyle(BuildContext context,double fontSize,Color color) {
    var cuperStyle = CupertinoTheme.of(context)
        .textTheme
        .navActionTextStyle
        .copyWith(fontSize: fontSize,color: color);
    return cuperStyle;
  }

}