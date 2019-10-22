import 'package:flutter/cupertino.dart';
import 'package:tabbar/adaptive_widgets.dart';
import 'package:tabbar/general_page.dart';

class PricingPageDetails extends StatefulWidget {
  @override
  _PricingPageDetailsState createState() => _PricingPageDetailsState();
}

class _PricingPageDetailsState extends State<PricingPageDetails> {
  @override
  Widget build(BuildContext context) {
    String priceUrl =
        'https://lp2.hm.com/hmgoepprod?set=source[/8b/e6/8be614bf73e214d1d3bf1bd914ce73298d8b815f.jpg],origin[dam],category[],type[DESCRIPTIVESTILLLIFE],res[m],hmver[1]&call=url[file:/product/main]';

    String imgUrl =
        "https://images.unsplash.com/photo-1569250814530-1e923fd61bc6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80";
    double ScreenHeight = MediaQuery.of(context).size.height;
    double ScreenWidth = MediaQuery.of(context).size.width;

    final textTheme = AdaptiveTextTheme.of(context);

    Widget _buildDetails(
        AdaptiveTextThemeData textTheme, BuildContext context) {
      return AdaptiveBackground(
        color: Color.lerp(CupertinoColors.white, CupertinoColors.white, 0.15)
            .withAlpha(140),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Blouse',
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
              Text(
                'Laundry: GH¢ 7',
                style: CupertinoTheme.of(context)
                    .textTheme
                    .navTitleTextStyle
                    .copyWith(
                      color: Color(0xDE000000),
                      fontSize: 14,
                      letterSpacing: 0.1,
                    ),
              ),
              SizedBox(height: 4),
              Text(
                'Dry Cleaning : GH¢ 9',
                style: CupertinoTheme.of(context)
                    .textTheme
                    .navTitleTextStyle
                    .copyWith(
                      color: Color(0xDE000000),
                      fontSize: 14,
                      letterSpacing: 0.1,
                    ),
              ),
            ],
          ),
        ),
      );
    }

    var exampleCard = FlatCard(
      height: ScreenHeight * 0.6,
      child: Column(
        children: <Widget>[
          Stack(
            fit: StackFit.loose,
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              FittedBox(
                fit: BoxFit.fitWidth,
                child: Image.network(
                  priceUrl,
                  // width: ScreenWidth,

                  // fit: BoxFit.fitWidth,

                  height: ScreenHeight * 0.59,
                ),
              ),
              Container(
                child: _buildDetails(textTheme, context),
                width: ScreenWidth * 0.97,
              )
            ],
          ),
        ],
      ),
      
    );

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        previousPageTitle: 'Price',
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: ListView(
            padding: EdgeInsets.all(8),
            
            shrinkWrap: true,
            children: <Widget>[
              exampleCard,
              SizedBox(height: 15),
              exampleCard,
              SizedBox(height: 15),
              exampleCard,
              SizedBox(height: 15),
              exampleCard,
              SizedBox(height: 15),
              exampleCard,
              SizedBox(height: 15),
              exampleCard,
              SizedBox(height: 15),
              exampleCard,
              SizedBox(height: 15),
              exampleCard,
            ],
          ),
        ),
      ),
    );
  }
}
