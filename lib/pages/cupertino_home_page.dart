import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tabbar/customWidgets/myTextStyle.dart';
import 'package:tabbar/general_page.dart';

class CupertinoHome extends StatefulWidget {
  @override
  _CupertinoHomeState createState() => _CupertinoHomeState();
}

class _CupertinoHomeState extends State<CupertinoHome> {
  static String cardMessage =
      "Forhey is the solution you have been waiting for";
  List<String> myfirstList = [
    'Forhey is the solution you have been waiting for',
    'Forhey is the solution you have been waiting for',
    '${cardMessage}',
    cardMessage,
  ];
  List<Widget> myIntList = [
    VeggieCard(),
    VeggieCard(),
    VeggieCard(),
    VeggieCard(),
  ];
  myTextStyle myTextType = new myTextStyle();

  List<String> _currencies = <String>[
    "Adenta",
    "Achimota",
    "Adjiringanor",
    "Agbogba",
    "Ashongman",
    "Airport Residential Area",
    "Asylum Down",
    "Botwe",
    "Cantoments",
    "East Legon",
    "East Legon Hills",
    "Haatso",
    "Kanda",
    "Labone",
    "Lake Side Estate",
    "Madina",
    "North Legon",
    "Osu",
    "Oyaifa",
    "Ridge",
    "Regimanuel Estate",
    "Sakumono",
    "Shiashe",
    "Spintex",
    "Tesano",
    "Trsaco Valley",
    "University Of Ghana",
    "Universty of Professional Studies",
    "West Legon",
    "37",
    "Other"
  ];

  //

  @override
  initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    var mytext = myTextStyle();

    return Container(
      child: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.lerp(Alignment.topCenter, Alignment.center, 0.5),
          children: <Widget>[
            Column(
              children: <Widget>[
                Image.asset("assets/trees.jpg"),
                InfoCard(screenHeight: screenHeight, screenWidth: screenWidth, mytext: mytext),
                LocationList(currencies: _currencies, screenWidth: screenWidth, mytext: mytext),
                
              ],
            ),
            Center(
              child: SizedBox(
                height: 100,
                width: screenWidth * 0.6,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        "Welcome Back Joel",
                        style: mytext.myDefaultCuperStyle(
                            context, 24, CupertinoColors.activeBlue),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({
    Key key,
    @required this.screenHeight,
    @required this.screenWidth,
    @required this.mytext,
  }) : super(key: key);

  final double screenHeight;
  final double screenWidth;
  final myTextStyle mytext;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: screenHeight * 0.1,
          ),
          SizedBox(
              width: screenWidth * 0.9,
              height: screenHeight * 0.2,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text("Contact Support",
                              style: mytext.myDefaultCuperStyle(
                                  context,
                                  32,
                                  CupertinoColors.black)

                              //textAlign: TextAlign.right,

                              ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            CupertinoIcons.mail,
                            color: CupertinoColors.activeBlue,
                          ),
                          Text(
                            "Email : support@forhey.com",
                            style: mytext.myCuperStyle(context),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            CupertinoIcons.phone,
                            color: CupertinoColors.activeBlue,
                          ),
                          Text(
                            "phone : 024xxxxxx",
                            style: mytext.myCuperStyle(context),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}

class LocationList extends StatelessWidget {
  const LocationList({
    Key key,
    @required List<String> currencies,
    @required this.screenWidth,
    @required this.mytext,
  }) : _currencies = currencies, super(key: key);

  final List<String> _currencies;
  final double screenWidth;
  final myTextStyle mytext;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: ListView.builder(
        itemCount: _currencies.length,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: screenWidth*0.5,
              child: CupertinoButton(
                color: CupertinoColors.lightBackgroundGray,
                child: Text(
                  "${_currencies[index]}",
                  style: mytext.myCuperStyle(context),
                ),
                onPressed: () {},
              ),
            ),
          );
        },
      ),
    );
  }
}
