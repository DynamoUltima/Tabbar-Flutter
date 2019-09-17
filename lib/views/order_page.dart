import 'package:flutter/cupertino.dart';

class OrderPage extends StatefulWidget {
  OrderPage({Key key}) : super(key: key);

  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      CupertinoNavigationBar(
        middle: Text('Order Page'),
        transitionBetweenRoutes: true,
        previousPageTitle: 'Order Activities',
      ),
    ]);
  }
}
