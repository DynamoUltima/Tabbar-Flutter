import 'dart:collection';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tabbar/customWidgets/myTextStyle.dart';

import 'package:tabbar/models/prices/laundry_items.dart';
import 'package:tabbar/models/prices/price_list.dart';
import 'package:tabbar/services/services.dart';
import 'package:tabbar/views/pricing_page_details.dart';

class PricingPager extends StatefulWidget {
  @override
  _PricingPagerState createState() => _PricingPagerState();
}

class _PricingPagerState extends State<PricingPager> {
  PageController pagePriceController = PageController(viewportFraction: 0.8);
  int currentPage;
  bool activer = false;
  String tag = "getPrices";
  List articlePriceList = List<LaundryItems>();
  List<Object> categoryArray = [];
  List categoryResults;
  List<Object> myImage = [];
  bool active;
  int currentIndex = 0;

  List articleList =List<LaundryItems>();
  List imageLinks = [
    "polo_shirt.jpg",
    "blouse.png",
    "kente.png",
    "child_shorts.png",
    "bedspread.png",
    "laundry.jpg"
  ];

  _getArticlePriceDetails() {
    getPriceList(tag).then((response) {
      var priceMap = json.decode(response.body);

      PriceList priceList = PriceList();

      setState(() {
        priceList = PriceList.fromJson(priceMap);
      });
      articlePriceList = priceList.laundryItems;
    }).catchError((onError) {
      print(onError);
    });
  }

  _myCuperStyle(BuildContext context) {
    var cuperStyle = CupertinoTheme.of(context)
        .textTheme
        .navTitleTextStyle
        .apply(color: CupertinoColors.white);
    return cuperStyle;
  }

  _animationContainerState(bool activeState) {
    if (activeState) {
      activer = true;
    } else {
      activer = false;
    }
  }

  Widget _buildPricingPage(int index) {
    //Animated Properties
    // bool active=false;
    final double blur = activer ? 30 : 0;
    final double offset = activer ? 20 : 0;
    final double top = activer ? 50 : 100;
    String imageUrl = "http://www.forhey.com/clothes/";

    return GestureDetector(
      //http://www.forhey.com/clothes/jackets.png
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (BuildContext context) => PricingPageDetails(articleList: articleList,),
          ),
        );
      },
      child: AnimatedContainer(
        padding: EdgeInsets.all(90),
        duration: Duration(milliseconds: 500),
        curve: Curves.bounceOut,
        margin: EdgeInsets.only(top: top, bottom: 50, right: 30),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    CupertinoColors.activeBlue, BlendMode.dstATop),
                image: NetworkImage(imageUrl + imageLinks[index]),
                fit: BoxFit.cover),
            boxShadow: [
              BoxShadow(
                  color: Colors.black87,
                  blurRadius: blur,
                  offset: Offset(offset, offset))
            ]),
        child: Center(
          //
          child: Text(
            categoryResults[index],
            style: _myCuperStyle(context),
          ),
        ),
      ),
    ); //easoutquit
  }

  @override
  void initState() {
    super.initState();
    _getArticlePriceDetails();
    pagePriceController.addListener(() {
      int next = pagePriceController.page.round();

      if (currentPage != next) {
        setState(() {
          currentPage = next;
        });
      }
    });
    
  }
  

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    myTextStyle myTextType = new myTextStyle();

    for (var item in articlePriceList) {
      categoryArray.add(item.cartegory);
    }

    if (articlePriceList.isEmpty) {
      

      return Container(
        child: Center(
          child: Text("Loading", style: myTextType.myLargeCuperStyle(context)),
        ),
      );
    }
    
    // myImage =LinkedHashSet.from(myImage).toList();
    // print("---myImage---");

    // for( var items in articlePriceList){
    //   imageLinks.add(items.item_icon);

    // }

    setState(() {
      categoryResults = LinkedHashSet.from(categoryArray).toList();
    });

    // print("---category Results---");
    // print(categoryResults);

    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Container(
        height: screenHeight * 0.7,
        // width: 250,
        child: PageView.builder(
          onPageChanged: (indexer) {
            
            setState(() {
              currentIndex = indexer;
            });
            articleList.clear();

            
          },
          // pageSnapping: true,
          controller: pagePriceController,
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          itemCount: categoryResults.length,
          itemBuilder: (BuildContext context, int index) {
            categoryResults = LinkedHashSet.from(categoryArray).toList();

            articlePriceList.forEach((f) {
              if (f.cartegory == categoryResults[currentIndex]) {
                articleList.add(f);
                articleList = LinkedHashSet.from(articleList).toList();
              }
            });
            // print("--articleModels--");
            // print(articleList);
            // print(articleList.length);
            // print("--cateIndex--");
            // print(categoryResults[currentIndex]);
            if (categoryResults.length >= 1) {
              active = index == currentPage;

              _animationContainerState(active);
              return _buildPricingPage(index);
            }
          },
        ),
      ),
    );
  }
}
