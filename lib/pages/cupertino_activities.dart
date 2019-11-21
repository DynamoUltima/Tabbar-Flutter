import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tabbar/customWidgets/cirlcle_animated_progress_bar.dart';
import 'package:tabbar/models/orderStatus/order_list.dart';
import 'package:tabbar/models/orderStatus/order_status.dart';
import 'package:tabbar/services/services.dart';
import 'package:tabbar/views/order_page.dart';

class CupertinoActivities extends StatefulWidget {
  @override
  _CupertinoActivitiesState createState() => _CupertinoActivitiesState();
}

class _CupertinoActivitiesState extends State<CupertinoActivities> {
  _myCuperStyle(BuildContext context) {
    var cuperStyle = CupertinoTheme.of(context)
        .textTheme
        .navTitleTextStyle
        .apply(color: CupertinoColors.activeBlue);
    return cuperStyle;
  }

  String tag = "getOrderbyServerCode";

  List<OrderList> orderDetailList = List<OrderList>();
  _getUserOrderStaus() {
    getOrderState(tag, "TU11122664").then((response) {
      print(response.statusCode);
      // print(mydetailList[0]);
      var detailMap = json.decode(response.body);

      OrderStatus orderStatus = OrderStatus();

      setState(() {
        orderStatus = OrderStatus.fromJson(detailMap);
      });
      print(orderStatus.toJson());

      orderDetailList = orderStatus.order_list;
    });
  }

  double progressPercent = 0;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    String tag = "getOrderbyServerCode";

    Color foreground = Colors.red;

    if (progressPercent >= 0.8) {
      foreground = Colors.green;
    } else if (progressPercent >= 0.4) {
      foreground = Colors.orange;
    }
    Color background = foreground.withOpacity(0.2);

    return Container(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            buildCircularProgress(background, foreground, context),
            SizedBox(
              height: 20,
            ),
            buildCupertinoGoToOrderButton(context),
            SizedBox(
              height: screenHeight * 0.1,
            ),
            SizedBox(
              width: screenWidth * 0.67,
              child: CupertinoButton(
                pressedOpacity: 0.5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Icon(CupertinoIcons.pencil),
                    Text("Tap for Order Details"),
                  ],
                ),
                onPressed: () {
                  buildShowCupertinoModalPopup(context);
                },
                color: CupertinoColors.lightBackgroundGray,
                borderRadius: BorderRadius.all(Radius.circular(18)),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future buildShowCupertinoModalPopup(BuildContext context) {
    return showCupertinoModalPopup(
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          title: Text('Order Details', textScaleFactor: 1.2),
          message: Text(
            r"Here's what's Happening with your order",
          ),
          actions: <Widget>[
            CupertinoActionSheetAction(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  CircleAvatar(
                    radius: 25,
                    child: Icon(CupertinoIcons.person_solid),
                    backgroundColor: CupertinoColors.activeBlue,
                  ),
                  Center(child: Text("Hey girl/guy : Frank Baidoo"))
                ],
              ),
              onPressed: () {
                Navigator.pop(context, '🙋 Yes');
              },
            ),
            CupertinoActionSheetAction(
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    // child: ListView.builder(
                    //   itemCount: orderDetailList.length,
                    //   itemBuilder: (BuildContext context, int index) {
                    //     String orderStatustText;
                    //     int orderProcessStatus =
                    //         int.parse(orderDetailList[index].status);
                    //     switch (orderProcessStatus) {
                    //       case 1:
                    //         setState(() {
                    //           orderStatustText = "On route to pick up";
                    //         });
                    //         break;
                    //       case 2:
                    //         setState(() {
                    //           orderStatustText =
                    //               "Your Articles are being processed";
                    //         });
                    //         break;
                    //       case 3:
                    //         setState(() {
                    //           orderStatustText = "On route to delivery";
                    //         });
                    //         break;
                    //       case 4:
                    //         setState(() {
                    //           orderStatustText =
                    //               "Your Articles have been delivered";
                    //         });
                    //         break;
                    //       default:
                    //     }

                    //     return Text("Order Status : " //+ 
                    //    // orderStatustText
                    //     );
                    //   },
                    // ),
                  )
                ],
              ),
              onPressed: () {
                Navigator.pop(context, '🙋 No');
              },
            ),
            CupertinoActionSheetAction(
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child:  Text("Delivery Date : " 
                      //+
                            //  orderDetailList[0].delivery_date
                              ),
                      
                    ),
                  )
                ],
              ),
              onPressed: () {
                Navigator.pop(context, '🙋 No');
              },
            ),
            CupertinoActionSheetAction(
              child: Row(
                children: <Widget>[
                  Padding(
                    //cost
                    padding: const EdgeInsets.all(8.0),
                    child: 
                         Text(
                            "cost : " //+ orderDetailList[0].service_cost
                            ),
                      
                    
                  )
                ],
              ),
              onPressed: () {
                Navigator.pop(context, '🙋 No');
              },
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            child: Text('Cancel'),
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context, 'Cancel');
            },
          ),
        );
      },
      context: context,
    );
  }

  CupertinoButton buildCupertinoGoToOrderButton(BuildContext context) {
    return CupertinoButton(
      child: Text('Go To Order'),
      onPressed: () {
        Navigator.of(context).push(
            CupertinoPageRoute(builder: (BuildContext context) => OrderPage()));
      },
      color: CupertinoColors.activeBlue,
    );
  }

  Center buildCircularProgress(
      Color background, Color foreground, BuildContext context) {
    //int orderProcessStatus =int.parse(orderDetailList[index].status);

    return Center(
      child: SizedBox(
        height: 200,
        width: 200,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            CircleProgressBar(
              backgroundColor: background,
              foregroundColor: foreground,
              value: 0.4,
            ),
            ConstrainedBox(
              child: Text(
                'Your Articles are being processed',
                textAlign: TextAlign.center,
                style: _myCuperStyle(context),
              ),
              constraints: BoxConstraints(maxWidth: 100),
            )
          ],
        ),
      ),
    );
  }
}

class OrderSatus {}
