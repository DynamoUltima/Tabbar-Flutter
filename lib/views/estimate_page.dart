import 'dart:collection';
import 'dart:convert';
import 'dart:core' as prefix0;
import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tabbar/customWidgets/myTextStyle.dart';
import 'package:tabbar/models/prices/laundry_items.dart';
import 'package:tabbar/models/prices/price_list.dart';
import 'package:tabbar/services/services.dart';

class Estimator extends StatefulWidget {
  @override
  _EstimatorState createState() => _EstimatorState();
}

class _EstimatorState extends State<Estimator> {
  PageController estimateController = PageController();
  List<LaundryItems> articlePriceList = List<LaundryItems>();
  String tag = "getPrices";
  List<Object> gentArray = [];
  List gentsResults = List<LaundryItems>();
  double currentPageValue = 0.0;
  String pageTitle;
  int currentIndex = 0;
  var finalPrice = 0.0;
  //this is a map of number of items and articles
  Map<String, int> numbered = {};
  Map<String, double> priceMap = {};
  double sliderValue = 0.0;

  _getArticlePriceDetails() {
    getPriceList(tag).then((response) {
      var priceMap = json.decode(response.body);

      PriceList priceList = PriceList();

      setState(() {
        priceList = PriceList.fromJson(priceMap);
      });
      articlePriceList = priceList.laundryItems;

      //print(priceList.toJson());
    }).catchError((onError) {
      print(onError);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getArticlePriceDetails();

    if (articlePriceList.isEmpty) {
      print("article list was empty at a point");
    }
  }

  @override
  Widget build(BuildContext context) {
    myTextStyle myTextType = new myTextStyle();
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    if (articlePriceList.isEmpty) {
      return Container(
        child: Center(
          child: Text("Loading", style: myTextType.myLargeCuperStyle(context)),
        ),
      );
    }

    for (var item in articlePriceList) {
      //gentArray is an array containing  the category titles
      gentArray.add(item.cartegory);
    }
    _estimatePickerMethod(String priceIndex, double price) {
      return CupertinoPicker.builder(
        useMagnifier: true,
        magnification: 1.2,
        childCount: 100,
        itemExtent: 50,
        onSelectedItemChanged: (int value) {
          double currentPrice;
          double noOfitems = value.toDouble();
          setState(() {
            currentPrice = noOfitems * price;
          });

          setState(() {
            numbered.update(priceIndex, (val) => value);
          });
          priceMap.putIfAbsent(priceIndex, () => currentPrice);
          setState(() {
            priceMap.update(priceIndex, (val) => currentPrice);
          });

          setState(() {
            finalPrice =
                priceMap.values.reduce((sum, combine) => sum + combine);
          });

          // print("--final Price--");
          // print(finalPrice);

          // print("--currentPrice--");
          // print(currentPrice);

          // print("----Price Map---");
          // print(priceMap);

          // print(value);
        },
        itemBuilder: (BuildContext context, int index) {
          return Text("$index");
        },
      );
    }

    List categoryResults = LinkedHashSet.from(gentArray).toList();
    // print("Awesome");
    // print(categoryResults);

    return Container(
      height: screenHeight * 0.8,
      //width: screenWidth*0.9,
      //color: CupertinoColors.activeGreen,

      padding: EdgeInsets.all(8),
      child: Container(
        height: screenHeight * 0.7,
        child: PageView.builder(
          scrollDirection: Axis.horizontal,
          dragStartBehavior: DragStartBehavior.down,
          itemCount: categoryResults.length,
          physics: BouncingScrollPhysics(),
          onPageChanged: (intIndex) {
            setState(() {
              currentIndex = intIndex;
            });

            gentsResults.clear();
          },
          itemBuilder: (BuildContext context, int indexItems) {
            List categoryResults = LinkedHashSet.from(gentArray).toList();
            // String categoryName = articlePriceList[indexItems].cartegory;
            // int categoryIndex =
            //     articlePriceList.indexWhere((p) => p.cartegory == categoryName);

            //print("--My Map experiment---");

            articlePriceList.forEach((f) {
              if (f.cartegory == categoryResults[currentIndex]) {
                gentsResults.add(f);
                gentsResults = LinkedHashSet.from(gentsResults).toList();
              }
            });

            return Container(
              height: screenHeight * 0.65,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        "${categoryResults[indexItems]}",
                        style: myTextType.myLargeCuperStyle(context),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Total Price " + "GH¢ " + "${finalPrice}",
                        style: myTextType.myCuperStyle(context),
                      ),
                      // CupertinoSlider(
                      //   onChanged: (double value) {
                      //     setState(() {
                      //       sliderValue = value;
                      //     });
                      //     print(value);
                      //   },
                      //   value: sliderValue,
                      //   min: 0.0,
                      //   max: 3,
                      //   divisions: 3,
                      //   activeColor: CupertinoColors.activeBlue,
                      // )
                    ],
                  ),
                  // buildRow(),
                  SizedBox(
                    height: 500,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemCount: gentsResults.length,
                      itemBuilder: (BuildContext context, int indexDetails) {
                        //indexDetails
                        numbered.putIfAbsent(
                            gentsResults[indexDetails].laundryItem, () => 0);
                        // print(numbered);

                        return GestureDetector(
                          onTap: () {
                            print(gentsResults[indexDetails].laundryItem);
                            setState(() {
                              showCupertinoModalPopup(
                                  builder: (BuildContext context) {
                                    return SizedBox(
                                      height: screenHeight * 0.3,
                                      child: _estimatePickerMethod(
                                        gentsResults[indexDetails].laundryItem,
                                        double.parse(gentsResults[indexDetails]
                                            .laundryDetails[0]
                                            .price),
                                      ),
                                    );
                                  },
                                  context: context);
                            });
                          },
                          child: EstimatorTile(
                            laundryItems:
                                gentsResults[indexDetails].laundryItem,
                            laundryType: numbered[
                                gentsResults[indexDetails].laundryItem],
                            price: gentsResults[indexDetails]
                                .laundryDetails[0]
                                .price,
                          ),
                        );
                      },
                    ),
                  ),

                  CupertinoButton(child: Text("Tap on articles to calculate price"), onPressed: (){})
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class EstimatorTile extends StatefulWidget {
  int laundryType;
  String price;
  String id;
  String laundryItems;

  EstimatorTile({this.laundryItems, this.laundryType, this.price});

  @override
  _EstimatorTileState createState() => _EstimatorTileState();
}

class _EstimatorTileState extends State<EstimatorTile> {
  List<String> items;

  myTextStyle myTextType = new myTextStyle();

  @override
  Widget build(BuildContext context) {
    // items = List<String>.generate(100, (i) => "$i");
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: screenHeight * 0.1,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  width: screenWidth * 0.3,
                  child: Text(
                    widget.laundryItems,
                    style: myTextType.myActionCuperStyle(context),
                    textAlign: TextAlign.left,
                  ),
                ),
                Text(
                  "GH¢ " + widget.price,
                  style: myTextType.myActionCuperStyle(context),
                ),
                GestureDetector(
                  onTap: () {
                    print('tapped');
                  },
                  child: Text(
                    "${widget.laundryType}",
                    style: myTextType.myActionCuperStyle(context),
                  ),
                ),
              ],
            ),
          ),
          Divider(color:CupertinoColors.activeBlue)
          //Text('data')
        ],
      ),
    );
  }
}
