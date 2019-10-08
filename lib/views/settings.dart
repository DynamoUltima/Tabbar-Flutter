import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tabbar/customWidgets/myTextStyle.dart';
import 'package:tabbar/views/order_page.dart';

class AllSettings extends StatefulWidget {
  @override
  _AllSettingsState createState() => _AllSettingsState();
}

class _AllSettingsState extends State<AllSettings> {
  String url =
      'https://blogs.psychcentral.com/life-goals/files/2018/09/mens-dress-guide-768x513.jpg';
  var myTextType = myTextStyle();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    var pageTtitleText = Row(
      children: <Widget>[
        Text(
          'Settings',
          style: myTextType.myLargeCuperStyle(context),
        ),
      ],
    );

    var profileRowAvatarTile = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          children: <Widget>[
            CircleAvatar(
              backgroundImage: NetworkImage(
                url,
              ),
              radius: 30,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Johnson James',
              style: myTextType.myDefaultCuperStyle(
                  context, 20, CupertinoColors.activeBlue),
            ),
          ],
        ),
        Icon(CupertinoIcons.right_chevron)
      ],
    );

    bool _value = false;

    //  onChangeSwitch(bool value){
    //    setState(() {
    //      _value= value;

    //    });

    //  }

    var notification = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          children: <Widget>[
            CircleAvatar(
              child: Icon(
                CupertinoIcons.person,
                color: CupertinoColors.white,
              ),
              backgroundColor: CupertinoColors.activeOrange,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Edit Profile',
              style: myTextType.myDefaultCuperStyle(
                  context, 20, CupertinoColors.activeBlue),
            ),
          ],
        ),
        CupertinoSwitch(
          onChanged: (bool value) {
            setState(() {
              _value = value;
            });
          },
          value: _value,
        )
      ],
    );

    settingListTiles(
      Object pageObject,
      Color circleBackgroundColor,
      String tileText,
      IconData tileIcon,
    ) {
      var settingTile = GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              CupertinoPageRoute(
                  builder: (BuildContext context) => pageObject));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                CircleAvatar(
                  child: Icon(
                    tileIcon,
                    color: CupertinoColors.white,
                  ),
                  backgroundColor: circleBackgroundColor,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  tileText,
                  style: myTextType.myDefaultCuperStyle(
                      context, 20, CupertinoColors.activeBlue),
                ),
              ],
            ),
            Icon(CupertinoIcons.right_chevron)
          ],
        ),
      );

      return settingTile;
    }

    NotificationListTiles(
      Color circleBackgroundColor,
      String tileText,
      IconData tileIcon,
    ) {
      var notificationTile = GestureDetector(
        onTap: () {
          print('Tapped Notification');
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                CircleAvatar(
                  child: Icon(
                    tileIcon,
                    color: CupertinoColors.white,
                  ),
                  backgroundColor: circleBackgroundColor,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  tileText,
                  style: myTextType.myDefaultCuperStyle(
                      context, 20, CupertinoColors.activeBlue),
                ),
              ],
            ),
            CupertinoSwitch(
              onChanged: (bool value) {
                setState(
                  () {
                    _value = value;
                  },
                );
              },
              value: _value,
            )
          ],
        ),
      );

      return notificationTile;
    }

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Settings'),
      ),
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: screenHeight * 0.1,
            ),
            pageTtitleText,
            SizedBox(
              height: 20,
            ),
            profileRowAvatarTile,
            SizedBox(
              height: 20,
            ),
            Row(children: <Widget>[
              Text(
                'Profile',
                style: myTextType.myActionCuperStyle(context),
              )
            ]),
            SizedBox(
              height: 20,
            ),
            settingListTiles(OrderPage(), CupertinoColors.activeOrange,
                'Edit profile', CupertinoIcons.person),
            SizedBox(
              height: 10,
            ),
            settingListTiles(OrderPage(), CupertinoColors.activeBlue,
                'Change password', CupertinoIcons.padlock),
            SizedBox(
              height: 20,
            ),
            Row(children: <Widget>[
              Text(
                'Notifications',
                style: myTextType.myActionCuperStyle(context),
              )
            ]),
            SizedBox(
              height: 20,
            ),
            NotificationListTiles(CupertinoColors.activeGreen, 'Notification', CupertinoIcons.bell)
          ],
        ),
      ),
    );
  }
}
