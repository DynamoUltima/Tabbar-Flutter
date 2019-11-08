import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tabbar/services/services.dart';

class OrderPage extends StatefulWidget {
  OrderPage({Key key}) : super(key: key);

  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  

  bool washandFoldValue = true;
  bool laundryValue = false;
  bool dryCleaningValue = false;
  bool pressValue= false;

  int washAndFold;
  int laundry;
  int dryCleaning;
  int press;


  TextEditingController _noteController =
      TextEditingController();
  DateTime _dateTime = DateTime.now();

  _myCuperStyle(BuildContext context) {
    var cuperStyle = CupertinoTheme.of(context)
        .textTheme
        .navTitleTextStyle
        .apply(color: CupertinoColors.activeBlue);
    return cuperStyle;
  }

  

  @override
  Widget build(BuildContext context) {
    var orderNote = Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 5,
        child: CupertinoTextField(
          padding: EdgeInsets.all(16),
          controller: _noteController,
          maxLength: 3,
          placeholder: 'Enter your note',
          placeholderStyle: TextStyle(color: CupertinoColors.white),
          decoration: BoxDecoration(color: CupertinoColors.inactiveGray),
        ),
      ),
    );

    

  

    var orderDateCard = CupertinoDatePicker(
      maximumDate: _dateTime.add(new Duration(days: 1,)),
      minimumDate: _dateTime.subtract(new Duration(days: 1)),
      initialDateTime: DateTime.now().subtract(new Duration(days:1)),
      mode: CupertinoDatePickerMode.dateAndTime,
      use24hFormat: true,
      onDateTimeChanged: (DateTime value) {
        print(value);
        if(value.hour>12){
          showDialog(
              context: context,
              builder:(_)=>CupertinoAlertDialog(
                title: Text(' Inappropraite Time',style: TextStyle(color:CupertinoColors.activeBlue,),),
                content: Text('Pick up hours is between 7am and 12am',style: TextStyle(fontSize: 22),),
              )
            );

        };
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
                        if(value= true){
                          setState(() {
                           washAndFold=1; 
                          });
                        }else{
                          setState(() {
                           washAndFold=0; 
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
                        if(value= true){
                          setState(() {
                           laundry=1; 
                          });
                        }else{
                          setState(() {
                           laundry=0; 
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
                        if(value= true){
                          setState(() {
                           dryCleaning=1; 
                          });
                        }else{
                          setState(() {
                           dryCleaning=0; 
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
                        if(value= true){
                          setState(() {
                           press=1; 
                          });
                        }else{
                          setState(() {
                           press=0; 
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
          onPressed: () {
            //pick up point :obtain from sharedprefrences home or office
            //pick up date from date picker
            //pick up from time  and pick up to time is standard which is 7 to 12 am 
            // note  from _notecontroller.text
            //delivery date  is date picker + 12 hours
            //delivery from and delivery to  is fixed  which is 4 to 7 pm
            //status fixed 1
            //usser_id :obtain eamil from sahred preferences 
            //
            //                                                                                                                                                                                                                                                                                                                                                                         //pressonly       //home_service
           // orderPlaced("AddOrder", pick_up_point, pickup_date, pick_from_time, pick_to_time, note, delivery_date, delivery_from_time, delivery_to_time, status, user_id, pickup_to_hour, pickup_to_minute, pickup_from_hour, pickup_from_minute, delivery_from_hour, delivery_from_min, delivery_to_hour, delivery_to_min, promotion, promo_code, "${washAndFold}", "${press}", "${dryCleaning}", "${press}", "0", nameOfUser, location, other_location, server_code)
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
      );
  }

  GestureDetector buildGestureDetectorDateCard(BuildContext context, CupertinoDatePicker orderDateCard) {
    return GestureDetector(
        onTap: () {
          var alertDate='${_dateTime.day}/${_dateTime.add(new Duration(days: 1))}';
          var dateFormatter= new DateFormat.EEEE().format(new DateTime.now().add(new Duration(days: 1)));
          
          showDialog(
            context: context,
            builder:(_)=>CupertinoAlertDialog(
              title: Text('The Date and Time you selected'),
              content: Text('${dateFormatter}'),
            )
          );
        },
        child: SizedBox(
          height: 200,
          child: orderDateCard,
        ),
      );
  }
}
