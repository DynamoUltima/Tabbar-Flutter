import 'package:flutter/cupertino.dart';
import 'package:tabbar/general_page.dart';

class PricingPageDetails extends StatefulWidget {
  @override
  _PricingPageDetailsState createState() => _PricingPageDetailsState();
}

class _PricingPageDetailsState extends State<PricingPageDetails> {
  @override
  Widget build(BuildContext context) {
    String priceUrl =
        'https://images.unsplash.com/photo-1569685915250-01b72923ca1c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60';
    return CupertinoPageScaffold(
      child: Container(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            FlatCard(
              child: Column(
                children: <Widget>[
                  Image.network(priceUrl),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
