import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tabbar/customWidgets/cirlcle_animated_progress_bar.dart';
import 'package:tabbar/models/orderStatus/assignees.dart';
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
  String orderStatusText ="hi";
  String heyGender;
  String assigneeName;
  String assigneeUrl;
  double circleProgress;

  Color foreground = Colors.red;
  Color liveButtonColor = CupertinoColors.activeBlue;
  Color disabledButtonColor = CupertinoColors.lightBackgroundGray;
  Color currentOrderButtonColor;
  Color currentDetailButtonColor;

  List<OrderList> orderDetailList = List<OrderList>();
  List<Assignees> assigneeDetailList = List<Assignees>();
  String orderProcessStatus;

  String currentServerCode;
  

  _getUserOrderStatus() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();

    currentServerCode = prefs.getString("persistedCode");

    //currentServerCode is supposed to be where  the current code is at the moment



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

      assigneeDetailList = orderStatus.assignees;

      setState(() {
        orderProcessStatus=orderDetailList[0].status;
      });

      print(orderDetailList.length);
      //print(orderDetailList[0].status);
    }).catchError((onError) {
      print(onError);
    });
  }

  void generateAssigneeDetails() {
    if (assigneeDetailList[1].gender == "m") {
      setState(() {
        heyGender = "Heyguy :";
      });
    } else {
      setState(() {
        heyGender = "Heygirl :";
      });
    }

    //String assigneeEmail=orderDetailList[0].assigned_to;
    //int gridIndex = privilegeItems.indexWhere((p) => p.code == code);
    setState(() {
      assigneeName = assigneeDetailList[1].name;
    });
  }

 generateOrderStatusMethod() {

    
    //orderProcessStatus = orderDetailList[0].status;
    // if(orderProcessStatus==null){
    //   return Center(child: CupertinoActivityIndicator(),);
    // }
    

    //print(orderProcessStatus);
    print('tapped');

    switch (orderProcessStatus) {
      case "1":
        setState(() {
          orderStatusText = "On route to pick up";
          circleProgress = 0.25;
          foreground = Colors.red;
          currentDetailButtonColor = liveButtonColor;
        });
        break;
      case "2":
        setState(() {
          orderStatusText = "Your Articles are being processed";
          circleProgress = 0.5;
          foreground = Colors.orange;
          currentDetailButtonColor = liveButtonColor;
          currentOrderButtonColor = disabledButtonColor;
        });
        break;
      case "3":
        setState(() {
          orderStatusText = "On route to delivery";
          currentDetailButtonColor = liveButtonColor;
          currentOrderButtonColor = disabledButtonColor;
        });
        setState(() {
          circleProgress = 0.75;
          foreground = Colors.yellow;
        });

        break;
      case "4":
        setState(() {
          orderStatusText = "Your Articles have been delivered";
          circleProgress = 1.0;
          foreground = Colors.green;
          currentDetailButtonColor = liveButtonColor;
          currentOrderButtonColor = disabledButtonColor;
        });
        break;
      default:
        setState(() {
          orderStatusText = "Place An Order";
          circleProgress = 0.0;
          currentDetailButtonColor = disabledButtonColor;
          currentOrderButtonColor = liveButtonColor;
          foreground = Colors.purple;
        });
    }

    //print(orderStatusText);

    //return orderStatustText;
  }

  @override
  void initState() {
    super.initState();
    _getUserOrderStatus();
    //generateOrderStatusMethod();
   
   
  }

  double progressPercent = 0;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    // double screenWidth = MediaQuery.of(context).size.width;

    generateOrderStatusMethod();

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
            CupertinoButton(
              pressedOpacity: 0.5,
              child: Text("Tap for Order Details"),
              onPressed: () {
                _getUserOrderStatus();
                generateAssigneeDetails();
                generateOrderStatusMethod();
                buildShowCupertinoModalPopup(context);
              },
              color: currentDetailButtonColor,
              borderRadius: BorderRadius.all(Radius.circular(18)),
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
                  AssigneeAvatar(),
                  Center(child: Text("${heyGender}" + " ${assigneeName}"))
                ],
              ),
              onPressed: () {
                Navigator.pop(context, '🙋 Yes');
              },
            ),
            CupertinoActionSheetAction(
              child: Row(
                children: <Widget>[Text(orderStatusText)],
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
                      child: Text(
                          "Delivery Date : " + orderDetailList[0].pickup_date),
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
                    child: Text("cost : " + orderDetailList[0].service_cost),
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

  CircleAvatar buildAssigneeCircleAvatarDefault() {
    return CircleAvatar(
      radius: 25,
      child: Icon(CupertinoIcons.person_solid),
      backgroundColor: CupertinoColors.activeBlue,
    );
  }

  CircleAvatar buildAssigneeCircleAvatar() {
    return CircleAvatar(
      radius: 25,
      backgroundImage: NetworkImage(assigneeDetailList[1].image),
    );
  }

  CircleAvatar AssigneeAvatar() {
    if (assigneeDetailList[1].image != null) {
      return buildAssigneeCircleAvatar();
    } else {
      return buildAssigneeCircleAvatarDefault();
    }
  }

  CupertinoButton buildCupertinoGoToOrderButton(BuildContext context) {
    return CupertinoButton(
      child: Text('Go To Order'),
      onPressed: () {
        Navigator.of(context).push(
            CupertinoPageRoute(builder: (BuildContext context) => OrderPage()));
      },
      color: currentOrderButtonColor,
    );
  }

  Center buildCircularProgress(
      Color background, Color foreground, BuildContext context) {

        // if(orderStatusText==null){
        //  return Center(child: CupertinoActivityIndicator());
        // }
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
              value: circleProgress,
            ),
            ConstrainedBox(
              child: Text(
                orderStatusText, //Strting ArticleValue
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

// class OrderSatus {}
