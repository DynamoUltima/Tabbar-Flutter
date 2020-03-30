

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tabbar/adaptive_widgets.dart';
import 'package:tabbar/customWidgets/myTextStyle.dart';
import 'package:tabbar/home/log_in.dart';


import 'package:tabbar/pages/cupertino_pricing.dart';
import 'package:tabbar/pages/cupertino_profile.dart';
import 'package:tabbar/pages/home_page.dart';
import 'package:tabbar/shared/constant.dart';
import 'package:tabbar/views/history_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tabbar/views/settings.dart';
import 'pages/cupertino_activities.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();

  // void logout() {}

}

class _HomePageState extends State<HomePage> {
  
  List<String> mydetailList = [];
  int sharedValue = 0;
  double progressPercent = 0;
  String clientEmail;
  

  String userName;

  Future _checkUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getString("userName") != null) {
      setState(() {
        userName = prefs.getString("userName");
      });
    }

    print("printing pref user name--general/HomePage");
    print(userName);
  }

  Future<List<String>> getUserList() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getStringList(user_list_key);
  }

  loadList() {
    getUserList().then((onValue) {
      setState(() {
        mydetailList = onValue;
      });
    });
  }

  Future _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isLogin", false);
    // Navigator.popUntil(context, ModalRoute.withName("MyHome"));

    //Navigator.pop(context);

    //SystemNavigator.pop();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => LoginPage(),
      ),
    );

    // exit(0);
  }

  Future _checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getBool("isLogin") == false) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => LoginPage(),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _checkUser();
    _checkLogin();

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

    //_Logout();
  }

  @override
  Widget build(BuildContext context) {

    
  
    print("--Print Preferences---");
    // print(mydetailList);
    // CupertinoTheme cupertinoTheme;

    setState(() {
      clientEmail = mydetailList[0];
    });

    // print("---client Email--");
    // print(clientEmail);

    return Container(
      child: CupertinoPageScaffold(
        child: CupertinoTabScaffold(
         // backgroundColor: CupertinoColors.white,
          tabBar: CupertinoTabBar(
            backgroundColor: CupertinoColors.white,
            items: [
              // BottomNavigationBarItem(
              //   icon: Icon(CupertinoIcons.home),
              //   title: Text('Home'),
              // ),
              BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.briefcase),
                  title: Text('Activities')),
              BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.moneyBill),
                  title: Text('Pricing')),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.person), title: Text('Profile')),
            ],
          ),
          tabBuilder: (BuildContext context, int index) {
            assert(index >= 0 && index <= 2);

            switch (index) {
              // case 0:
              //   return CupertinoTabView(
              //     builder: (context) => CupertinoPageScaffold(
              //       navigationBar: CupertinoNavigationBar(
              //         middle: (index == 0) ? Text('Home') : Text('School'),
              //         trailing: GestureDetector(
              //           child: Text("Logout",
              //               style: TextStyle(
              //                   color: CupertinoColors
              //                       .activeBlue)), //CupertinoIcons.restart
              //           onTap: () {
              //             _logout();
              //           },
              //         ),
              //       ),
              //       child: CupertinoHome(),
              //     ),
              //   );
              //   break;
              case 0:
                return CupertinoTabView(
                  builder: (context) => CupertinoPageScaffold(
                    navigationBar: CupertinoNavigationBar(
                      leading: GestureDetector(
                        onTap: () {
                          _logout();
                        },
                        child: Center(
                          child: Text(
                            "Logout",
                            style: myTextStyle().myCuperStyle(context)
                            //TextStyle(color: CupertinoColors.activeBlue),
                          ),
                        ),
                      ),
                      middle: (index == 0) ? Text('Activities') : null,
                      trailing: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (BuildContext context) =>
                                  OrderHistoryPage(clientEmail: clientEmail),
                            ),
                          );
                        },
                        child: Text(
                          'Order History',
                          style: TextStyle(color: CupertinoColors.activeBlue),
                        ),
                      ),
                    ),
                    child: CupertinoActivities(clientEmail:clientEmail),
                  ),
                );
                break;
              case 1:
                return CupertinoTabView(
                  builder: (context) => CupertinoPageScaffold(
                    navigationBar: CupertinoNavigationBar(
                        middle: (index == 1) ? Text('Pricing') : null),
                    child: CupertinoPricing(),
                    // child: Text('data'),
                  ),
                );
                break;
              case 2:
                return CupertinoTabView(
                  builder: (context) => CupertinoPageScaffold(
                    navigationBar: CupertinoNavigationBar(
                      middle: (index == 2) ? Text('Profile') : null,
                      trailing: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              CupertinoPageRoute(
                                builder: (BuildContext context) =>
                                    AllSettings(),
                              ),
                            );
                          },
                          child: Icon(CupertinoIcons.settings,
                              color: CupertinoColors.activeBlue)),
                    ),
                    child: CupertinoProfile(),
                  ),
                );
                break;
            }
            return null;
          },
        ),
      ),
    );
  }
}

class VeggieCard extends StatelessWidget {
  Widget _buildDetails(AdaptiveTextThemeData textTheme, BuildContext context) {
    return AdaptiveBackground(
      color: Color.lerp(CupertinoColors.white, CupertinoColors.white, 0.15)
          .withAlpha(140),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Wash and Fold',
              style: CupertinoTheme.of(context)
                  .textTheme
                  .navTitleTextStyle
                  .copyWith(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.6,
                      color: CupertinoColors.activeBlue),
              // textTheme.headline,
            ),
            SizedBox(height: 4),
            Text(
              'This is a more effective way of removing stains',
              style: CupertinoTheme.of(context)
                  .textTheme
                  .navTitleTextStyle
                  .copyWith(
                    color: Color(0xDE000000),
                    fontSize: 14,
                    letterSpacing: 0.1,
                  ),
            ),
          ],
        ),
      ),
    );
  }
  //TODO :MAKE FLAT CARD COLOR TRANSPARENT

  @override
  Widget build(BuildContext context) {
    final textTheme = AdaptiveTextTheme.of(context);
    String url =
        'http://infocall.bg/backgrounds/935/lateda---lidiia-jordanova-et-22645.jpg';

    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: null,
      pressedOpacity: 0.7,
      child: FlatCard(
        height: 340,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              url,
              fit: BoxFit.cover,
              semanticLabel: 'A card background featuring Forhey',
            ),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: _buildDetails(textTheme, context),
            ),
          ],
        ),
      ),
    );
  }
}

class FlatCard extends StatelessWidget {
  const FlatCard({this.height, this.width, @required this.child});

  final double height;
  final double width;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        border: Border.all(
            width: 1 / MediaQuery.of(context).devicePixelRatio,
            color: CupertinoColors.lightBackgroundGray),
        shape: BoxShape.rectangle,
      ),
      height: height,
      width: width,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        child: child,
      ),
    );
  }
}
