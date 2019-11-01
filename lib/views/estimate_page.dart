import 'package:flutter/cupertino.dart';
import 'package:tabbar/customWidgets/myTextStyle.dart';

class Estimator extends StatefulWidget {
  @override
  _EstimatorState createState() => _EstimatorState();
}

class _EstimatorState extends State<Estimator> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[EstimatorTile()],
      ),
    );
  }
}

class EstimatorTile extends StatefulWidget {
  @override
  _EstimatorTileState createState() => _EstimatorTileState();
}

class _EstimatorTileState extends State<EstimatorTile> {
  List<String> items;

  myTextStyle myTextType = new myTextStyle();

  @override
  Widget build(BuildContext context) {
    items = List<String>.generate(10000, (i) => "Item $i");

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
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Douvet',
                  style: myTextType.myActionCuperStyle(context),
                ),
                Text(
                  '5.00',
                  style: myTextType.myActionCuperStyle(context),
                ),
                GestureDetector(
                  onTap: () {
                    setState(
                      () {
                        SizedBox(height: 160, child: estimatorPicker);
                      },
                    );

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
          SizedBox(
            height: 100,
            width: 250,
            child: estimatorPicker)
        ],
      ),
    );
  }
}
