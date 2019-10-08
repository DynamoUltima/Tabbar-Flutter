import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  OrderPage({Key key}) : super(key: key);

  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  int _radioValue1 = -1;

  bool monVal = false;
  bool tuVal = false;
  bool wedVal = false;

  _myCuperStyle(BuildContext context) {
    var cuperStyle = CupertinoTheme.of(context)
        .textTheme
        .navTitleTextStyle
        .apply(color: CupertinoColors.activeBlue);
    return cuperStyle;
  }

  void _handleRadioValueChange1(int value) {
    setState(() {
      _radioValue1 = value;

      switch (_radioValue1) {
        case 0:
          // Fluttertoast.showToast(msg: 'Correct !',toastLength: Toast.LENGTH_SHORT);
          // correctScore++;
          break;
        case 1:
        // Fluttertoast.showToast(msg: 'Try again !',toastLength: Toast.LENGTH_SHORT);
        // break;
        case 2:
        // Fluttertoast.showToast(msg: 'Try again !',toastLength: Toast.LENGTH_SHORT);
        // break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CupertinoNavigationBar(
          middle: Text('Order Page'),
          transitionBetweenRoutes: true,
          previousPageTitle: 'Order Activities',
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text('Choose a Time for Order',
                          style: _myCuperStyle(context))
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Radio(
                        value: 0,
                        groupValue: _radioValue1,
                        onChanged: _handleRadioValueChange1,
                      ),
                      Icon(
                        Icons.calendar_today,
                        color: CupertinoColors.activeBlue,
                      ),
                      Text('Tomorow : 20 -Sept,7am -12pm',
                          style: _myCuperStyle(context)),
                      SizedBox(
                        width: 15,
                      ),
                    ],
                  ),
                  Divider(
                    color: CupertinoColors.darkBackgroundGray,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Radio(
                        value: 1,
                        groupValue: _radioValue1,
                        onChanged: _handleRadioValueChange1,
                      ),
                      Icon(
                        Icons.calendar_today,
                        color: CupertinoColors.activeBlue,
                      ),
                      Text('Saturday : 21 -Sept,7am -12pm',
                          style: _myCuperStyle(context)),
                      SizedBox(
                        width: 15,
                      ),
                    ],
                  ),
                  Divider(
                    color: CupertinoColors.darkBackgroundGray,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Radio(
                        value: 2,
                        groupValue: _radioValue1,
                        onChanged: _handleRadioValueChange1,
                      ),
                      Icon(
                        Icons.calendar_today,
                        color: CupertinoColors.activeBlue,
                      ),
                      Text('Other :', style: _myCuperStyle(context)),
                      SizedBox(
                        width: 190,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 45,
        ),
        Card(
          margin: EdgeInsets.all(16),
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Type of Service',
                        style: _myCuperStyle(context),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // [Monday] checkbox
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Checkbox(
                          value: monVal,
                          onChanged: (bool value) {
                            setState(() {
                              monVal = value;
                            });
                          },
                        ),
                        Text("Wash & Fold", style: _myCuperStyle(context)),
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    // [Tuesday] checkbox
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Checkbox(
                          value: tuVal,
                          onChanged: (bool value) {
                            setState(() {
                              tuVal = value;
                            });
                          },
                        ),
                        Text("Laundry", style: _myCuperStyle(context)),
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    // [Wednesday] checkbox
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Checkbox(
                          value: wedVal,
                          onChanged: (bool value) {
                            setState(() {
                              wedVal = value;
                            });
                          },
                        ),
                        Text("Dry Cleaning", style: _myCuperStyle(context)),
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Checkbox(
                          value: wedVal,
                          onChanged: (bool value) {
                            setState(() {
                              wedVal = value;
                            });
                          },
                        ),
                        Text("Press Only", style: _myCuperStyle(context)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
