import 'package:flutter/cupertino.dart';

class UpdateAccountPage extends StatefulWidget {
  @override
  _UpdateAccountPageState createState() => _UpdateAccountPageState();
}

class _UpdateAccountPageState extends State<UpdateAccountPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Update Accounts'),
        previousPageTitle: "Settings",
      ),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(height: 60,),
              CupertinoTextField(
                placeholder: 'name',
                placeholderStyle: TextStyle(color: CupertinoColors.black),
              ),
              SizedBox(height: 20,),
              CupertinoTextField(
                placeholder: 'number',
                placeholderStyle: TextStyle(color: CupertinoColors.black),
              ),
              SizedBox(height: 20,),
              CupertinoTextField(
                placeholder: 'email',
                placeholderStyle: TextStyle(color: CupertinoColors.black),
              ),
              SizedBox(height: 20,),
              CupertinoTextField(
                placeholder: 'location',
                placeholderStyle: TextStyle(color: CupertinoColors.black),
              ),
              SizedBox(height: 20,),
              /**
               * pickup address
               * reference
               * use google maps to get cordinates 
               */
              CupertinoButton(
                onPressed: () {},
                child: Text('Update Accounts'),
                color: CupertinoColors.activeBlue,
              )
            ],
          ),
        ),
      ),
    );
  }
}
