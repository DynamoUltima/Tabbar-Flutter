import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//import 'adaptive_widgets.dart';
//import 'package:cupertino_icons/placeholder.txt';
import 'package:tabbar/adaptive_widgets.dart';
import 'package:tabbar/chipper.dart';
import 'package:tabbar/views/order_page.dart';
//import 'package:percent_indicator_example/sample_circular_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static Widget giveCenter(String myText, BuildContext context) {
    return Text(
      'This is: $myText',
      style: CupertinoTheme.of(context)
          .textTheme
          .navLargeTitleTextStyle
          .apply(color: CupertinoColors.activeBlue),
    );
  }

  _myCuperStyle(BuildContext context) {
    var cuperStyle = CupertinoTheme.of(context)
        .textTheme
        .navTitleTextStyle
        .apply(color: CupertinoColors.activeBlue);
    return cuperStyle;
  }

  int sharedValue = 0;

  @override
  Widget build(BuildContext context) {
    // CupertinoTheme cupertinoTheme;
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
      // 2: Text("Logo 3",
      //     style: CupertinoTheme.of(context)
      //         .textTheme
      //         .navActionTextStyle
      //         .apply(color: CupertinoColors.activeBlue))
    };

    List<Widget> pages = [
      giveCenter('Price', context),
      giveCenter('Estimate', context),
      // giveCenter('Logo 3', context)
    ];

    return CupertinoPageScaffold(
      // navigationBar: CupertinoNavigationBar(
      //   previousPageTitle: 'Login',
      //   transitionBetweenRoutes: true,
      //   trailing: Text(
      //     'Home Page',
      //     style: CupertinoTheme.of(context)
      //         .textTheme
      //         .navTitleTextStyle
      //         .apply(color: CupertinoColors.activeBlue),
      //   ),
      // ),
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home), title: Text('Home')),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.bell_solid),
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
                      // previousPageTitle: (index == 0) ? 'Login': null,
                      middle: (index == 0) ? Text('Home') : Text('School')),
                  child: ListView(
                    padding: EdgeInsets.all(16.0),
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      VeggieCard(),
                      SizedBox(
                        height: 10,
                      ),
                      VeggieCard(),
                      SizedBox(
                        height: 10,
                      ),
                      VeggieCard(),
                      SizedBox(
                        height: 10,
                      ),
                      VeggieCard(),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                  // child: Text('data'),
                ),
              );
              break;
            case 1:
              return CupertinoTabView(
                builder: (context) => CupertinoPageScaffold(
                    navigationBar: CupertinoNavigationBar(
                        middle: (index == 1) ? Text('Activities') : null),
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          // SizedBox(
                          //   height: 150,
                          // ),

                          Center(
                            child: Stack(
                              alignment: Alignment.center,
                              children: <Widget>[
                                SizedBox(
                                  height: 200,
                                  width: 200,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 9,
                                    value: 0.5,
                                    semanticsValue: 'Text',
                                    semanticsLabel: '7',
                                  ),
                                ),
                                ConstrainedBox(
                                  child: Text(
                                    'Your Articles are being processed',
                                    textAlign: TextAlign.center,
                                    style: _myCuperStyle(context),
                                  ),
                                  constraints: BoxConstraints(maxWidth: 150),
                                )
                              ],
                            ),
                          ),
                          // SizedBox(
                          //   height: 20,
                          // ),

                          CupertinoButton(
                            child: Text('Place Order'),
                            onPressed: () {
                              Navigator.of(context).push(CupertinoPageRoute(
                                  builder: (BuildContext context) =>
                                      OrderPage()));
                            },
                            color: CupertinoColors.activeBlue,
                          )

                          // CircularPercentIndicator(
                          //   radius: 60.0,
                          //   lineWidth: 5.0,
                          //   percent: 1.0,
                          //   center: new Text("100%"),
                          //   progressColor: Colors.green,
                          // ),
                        ],
                      ),
                    )

                    // child: Text('data'),
                    ),
              );
              break;
            case 2:
              return CupertinoTabView(
                builder: (context) => CupertinoPageScaffold(
                  navigationBar: CupertinoNavigationBar(
                      middle: (index == 2) ? Text('Pricing') : null),
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
                      SizedBox(
                        height: 50,
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
                  // child: Text('data'),
                ),
              );
              break;
            case 3:
              return CupertinoTabView(
                builder: (context) => CupertinoPageScaffold(
                  navigationBar: CupertinoNavigationBar(
                      middle: (index == 3) ? Text('Profile') : null),
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
                          'Johnson James',
                          style: CupertinoTheme.of(context)
                              .textTheme
                              .navActionTextStyle
                              .apply(
                                  color: CupertinoColors.activeBlue,
                                  fontSizeDelta: 22),
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
                              'Accra,Haatso',
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
                            Icon(CupertinoIcons.mail,
                                color: CupertinoColors.activeBlue),
                            Text(
                              'dynamo.joey@gmailgmail.com',
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
                            Icon(CupertinoIcons.phone,
                                color: CupertinoColors.activeBlue),
                            Text(
                              '+23326274457',
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
                            Icon(CupertinoIcons.flag,
                                color: CupertinoColors.activeBlue),
                            Text(
                              'near Mabey',
                              style: CupertinoTheme.of(context)
                                  .textTheme
                                  .navActionTextStyle
                                  .apply(
                                    color: CupertinoColors.activeBlue,
                                  ),
                            ),
                          ],
                        ),

                        //Chip(label: Text('Home'),)
                      ],
                    ),
                  ),
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
  // const VeggieCard(this.veggie, this.onPressed);

  //final VoidCallback onPressed;

  //final Veggie veggie;

  Widget _buildDetails(AdaptiveTextThemeData textTheme, BuildContext context) {
    return AdaptiveBackground(
      color: Color.lerp(CupertinoColors.white, Color(0x40de8c66), 0.15)
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
              fit: BoxFit.fitWidth,
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

//  appBar: CupertinoNavigationBar(
//        previousPageTitle: 'Login',
//        transitionBetweenRoutes: true,
//        trailing: Text('Home Page',style: CupertinoTheme.of(context).textTheme.navTitleTextStyle.apply(color: CupertinoColors.activeBlue),),
//      ),
//       body: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Column(
//           children: <Widget>[
//             SizedBox(height: 30,),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: SizedBox(
//                 width: 500,
//                 child: Container(

//                   child: CupertinoSegmentedControl(
//                     selectedColor: Colors.blue,
//                     pressedColor: Colors.blueAccent,
//                     children: logoWidgets,
//                     onValueChanged: (value) {
//                       setState(() {
//                         sharedValue = value;
//                       });
//                     },
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 50,),
//             Column(children: <Widget>[Center(child: pages[sharedValue])])
//           ],
//         ),
//       ),
//     );
