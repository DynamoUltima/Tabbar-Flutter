import 'package:flutter/material.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Container(
        height: 150.0,
      ),
      DefaultTabController(
          length: 2,
          initialIndex: 0,
          child: Padding(
            padding: const EdgeInsets.all(58.0),
            child: Column(
              children: [
                Container(
                  color: Colors.pink,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TabBar(
                    //  indicatorSize: TabBarIndicatorSize.label,
                        indicator: BubbleTabIndicator(
                           indicatorHeight: 30,
                          indicatorColor: Colors.blueAccent
                        ),
                        // isScrollable: true,
                        labelColor: Colors.black,
                        tabs: [
                          Tab(
                            text: 'Home',
                          ),
                          Tab(text: 'News')
                        ]),
                  ),
                ),
                SizedBox(height: 5,),
                Container(
                    color: Colors.blue,
                    height: 300.0,
                    child: TabBarView(
                      children: [
                        Center(child: Text('Home here')),
                        Center(child: Text('News here')),
                      ],
                    ))
              ],
            ),
          ))
    ]);
  }
}
