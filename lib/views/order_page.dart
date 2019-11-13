import 'dart:core' as prefix0;
import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tabbar/pages/cupertino_activities.dart';
import 'package:tabbar/services/services.dart';

class OrderPage extends StatefulWidget {
  OrderPage({Key key}) : super(key: key);

  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  bool washandFoldValue = true;
  bool laundryValue = false;
  bool dryCleaningValue = false;
  bool pressValue = false;

  int washAndFold = 1;
  int laundry = 0;
  int dryCleaning = 0;
  int press = 0;

  String currentOrderTimeValue;
  String currentDeliveryDateValue;
  String smsPhoneNumber = "0502911370,0277073834";
  String smsMessage = "this is a test";
  String serverCode = "";

  //TODO:serverCode is not upposed to be empty

  TextEditingController _noteController = TextEditingController();
  TextEditingController _promoCodeController = TextEditingController();

  DateTime _dateTime = DateTime.now();

  _myCuperStyle(BuildContext context) {
    var cuperStyle = CupertinoTheme.of(context)
        .textTheme
        .navTitleTextStyle
        .apply(color: CupertinoColors.activeBlue);
    return cuperStyle;
  }

  String user_list_key = "list_key";
  List<String> mydetailList = [];

  @override
  void initState() {
    super.initState();
    const MethodChannel('plugins.flutter.io/shared_preferences')
        .setMockMethodCallHandler(
      (MethodCall methodCall) async {
        if (methodCall.method == 'getAll') {
          return {"flutter." + user_list_key: "No Name saved"};
        }
        return null;
      },
    );

    loadList();
  }

  //check main.dart for positions for sharedpreferences
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

  RedirectPage() {
    return Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (BuildContext context) => CupertinoActivities(),
      ),
    );
  }
  /**
   * TH1172652
   * day month date hour secs
   * 
   * strDatePickup = calInitial.get(Calendar.YEAR) + "/" + (calInitial.get(Calendar.MONTH)+1) + "/" + calInitial.get(Calendar.DATE);
   *
   * how to get the message (this is used with a boolean for home or office)
   *  message = "FORHEY ORDER\n" + "Name: " + personalInfo.getName() + "\nDate: "
                            + pickupDateString +  " \nAddress: Office \nPhone #: "
                            + personalInfo.getPhone() + "\nLocation: " + loc
                            +"\nCompany: " +lm.getCompanyName() + "\nStreet: " + lm.getOfficeHseNum() + " " + lm.getOfficeStreet()
                            + "\nOrder #: " + serverid ;



   */

  @override
  Widget build(BuildContext context) {
    var orderNote = Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 5,
        child: CupertinoTextField(
          padding: EdgeInsets.all(16),
          controller: _noteController,
          // maxLength: 3,
          placeholder: 'Enter your note',
          placeholderStyle: TextStyle(color: CupertinoColors.white),
          decoration: BoxDecoration(color: CupertinoColors.inactiveGray),
        ),
      ),
    );

    CupertinoDatePicker orderDateCard = CupertinoDatePicker(
      maximumDate: _dateTime.add(new Duration(
        days: 1,
      )),
      minimumDate: _dateTime.subtract(new Duration(days: 1)),
      initialDateTime: DateTime.now().subtract(new Duration(days: 1)),
      mode: CupertinoDatePickerMode.dateAndTime,
      use24hFormat: false,
      onDateTimeChanged: (DateTime value) {
        setState(() {
          currentOrderTimeValue = "${value}";
        });
        setState(() {
          currentDeliveryDateValue = "${value.add(new Duration(days: 1))}";
        });
        print(value);
        if (value.hour > 12) {
          showDialog(
            context: context,
            builder: (_) => CupertinoAlertDialog(
              title: Text(
                ' Inappropraite Time',
                style: TextStyle(
                  color: CupertinoColors.activeBlue,
                ),
              ),
              content: Text(
                'Pick up hours is between 7am and 12am',
                style: TextStyle(fontSize: 22),
              ),
            ),
          );
        }
      },
    );

    var typeOfServiceCard = Card(
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
                      value: washandFoldValue,
                      onChanged: (bool value) {
                        setState(() {
                          washandFoldValue = value;
                        });
                        if (value = true) {
                          setState(() {
                            washAndFold = 1;
                          });
                          print(washandFoldValue);
                          print(washAndFold);
                        } else {
                          setState(() {
                            washAndFold = 0;
                          });
                        }
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
                      value: laundryValue,
                      onChanged: (bool value) {
                        setState(() {
                          laundryValue = value;
                        });
                        print(laundryValue);
                        print(laundry);
                        if (value = true) {
                          setState(() {
                            laundry = 1;
                          });
                        } else {
                          setState(() {
                            laundry = 0;
                          });
                        }
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
                      value: dryCleaningValue,
                      onChanged: (bool value) {
                        setState(() {
                          dryCleaningValue = value;
                        });
                        if (value = true) {
                          setState(() {
                            dryCleaning = 1;
                          });
                        } else {
                          setState(() {
                            dryCleaning = 0;
                          });
                        }
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
                      value: pressValue,
                      onChanged: (bool value) {
                        setState(() {
                          pressValue = value;
                        });
                        if (value = true) {
                          setState(() {
                            press = 1;
                          });
                        } else {
                          setState(() {
                            press = 0;
                          });
                        }
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
    );

    return ListView(
      children: <Widget>[
        buildCupertinoNavigationBar(),
        buildGestureDetectorDateCard(context, orderDateCard),
        SizedBox(
          height: 10,
        ),
        typeOfServiceCard,
        SizedBox(
          height: 10,
        ),

        //note card
        orderNote,
        SizedBox(
          height: 10,
        ),
        //order button
        buildPaddingOrderPlacedButton(),
      ],
    );
  }
  //TODO: on the  the order page display when pick up is due

  Padding buildPaddingOrderPlacedButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CupertinoButton(
        onPressed: () async {
          //pick up point :obtain from sharedprefrences home or office
          //pick up date from date picker
          //pick up from time  and pick up to time is standard which is 7 to 12 am
          // note  from _notecontroller.text
          //delivery date  is date picker + 12 hours
          //delivery from and delivery to  is fixed  which is 4 to 7 pm
          //status fixed 1
          //usser_id :obtain eamil from sahred preferences
          //Add promo code section
          //                                                                                                                                                                                                                                                                                                                                                                         //pressonly       //home_service
          orderPlaced(
                  "addOrder",
                  /*pick_up_point*/ mydetailList[1],
                  /*pickup_date */ currentOrderTimeValue,
                  /*pick_from_time*/ "7:00",
                  /*pick_to_time*/ "12:00",
                  /*note*/ _noteController.text,
                  /*delivery date*/ currentDeliveryDateValue,
                  /*delivery_from_time*/ "4:00",
                  /*delivery_to_time*/ "7:00",
                  /*status*/ "0",
                  /*user_id*/ mydetailList[0],
                  /*pickup_to_hour*/ "12",
                  /*pickup_to_minute*/ "00",
                  /*pickup_from_hour*/ "7",
                  /*pickup_from_minute*/ "00",
                  /*delivery_from_hour*/ "4",
                  /*delivery_from_min*/ "00",
                  /* delivery_to_hour*/ "4",
                  /* delivery_to_min*/ "00",
                  /*promotion*/ "promotion",
                  /*promo_code*/ _promoCodeController.text??"no promo",
                  "${washAndFold}",
                  "${press}",
                  "${dryCleaning}",
                  "${press}",
                  /*home service*/ "0",
                  /*nameOfUser*/ mydetailList[2],
                  /*location*/ mydetailList[1],
                  /*other_location*/ mydetailList[4] ?? "empty",
                  /*server_code*/ "")
              .then((orderResponse) {
            print(orderResponse.statusCode);
            print(orderResponse.body);
            if (orderResponse.statusCode == 200) {
              showDialog(
                context: context,
                builder: (_) => CupertinoAlertDialog(
                  title: Text(
                    'Order Placed',
                    style: TextStyle(
                      color: CupertinoColors.activeBlue,
                    ),
                  ),
                ),
              );
            }
          }).catchError((onError) {
            print(onError);
          });

          //sends sms to heyTeam
          //double check on mumber
          //TODO: smsMessage is not yet active (it is null)
          //convert these to metods or functions
          sendSmsMessage(smsMessage, smsPhoneNumber).then((smsResponse) {
            print(smsResponse.body);
          }).catchError((onError) {
            print("smsError:" + onError);
          });

          notifySupport(
                  "complete_payment",
                  1,
                  serverCode,
                  mydetailList[2],
                  /**receipt */ "")
              .then((notifySupportValue) {
            print(notifySupportValue);
          }).catchError((onError) {
            print("notify support :" + onError);
          });
        },
        child: Text('Place Order'),
        color: CupertinoColors.activeBlue,
      ),
    );
  }

  CupertinoNavigationBar buildCupertinoNavigationBar() {
    return CupertinoNavigationBar(
      middle: Text('Order Page'),
      transitionBetweenRoutes: true,
      previousPageTitle: 'Order Activities',
      trailing: GestureDetector(
        child: Icon(CupertinoIcons.shopping_cart),
        onTap: () {
          showDialog(
          context: context,
          builder: (_) => CupertinoAlertDialog(
            title: Text('Enter Promo Code'),
            content: CupertinoTextField(
              controller: _promoCodeController,
            ),
          ),
        );
        },
      ),
    );
  }

  GestureDetector buildGestureDetectorDateCard(
      BuildContext context, CupertinoDatePicker orderDateCard) {
    return GestureDetector(
      onTap: () {
        var alertDate =
            '${_dateTime.day}/${_dateTime.add(new Duration(days: 1))}';
        var dateFormatter = new DateFormat.EEEE()
            .format(new DateTime.now().add(new Duration(days: 0)));

        showDialog(
          context: context,
          builder: (_) => CupertinoAlertDialog(
            title: Text('The Date and Time you selected'),
            content: Text('${dateFormatter}'),
          ),
        );
      },
      child: SizedBox(
        height: 200,
        child: orderDateCard,
      ),
    );
  }
}
