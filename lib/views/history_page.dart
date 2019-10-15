import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:tabbar/customWidgets/myTextStyle.dart';

class OrderHistory extends StatefulWidget {
  @override
  _OrderHistoryState createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  myTextStyle myTextType = new myTextStyle();
  var date = new DateTime.now();

 

  @override
  Widget build(BuildContext context) {
    var pageTtitleText = Row(
      children: <Widget>[
        Text(
          'Order History',
          style: myTextType.myLargeCuperStyle(context),
        ),
      ],
    );


    var historyCard=Container(
              color: CupertinoColors.lightBackgroundGray,
              padding: EdgeInsets.all(8),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            'Order Placed',
                            style: myTextType.myActionCuperStyle(context),
                          )
                        ],
                      )
                    ],
                  ),
                   SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(CupertinoIcons.tag),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Type:Wash & Fold',
                            style: myTextType.myActionCuperStyle(context),
                          )
                        ],
                      ),
                       Row(
                        children: <Widget>[
                          Icon(CupertinoIcons.bookmark),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Payment Placed',
                            style: myTextType.myActionCuperStyle(context),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 10,),
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
                            'Address: Office',
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
                            'Order # M0429475',
                            style: myTextType.myActionCuperStyle(context),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            );


    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        previousPageTitle: 'Activities',
        middle: Text('Order History'),
      ),
      child: Container(
        padding: EdgeInsets.all(8),
        child: ListView(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            pageTtitleText,
            SizedBox(height: 20),
            historyCard,
            SizedBox(height: 10,),
            historyCard,
            SizedBox(height: 10,),
            historyCard,
            SizedBox(height: 10,),
            historyCard,
            SizedBox(height: 10,),
            historyCard,
            
          ],
        ),
      ),
    );
  }
}
