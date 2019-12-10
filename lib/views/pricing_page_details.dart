import 'package:flutter/cupertino.dart';
import 'package:tabbar/adaptive_widgets.dart';
import 'package:tabbar/general_page.dart';
import 'package:tabbar/models/prices/laundry_items.dart';

class PricingPageDetails extends StatefulWidget {
  List articleList;

  PricingPageDetails({this.articleList});

  @override
  _PricingPageDetailsState createState() => _PricingPageDetailsState();
}

class _PricingPageDetailsState extends State<PricingPageDetails> {
  String laundryPrice = "0";
  String dryCleaningPrice = "0";
  String washandFoldPrice = "0";
  int laundryItemIndex1;
  int laundryItemIndex2;
  int laundryItemIndex3;

  @override
  Widget build(BuildContext context) {
    String imageUrl = "http://www.forhey.com/clothes/";

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    final textTheme = AdaptiveTextTheme.of(context);

    Widget _buildDetails(
      AdaptiveTextThemeData textTheme,
      BuildContext context,
      String articleName,
    ) {
      return AdaptiveBackground(
        color: Color.lerp(CupertinoColors.white, CupertinoColors.white, 0.15)
            .withAlpha(140),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                articleName,
                style: CupertinoTheme.of(context)
                    .textTheme
                    .navTitleTextStyle
                    .copyWith(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.6,
                        color: CupertinoColors.darkBackgroundGray),
                // textTheme.headline,
              ),
              SizedBox(height: 4),
              buildTextLaundyPrice(context),
              SizedBox(height: 4),
              buildTextdryCleaningPrice(context),
            ],
          ),
        ),
      );
    }

    _pricigCardMethod(String articleName, String articleIcon) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: FlatCard(
          height: screenHeight * 0.6,
          child: Column(
            children: <Widget>[
              Stack(
                fit: StackFit.loose,
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  Image.network(
                    imageUrl + articleIcon,
                    // width: ScreenWidth,

                    fit: BoxFit.contain,

                    height: screenHeight * 0.59,
                  ),
                  Container(
                    child: _buildDetails(textTheme, context, articleName),
                    width: screenWidth * 0.97,
                  )
                ],
              ),
            ],
          ),
        ),
      );
    }

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        previousPageTitle: 'Price',
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(8),
            itemCount: widget.articleList.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              var articleDetails = widget.articleList[index];

              print("--laundryItemIndex--");
              // print(laundryItemIndex);

              laundryItemIndex1 = articleDetails.laundryDetails
                  .indexWhere((i) => i.type_laundry == "1");
              laundryItemIndex2 = articleDetails.laundryDetails
                  .indexWhere((i) => i.type_laundry == "2");
              laundryItemIndex3 = articleDetails.laundryDetails
                  .indexWhere((i) => i.type_laundry == "3");

              // print(articleDetails.laundryDetails[laundryItemIndex1].price);
              if (laundryItemIndex1 != -1) {
                print(" 1st price");
                print(articleDetails.laundryDetails[laundryItemIndex1].price);
                dryCleaningPrice = "GH¢ " +
                    articleDetails.laundryDetails[laundryItemIndex1].price;
              } else {
                dryCleaningPrice = "Not Available for this article";
              }

              if (laundryItemIndex2 != -1) {
                print(" 1st price");
                print(articleDetails.laundryDetails[laundryItemIndex2].price);
                washandFoldPrice =
                    articleDetails.laundryDetails[laundryItemIndex2].price;
              } else {
                washandFoldPrice;
              }

              if (laundryItemIndex3 != -1) {
                print("3rd price");
                print(articleDetails.laundryDetails[laundryItemIndex3].price);
                laundryPrice = "GH¢ " +
                    articleDetails.laundryDetails[laundryItemIndex3].price;
              } else {
                laundryPrice = "Not Avaialble for this article";
              }

              // print(articleDetails.laundryDetails[laundryItemIndex2].price);

              return _pricigCardMethod(
                  articleDetails.laundryItem, articleDetails.item_icon);
            },
          ),
        ),
      ),
    );
  }

  Text buildTextdryCleaningPrice(BuildContext context) {
    
    if (laundryItemIndex2 != -1) {
      return Text("");
    }

    return Text(
      'Dry Cleaning :  ' + dryCleaningPrice ?? "0",
      style: CupertinoTheme.of(context).textTheme.navTitleTextStyle.copyWith(
            color: Color(0xDE000000),
            fontSize: 14,
            letterSpacing: 0.1,
          ),
    );
  }

  Text buildTextLaundyPrice(BuildContext context) {
    if (laundryItemIndex2 != -1) {
      return Text(
        'Wash and Fold: ' + "GH¢ "+ washandFoldPrice,
        style: CupertinoTheme.of(context).textTheme.navTitleTextStyle.copyWith(
              color: Color(0xDE000000),
              fontSize: 14,
              letterSpacing: 0.1,
            ),
      );
    }

    return Text(
      'Laundry: ' + laundryPrice ?? "0",
      style: CupertinoTheme.of(context).textTheme.navTitleTextStyle.copyWith(
            color: Color(0xDE000000),
            fontSize: 14,
            letterSpacing: 0.1,
          ),
    );
  }
}
