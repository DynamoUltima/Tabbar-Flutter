import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:tabbar/customWidgets/myTextStyle.dart';
import 'package:tabbar/models/orderHistory/order_history_list.dart';
import 'package:tabbar/models/orderHistory/order_history_response.dart';

import 'package:tabbar/services/services.dart';

class OrderHistoryPage extends StatefulWidget {
  String clientEmail;

  OrderHistoryPage({this.clientEmail});

  @override
  _OrderHistoryPageState createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  myTextStyle myTextType = new myTextStyle();
  //var date = new DateTime.now();
  String tag = "orderDetails";
  String user_list_key = "list_key";
  List<String> mydetailList = [];
  //String email
  // String prefEmail = "hh";

  Future<List<String>> getUserList() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getStringList(user_list_key);
  }

  List<OrderHistoryList> orderDetailList = List<OrderHistoryList>();

  _getUserOrderHistory() {
    getOrderHistory(tag, widget.clientEmail).then((response) {
      // print(response.statusCode);

      // print(mydetailList);
      var historyMap = json.decode(response.body);

      OrderHistory orderHistory = OrderHistory();

      setState(() {
        orderHistory = OrderHistory.fromJson(historyMap);
      });

      orderDetailList = orderHistory.order_list;
    });
  }

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
    _getUserOrderHistory();
  }

  // dispose() {
  //   super.dispose();
  // }

  loadList() {
    getUserList().then((onValue) {
      setState(() {
        mydetailList = onValue;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    if (mydetailList.isEmpty) {
      //print("list was empty for a while");
      //  var id = new DateTime.now().millisecondsSinceEpoch;
      //  var now = new DateTime.now();
      //  var nowTime = DateFormat("d MMMM yyyy").format(now);
      //  var dTime = DateFormat("d ").format(now);
      //  var dayTime = DateFormat("EEE ").format(now);
      //  var mTime = DateFormat("M").format(now);
      //  var hrTime = DateFormat("k ").format(now);
      //  var secTime = DateFormat("s  ").format(now);

      //  print(dayTime);
      //  print(mTime);
      //  print(dTime);
      //  print(hrTime);
      //  print(secTime);

      //  print(dayTime.substring(0,2).toUpperCase());

      return Container(
        child: Center(
          child: Text("Loading", style: myTextType.myLargeCuperStyle(context)),
        ),
      );
    }
    var pageTtitleText = Row(
      children: <Widget>[
        Text(
          'Order History',
          style: myTextType.myLargeCuperStyle(context),
        ),
      ],
    );

    HistoryCardMethod(String date, String address, String orderId,
        String paymentStatus, String orderStatus, String orderType) {
      var historyCard = Container(
        color: CupertinoColors.lightBackgroundGray,
        padding: EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(CupertinoIcons.news),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '${date}',
                      style: myTextType.myActionCuperStyle(context),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(CupertinoIcons.time),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      orderStatus,
                      style: myTextType.myActionCuperStyle(context),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // Row(
                //   children: <Widget>[
                //     Icon(CupertinoIcons.tag),
                //     SizedBox(
                //       width: 5,
                //     ),
                //     Text(
                //       orderType,
                //       style: myTextType.myActionCuperStyle(context),
                //     )
                //   ],
                // ),
                // Row(
                //   children: <Widget>[
                //     Icon(CupertinoIcons.bookmark),
                //     SizedBox(
                //       width: 5,
                //     ),
                //     Text(
                //       paymentStatus,
                //       style: myTextType.myActionCuperStyle(context),
                //     )
                //   ],
                // )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(CupertinoIcons.location),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Address: ${address}',
                      style: myTextType.myActionCuperStyle(context),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(CupertinoIcons.eye),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Order # ${orderId}',
                      style: myTextType.myActionCuperStyle(context),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      );

      return historyCard;
    }

    if (orderDetailList == null) {
      print("array is empty");
      return CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            previousPageTitle: "Activities",
          ),
          child: Center(
              child: Text(
            "No History",
            style: myTextType.myLargeCuperStyle(context),
          )));
    }

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        previousPageTitle: 'Activities',
        middle: Text('Order History'),
      ),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 70,
              ),
              pageTtitleText,
              ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: orderDetailList.length ?? 0,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  // if(orderDetailList==null){
                  //   print("array is empty");
                  // }
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: HistoryCardMethod(
                        orderDetailList[index].pick_up_date,
                        orderDetailList[index].pick_up_point,
                        orderDetailList[index].server_code,
                        "paymentStatus",
                        "orderStatus",
                        "orderType"),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
