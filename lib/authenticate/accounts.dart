import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tabbar/customWidgets/myTextStyle.dart';
import 'package:tabbar/general_page.dart';
import 'package:tabbar/models/update/update_response.dart';
import 'package:tabbar/pages/home_page.dart';
import 'package:tabbar/services/services.dart';
//import 'services'

class AccountPage extends StatefulWidget {
  String email;
  String phoneNumber;
  String displayName;

  AccountPage({this.email, this.phoneNumber, this.displayName});

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  TextEditingController _numberController = TextEditingController();
  TextEditingController _otherLocationController = TextEditingController();
  TextEditingController _streetNameController = TextEditingController();
  TextEditingController _referenceController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _latController = TextEditingController();
  TextEditingController _lngController = TextEditingController();
  String _tag = "updateAccount";
  TextEditingController _houseNumberController = TextEditingController();
  TextEditingController _companyNameController = TextEditingController();
  TextEditingController _pickupPointController = TextEditingController();
  String chosenLocation = "Home";

  String user_list_key = "list_key";
  List<String> mydetailList = [];

  String _email;
  String _name;
  String _location;
  String _phoneNumber;
  String _otherLocation;
  String _streetName;
  String _houseNumber;
  String _reference;
  String _companyName;
  String _pickupPoint;
  String _lat = "";
  String _lng = "";
  String updated_at;

  Future<List<String>> getUserList() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getStringList(user_list_key);
  }

  Future<bool> _saveListName(List myStrings) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    return await preferences.setStringList(user_list_key, myStrings);
  }

  loadList() {
    getUserList().then((onValue) {
      setState(() {
        mydetailList = onValue;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    const MethodChannel('plugins.flutter.io/shared_preferences')
        .setMockMethodCallHandler(
      (MethodCall methodCall) async {
        if (methodCall.method == 'getAll') {
          return {"flutter." + user_list_key: "No Name saved"};
        }
        return null;
      },
    );

    loadList();
  }

  @override
  Widget build(BuildContext context) {
    myTextStyle myTextType = myTextStyle();

    print("-----pref details at update Accounts-----");
    print(mydetailList);

    _name = widget.displayName;
    _phoneNumber = widget.phoneNumber;
    _email = widget.email;
    // _location = mydetailList[1];

    Widget _locationChoiceTextField() {
      if (chosenLocation == "Home") {
        return homeContainer();
      } else {
        return officeContainer();
      }
    }

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
              children: <Widget>[
                SizedBox(
                  height: 80,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Update Accounts',
                        style: myTextType.myLargeCuperStyle(context),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                CupertinoTextField(
                  //name
                  decoration: BoxDecoration(
                    border: Border.all(color: CupertinoColors.black),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  controller: _nameController,
                  placeholder: _name,
                  placeholderStyle:
                      TextStyle(color: CupertinoColors.lightBackgroundGray),
                ),
                SizedBox(
                  height: 20,
                ),
                CupertinoTextField(
                  decoration: BoxDecoration(
                    border: Border.all(color: CupertinoColors.black),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  controller: _phoneNumberController,
                  placeholder: "phoneNumber",
                  placeholderStyle:
                      TextStyle(color: CupertinoColors.lightBackgroundGray),
                ),
                SizedBox(
                  height: 20,
                ),
                CupertinoTextField(
                  decoration: BoxDecoration(
                    border: Border.all(color: CupertinoColors.black),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  placeholder: _email,
                  controller: _emailController,
                  placeholderStyle:
                      TextStyle(color: CupertinoColors.lightBackgroundGray),
                ),
                SizedBox(
                  height: 20,
                ),
                //Location
                CupertinoTextField(
                  placeholder: "location",
                  controller: _locationController,
                  decoration: BoxDecoration(
                    border: Border.all(color: CupertinoColors.black),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  placeholderStyle:
                      TextStyle(color: CupertinoColors.lightBackgroundGray),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Pick up Address',
                        style: myTextType.myCuperStyle(context),
                      ),
                      CupertinoLocationChoiceButton(context)
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                _locationChoiceTextField(),

                /**
                 * pickup address
                 * reference
                 * use google maps to get cordinates 
                 */
                CupertinoButton(
                  onPressed: () async {
                    setState(() {
                      _email = _emailController.text;
                      _name = _nameController.text;
                      _location = _locationController.text;
                      _phoneNumber = _phoneNumberController.text;
                      _streetName = _streetNameController.text;
                      _houseNumber = _houseNumberController.text;
                      _companyName = _companyNameController.text;
                      _pickupPoint = _pickupPointController.text;
                      _reference = _referenceController.text;
                      _otherLocation = _otherLocationController.text;
                      updated_at = DateTime.now().toString();
                    });

                    List<String> myStrings = [
                      widget.email,
                      _location,
                      widget.displayName,
                      widget.phoneNumber,
                      _houseNumber
                     ];

                     _saveListName(myStrings);
                    updateAccount(
                            _tag,
                            _email,
                            _name,
                            _location,
                            _phoneNumber,
                            _otherLocation,
                            _streetName,
                            _houseNumber,
                            _reference,
                            _companyName,
                            chosenLocation,
                            _lat,
                            _lng,
                            updated_at)
                        .then((response) {
                      print("--updated response---");
                      print(response.body);
                      var updateMap = json.decode(response.body);
                      UpdateResponse updateResponse = new UpdateResponse();
                      setState(() {
                        updateResponse = UpdateResponse.fromJson(updateMap);
                      });
                      if(updateResponse.success== 1){
                        Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (BuildContext context) => HomePage(), //intro
                        ),
                      );

                      }else{
                        showUpdateAccountsDialog();

                      }

                   

                      // Navigator.of(context).pushReplacement(
                      //   MaterialPageRoute(
                      //     builder: (BuildContext context) => HomePage(), //intro
                      //   ),
                      // );
                      //showUpdateAccountsDialog();
                    });
                  },
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

  Container officeContainer() {
    return Container(
      child: Column(
        children: <Widget>[
          CupertinoTextField(
            placeholder: 'Company Name',
            controller: _companyNameController,
            placeholderStyle: TextStyle(color: CupertinoColors.black),
          ),
          SizedBox(
            height: 20,
          ),
          CupertinoTextField(
            placeholder: 'Address Eg. Trassaco Enclave',
            controller: _addressController,
            placeholderStyle: TextStyle(color: CupertinoColors.black),
          ),
          SizedBox(
            height: 20,
          ),
          CupertinoTextField(
            placeholder: 'Office house number',
            controller: _houseNumberController,
            decoration: BoxDecoration(
              border: Border.all(color: CupertinoColors.black),
              borderRadius: BorderRadius.circular(7),
            ),
            placeholderStyle:
                TextStyle(color: CupertinoColors.lightBackgroundGray),
          ),
          SizedBox(
            height: 20,
          ),
          CupertinoTextField(
            placeholder: 'Street name',
            controller: _streetNameController,
            decoration: BoxDecoration(
              border: Border.all(color: CupertinoColors.black),
              borderRadius: BorderRadius.circular(7),
            ),
            placeholderStyle:
                TextStyle(color: CupertinoColors.lightBackgroundGray),
          ),
          SizedBox(
            height: 20,
          ),
          CupertinoTextField(
            placeholder: 'Point of reference Eg. Adjacent the A&C Mall',
            controller: _referenceController,
            decoration: BoxDecoration(
              border: Border.all(color: CupertinoColors.black),
              borderRadius: BorderRadius.circular(7),
            ),
            placeholderStyle:
                TextStyle(color: CupertinoColors.lightBackgroundGray),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  showUpdateAccountsDialog() {
    return showDialog(
      context: context,
      builder: (_) => CupertinoAlertDialog(
        title: Text('Enter valid Info'),
        // content: Text("Profile Updated"),
        actions: <Widget>[
          CupertinoButton(
            child: Text('OK'),
            onPressed: () async {
              Navigator.of(context, rootNavigator: true).pop("Discard");
            },
          ),
        ],
      ),
    );
  }

  Container homeContainer() {
    return Container(
        child: Column(
      children: <Widget>[
        CupertinoTextField(
          placeholder: 'otherlocation',
          controller: _otherLocationController,
          decoration: BoxDecoration(
            border: Border.all(color: CupertinoColors.black),
            borderRadius: BorderRadius.circular(7),
          ),
          placeholderStyle:
              TextStyle(color: CupertinoColors.lightBackgroundGray),
        ),
        SizedBox(
          height: 20,
        ),
        CupertinoTextField(
          placeholder: 'Street name',
          controller: _streetNameController,
          decoration: BoxDecoration(
            border: Border.all(color: CupertinoColors.black),
            borderRadius: BorderRadius.circular(7),
          ),
          placeholderStyle:
              TextStyle(color: CupertinoColors.lightBackgroundGray),
        ),
        SizedBox(
          height: 20,
        ),
        CupertinoTextField(
          placeholder: 'Point of reference Eg. Adjacent the A&C Mall',
          controller: _referenceController,
          decoration: BoxDecoration(
            border: Border.all(color: CupertinoColors.black),
            borderRadius: BorderRadius.circular(7),
          ),
          placeholderStyle:
              TextStyle(color: CupertinoColors.lightBackgroundGray),
        ),
        SizedBox(
          height: 20,
        ),
        CupertinoTextField(
          placeholder: 'house number',
          controller: _houseNumberController,
          decoration: BoxDecoration(
            border: Border.all(color: CupertinoColors.black),
            borderRadius: BorderRadius.circular(7),
          ),
          placeholderStyle:
              TextStyle(color: CupertinoColors.lightBackgroundGray),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    ));
  }

  CupertinoButton CupertinoLocationChoiceButton(BuildContext context) {
    return CupertinoButton(
      color: CupertinoColors.darkBackgroundGray,
      child: Text(chosenLocation),
      onPressed: () {
        showCupertinoModalPopup(
            builder: (BuildContext context) {
              return CupertinoActionSheet(
                title: Text("Choice for your pick up or delivery"),
                actions: <Widget>[
                  CupertinoActionSheetAction(
                    child: Row(
                      children: <Widget>[Text("Home")],
                    ),
                    onPressed: () {
                      setState(() {
                        chosenLocation = "Home";
                      });

                      Navigator.pop(context, 'Cancel');
                    },
                  ),
                  CupertinoActionSheetAction(
                    child: Row(
                      children: <Widget>[Text("Office")],
                    ),
                    onPressed: () {
                      setState(() {
                        chosenLocation = "Office";
                      });

                      Navigator.pop(context, 'Cancel');
                    },
                  )
                ],
                cancelButton: CupertinoActionSheetAction(
                  child: Text('Cancel'),
                  isDefaultAction: true,
                  onPressed: () {
                    Navigator.pop(context, 'Cancel');
                  },
                ),
              );
            },
            context: context);
      },
    );
  }
}
