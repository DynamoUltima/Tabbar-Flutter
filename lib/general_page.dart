import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static Widget giveCenter(String myText,BuildContext context) {
    return Text('This is: $myText',style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle.apply(color: CupertinoColors.activeBlue),);
  }

  

  final Map<int, Widget> logoWidgets = const <int, Widget>{
    0: Text('Logo 1',style: TextStyle(color: Colors.blue),),
    1: Text("Logo 2",style: TextStyle(color: Colors.blue)),
    2: Text("Logo 3",style: TextStyle(color: Colors.blue))
  };
  int sharedValue = 0;

  @override
  Widget build(BuildContext context) {

   List<Widget> pages = [
    giveCenter('Logo 1',context),
    giveCenter('Logo 2',context),
    giveCenter('Logo 3',context)
  ];

    return Scaffold(
     appBar: CupertinoNavigationBar(
       previousPageTitle: 'Login',
       transitionBetweenRoutes: true,
       trailing: Text('Home Page',style: CupertinoTheme.of(context).textTheme.navTitleTextStyle.apply(color: CupertinoColors.activeBlue),),
     ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 500,
                child: Container(
                  
                  child: CupertinoSegmentedControl(
                    selectedColor: Colors.blue,
                    pressedColor: Colors.blueAccent,
                    children: logoWidgets,
                    onValueChanged: (value) {
                      setState(() {
                        sharedValue = value;
                      });
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: 50,),
            Column(children: <Widget>[Center(child: pages[sharedValue])])
          ],
        ),
      ),
    );
  }
}
