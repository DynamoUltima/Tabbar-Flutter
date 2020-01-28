import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';
import 'package:tabbar/views/update_accounts_page.dart';

class CupertinoProfile extends StatefulWidget {
  @override
  _CupertinoProfileState createState() => _CupertinoProfileState();
}

class _CupertinoProfileState extends State<CupertinoProfile> {
  String user_list_key = "list_key";
  List<String> mydetailList = [];

  @override
  void initState() {
    super.initState();
    // const MethodChannel('plugins.flutter.io/shared_preferences')
    //     .setMockMethodCallHandler(
    //   (MethodCall methodCall) async {
    //     if (methodCall.method == 'getAll') {
    //       return {"flutter." + user_list_key: "No Name saved"};
    //     }
    //     return null;
    //   },
    // );

    loadList();
  }

  Future<List<String>> getUserList() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getStringList(user_list_key);
  }

  loadList() async {
    await getUserList().then((onValue) {
      setState(() {
        mydetailList = onValue;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // if(mydetailList[4]==null){
    //   setState(() {
    //     this.homeRef="";
    //   });
    // }
    String homeRef = mydetailList[4]??"empty";

    Widget continueUpdateButton() {
      if (homeRef == "empty") {
        return CupertinoButton(
          child: Text("Click to Complete Profile Update "),
          onPressed: () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                  builder: (BuildContext context) => UpdateAccountPage()));

          },
          color: CupertinoColors.lightBackgroundGray,
        );
      } else if(homeRef!=null){
        return Container();
      }
    }

    print("--My detail List--profile.dart--");
    print(mydetailList);

    if (mydetailList.isEmpty) {
      return Container(
        child: Center(
          child: Text("Loading",
              style: CupertinoTheme.of(context)
                  .textTheme
                  .navActionTextStyle
                  .apply(color: CupertinoColors.activeBlue, fontSizeDelta: 22)),
        ),
      );
    }

    return Container(
      child: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 100,
            ),
            Center(
              child: CircleAvatar(
                radius: 70,
                backgroundImage: NetworkImage(
                    'https://blogs.psychcentral.com/life-goals/files/2018/09/mens-dress-guide-768x513.jpg'),
              ),
            ),
            Text(
              mydetailList[2],
              style: CupertinoTheme.of(context)
                  .textTheme
                  .navActionTextStyle
                  .apply(color: CupertinoColors.activeBlue, fontSizeDelta: 22),
            ),
            SizedBox(
              height: 20,
            ),
            CupertinoButton(
              child: Text('Home'),
              onPressed: () {},
              color: CupertinoColors.activeBlue,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(CupertinoIcons.location,
                    color: CupertinoColors.activeBlue),
                Text(
                  mydetailList[1],
                  style: CupertinoTheme.of(context)
                      .textTheme
                      .navActionTextStyle
                      .apply(
                        color: CupertinoColors.activeBlue,
                      ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(CupertinoIcons.mail, color: CupertinoColors.activeBlue),
                Text(
                  mydetailList[0],
                  style: CupertinoTheme.of(context)
                      .textTheme
                      .navActionTextStyle
                      .apply(
                        color: CupertinoColors.activeBlue,
                      ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(CupertinoIcons.phone, color: CupertinoColors.activeBlue),
                Text(
                  mydetailList[3],
                  style: CupertinoTheme.of(context)
                      .textTheme
                      .navActionTextStyle
                      .apply(
                        color: CupertinoColors.activeBlue,
                      ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(CupertinoIcons.flag, color: CupertinoColors.activeBlue),
                Text(
                  homeRef,
                  style: CupertinoTheme.of(context)
                      .textTheme
                      .navActionTextStyle
                      .apply(
                        color: CupertinoColors.activeBlue,
                      ),
                ),
              ],
            ),
             SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                continueUpdateButton()
              ],
            )

            //Chip(label: Text('Home'),)
          ],
        ),
      ),
    );
  }
}
