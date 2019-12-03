import 'dart:collection';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
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
  List gentsResults = [];
  double currentPageValue = 0.0;
  String pageTitle;

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

  int _radioValue1 = -1;

  void _handleRadioValueChange1(int value) {
    setState(() {
      _radioValue1 = value;

      switch (_radioValue1) {
        case 0:
          break;
        case 1:
          break;
        case 2:
          break;
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getArticlePriceDetails();
  }

  @override
  Widget build(BuildContext context) {
    myTextStyle myTextType = new myTextStyle();
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    for (var item in articlePriceList) {
      gentArray.add(item.cartegory);
      //cartegoryArray.add(item.laundryItem);

    }

    _getCategoryIndex(int index) {
      List categoryResults = LinkedHashSet.from(gentArray).toList();
      print("--categoryindex--");
      print(index);
      gentsResults.clear();
      articlePriceList.forEach((f) {
        if (f.cartegory == categoryResults[index]) {
          //gentsResults.clear();
          gentsResults.add(f.laundryItem);

          //f.laundryDetails.

        }
      });
    }

    List categoryResults = LinkedHashSet.from(gentArray).toList();
    print("Awesome");
    print(categoryResults);

    return Container(
      height: screenHeight * 0.8,
      //width: screenWidth*0.9,
      //color: CupertinoColors.activeGreen,

      padding: EdgeInsets.all(8),
      child: Container(
        height: screenHeight * 0.7,
        child: PageView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categoryResults.length,
          physics: BouncingScrollPhysics(),
          onPageChanged: (int) {
            print("--my Page Value------");
            print(int);
            print(pageTitle);
          },
          itemBuilder: (BuildContext context, int indexItems) {
            List categoryResults = LinkedHashSet.from(gentArray).toList();
            String categoryName = articlePriceList[indexItems].cartegory;
            int categoryIndex =
                articlePriceList.indexWhere((p) => p.cartegory == categoryName);
            estimateController.addListener(() {
              setState(() {
                currentPageValue = estimateController.page;
              });
              print("----My current Page---");
              print(currentPageValue);
              print(gentsResults);
              gentsResults.clear();
              articlePriceList.forEach((f) {
                if (f.cartegory == categoryResults[indexItems]) {
                  //gentsResults.clear();
                  gentsResults.add(f.laundryItem);

                  //f.laundryDetails.

                }
              });
            });

            _getCategoryIndex(indexItems);

            // articlePriceList.every((article){
            //   var art= article.cartegory="Gents";
            //  gentArray.add()
            // });

            //articlePriceList.forEach(var ite){}

            // if (categoryName == "Gents") {
            //   for (var item in articlePriceList) {
            //     gentArray.add(item.cartegory);
            //     //cartegoryArray.add(item.laundryItem);

            //   }
            // }
            // print("array");
            // // print(gentArray);

            // print(categoryResults);

            for (var items in articlePriceList) {
              if (items.cartegory == "Gents") {
                /** 
                 * this forEach loop goes through the whole article and adds all items which have 
                 the cartegory name ==categoryResults[indexItems] to the gentsResultsArray
                 */
                //categoryResults[indexItems]

                articlePriceList.forEach((f) {
                  if (f.cartegory == categoryResults[indexItems]) {
                    //gentsResults.clear();
                    gentsResults.add(f.laundryItem);

                    //f.laundryDetails.

                  }
                });
              }
            }
            print("---category---");
            print(categoryResults[indexItems]);
            pageTitle = categoryResults[indexItems];

            // print(gentsResults);

            return Container(
                height: screenHeight * 0.65,
                child: Column(
                  children: <Widget>[
                    //${articlePriceList[indexItems].cartegory}
                    Row(
                      children: <Widget>[
                        Text("${categoryResults[indexItems]}",
                            style: myTextType.myActionCuperStyle(context))
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text("Total Price",
                            style: myTextType.myActionCuperStyle(context)),
                      ],
                    ),
                    // buildRow(),
                    SizedBox(
                      height: 400,
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: gentsResults.length,
                        itemBuilder: (BuildContext context, int indexDetails) {
                          // have to use the Radio button to differentiate between type of pricessing
                          // var articleDetails = articlePriceList[categoryIndex]
                          //     .laundryDetails[indexDetails];
                          print("---List results---");
                          print(gentsResults);
                          print(gentsResults.length);
                          return EstimatorTile(
                            laundryItems: gentsResults[indexDetails],
                            laundryType: "0",
                            price: "0",
                          );
                        },
                      ),
                    )
                  ],
                ));
          },
        ),
      ),
    );
  }

  Row buildRow() {
    return Row(
      children: <Widget>[
        new Radio(
          value: 0,
          groupValue: _radioValue1,
          onChanged: _handleRadioValueChange1,
        ),
        new Text(
          'Carnivore',
          style: new TextStyle(fontSize: 16.0),
        ),
        new Radio(
          value: 1,
          groupValue: _radioValue1,
          onChanged: _handleRadioValueChange1,
        ),
        new Text(
          'Herbivore',
          style: new TextStyle(
            fontSize: 16.0,
          ),
        ),
        new Radio(
          value: 2,
          groupValue: _radioValue1,
          onChanged: _handleRadioValueChange1,
        ),
        new Text(
          'Omnivore',
          style: new TextStyle(fontSize: 16.0),
        ),
      ],
    );
  }
}

class EstimatorTile extends StatefulWidget {
  String laundryType;
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
    items = List<String>.generate(10000, (i) => "Item $i");
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    var estimatorPicker = CupertinoPicker(
      itemExtent: 100,
      onSelectedItemChanged: (int value) {
        print(value);
      },
      children: <Widget>[
        Text(
          '1',
          style: myTextType.myActionCuperStyle(context),
        ),
        Text(
          '2',
          style: myTextType.myActionCuperStyle(context),
        ),
      ],
      // itemBuilder: (BuildContext context, int index) {
      //   return Text("$items");
      // },
    );

    return Container(
      height: screenHeight * 0.1,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  widget.laundryItems,
                  style: myTextType.myActionCuperStyle(context),
                ),
                Text(
                  widget.price,
                  style: myTextType.myActionCuperStyle(context),
                ),
                GestureDetector(
                  onTap: () {
                    print('tapped');
                  },
                  child: Text(
                    '2',
                    style: myTextType.myActionCuperStyle(context),
                  ),
                ),
              ],
            ),
          ),
          //Text('data')
        ],
      ),
    );
  }
}
