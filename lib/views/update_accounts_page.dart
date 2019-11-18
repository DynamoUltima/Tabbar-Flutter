import 'package:flutter/cupertino.dart';
import 'package:tabbar/customWidgets/myTextStyle.dart';

class UpdateAccountPage extends StatefulWidget {
  @override
  _UpdateAccountPageState createState() => _UpdateAccountPageState();
}

class _UpdateAccountPageState extends State<UpdateAccountPage> {
 String _name;
 String _phoneNumber;
 String _email;
 String _location;



  @override
  Widget build(BuildContext context) {

  myTextStyle myTextType= myTextStyle();

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Update Accounts'),
        previousPageTitle: "Settings",
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
              child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                

                SizedBox(height: 80,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Text('Update Accounts',style: myTextType.myLargeCuperStyle(context),),

                    ],
                  ),
                ),
                SizedBox(height: 20,),
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
      ),
    );
  }
}
