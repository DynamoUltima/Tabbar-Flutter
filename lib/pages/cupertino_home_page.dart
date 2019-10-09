import 'package:flutter/cupertino.dart';
import 'package:tabbar/customWidgets/myTextStyle.dart';
import 'package:tabbar/general_page.dart';

class CupertinoHome extends StatefulWidget {
  @override
  _CupertinoHomeState createState() => _CupertinoHomeState();
}

class _CupertinoHomeState extends State<CupertinoHome> {
  List myfirstList = [
    'Forhey is the solution you have been waiting for',
    'Forhey is the solution you have been waiting for',
    0,
    0
  ];
  List<Widget> myIntList = [
    VeggieCard(),
    VeggieCard(),
    VeggieCard(),
    VeggieCard(),
  ];
  myTextStyle myTextType = new myTextStyle();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    firstRow(int position) {
      // var firstRower = Row(
      //   children: <Widget>[
      //     Text(
      //       '${myfirstList[position]}',
      //       style: myTextType.myCuperStyle(context),
      //     ),
      //   ],
      // );

      return myIntList[position];
    }

    seperatorRower(int position) {
      var sepratorRow = Container(
        margin: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          color: CupertinoColors.activeBlue,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: screenHeight * 0.35,
              //
              color: CupertinoColors.activeBlue,
              child: Center(
                child: ConstrainedBox(
                  child: Text(
                    '${myfirstList[position]}',
                    textAlign: TextAlign.center,
                    style: myTextType.myDefaultCuperStyle(
                        context, 30, CupertinoColors.white),
                  ),
                  constraints: BoxConstraints(maxWidth: 250),
                ),
              ),
            ),
          ],
        ),
      );

      if (position % 2 == 0) {
        return sepratorRow;
      } else {
        return Row();
      }
    }

    return Container(
      child: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return firstRow(index);
        },
        itemCount: myfirstList.length,
        separatorBuilder: (BuildContext context, int index) {
          return seperatorRower(index);
        },
      ),
    );
  }
}

// ListView(
//   padding: EdgeInsets.all(16.0),
//   children: <Widget>[
//     SizedBox(
//       height: 20,
//     ),
//     VeggieCard(),
//     SizedBox(
//       height: 10,
//     ),
//     VeggieCard(),
//     SizedBox(
//       height: 10,
//     ),
//     VeggieCard(),
//     SizedBox(
//       height: 10,
//     ),
//     VeggieCard(),
//     SizedBox(
//       height: 10,
//     ),
//   ],
// ),
