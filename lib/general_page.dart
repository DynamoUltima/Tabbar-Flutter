import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

//import 'adaptive_widgets.dart';
//import 'package:cupertino_icons/placeholder.txt';
import 'package:tabbar/adaptive_widgets.dart';

import 'package:tabbar/pages/cupertino_home_page.dart';
import 'package:tabbar/pages/cupertino_pricing.dart';
import 'package:tabbar/pages/cupertino_profile.dart';

import 'package:tabbar/views/settings.dart';

import 'pages/cupertino_activities.dart';
//import 'package:percent_indicator_example/sample_circular_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _myCuperStyle(BuildContext context) {
    var cuperStyle = CupertinoTheme.of(context)
        .textTheme
        .navTitleTextStyle
        .apply(color: CupertinoColors.activeBlue);
    return cuperStyle;
  }

  int sharedValue = 0;
  double progressPercent = 0;

  @override
  Widget build(BuildContext context) {
    // CupertinoTheme cupertinoTheme;

    return CupertinoPageScaffold(
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home), title: Text('Home')),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.folder_open),
                title: Text('Activities')),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.shopping_cart),
                title: Text('Pricing')),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.person), title: Text('Profile')),
          ],
        ),
        tabBuilder: (BuildContext context, int index) {
          assert(index >= 0 && index <= 3);

          switch (index) {
            case 0:
              return CupertinoTabView(
                builder: (context) => CupertinoPageScaffold(
                  navigationBar: CupertinoNavigationBar(
                    middle: (index == 0) ? Text('Home') : Text('School'),
                  ),
                  child: CupertinoHome(),
                ),
              );
              break;
            case 1:
              return CupertinoTabView(
                builder: (context) => CupertinoPageScaffold(
                  navigationBar: CupertinoNavigationBar(
                      middle: (index == 1) ? Text('Activities') : null,
                      trailing:Text('Order History',style:TextStyle(color: CupertinoColors.activeBlue) ,) ,),
                    
                  child: CupertinoActivities(),
                ),
              );
              break;
            case 2:
              return CupertinoTabView(
                builder: (context) => CupertinoPageScaffold(
                  navigationBar: CupertinoNavigationBar(
                      middle: (index == 2) ? Text('Pricing') : null),
                  child: CupertinoPricing(),
                  // child: Text('data'),
                ),
              );
              break;
            case 3:
              return CupertinoTabView(
                builder: (context) => CupertinoPageScaffold(
                  navigationBar: CupertinoNavigationBar(
                    middle: (index == 3) ? Text('Profile') : null,
                    trailing: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(CupertinoPageRoute(
                              builder: (BuildContext context) =>
                                  AllSettings()));
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
