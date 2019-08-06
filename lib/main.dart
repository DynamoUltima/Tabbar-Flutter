import 'package:flutter/material.dart';

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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
    
    return Scaffold(
      
    
      body: Container(
        
        child: Padding(
          padding: const EdgeInsets.only(right: 50,left: 50),
          child: Column(
            
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: DefaultTabController(
                  length: 2,
                  child: Container(
                   // color: Colors.blueAccent,
                    
                    child: TabBar(
                      
                      // isScrollable: true,
                      indicatorPadding: EdgeInsets.only(),
                      unselectedLabelColor: Colors.black,
                      indicatorColor: Colors.amber,
                      labelColor: Colors.blue,
                      tabs: <Widget>[
                      Tab(icon: Icon(Icons.home),),
                      Tab(icon: Icon(Icons.accessible_forward),),
                    ],),
                  ),
                 
                 ),
    
              ),
              Container(
                color: Colors.blue,
                
              ),

              TabBarView(
                children: <Widget>[
                Icon(Icons.home,color: Colors.black,),
                Icon(Icons.accessible_forward,color: Colors.black,)

              ],)
            ],
          ),
        ),
      ),
      
    );
  }
}
