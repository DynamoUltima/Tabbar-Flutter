import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tabbar/customWidgets/myTextStyle.dart';
import 'package:tabbar/services/services.dart';
//import 'services'

class UpdateAccountPage extends StatefulWidget {
  @override
  _UpdateAccountPageState createState() => _UpdateAccountPageState();
}

class _UpdateAccountPageState extends State<UpdateAccountPage> {
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
  String _tag ="updateAccount";
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

  Future<List<String>> getUserList() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getStringList(user_list_key);
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

    _name = mydetailList[2];
    _phoneNumber = mydetailList[3];
    _email = mydetailList[0];
    _location = mydetailList[1];
    

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
                  controller: _numberController,
                  placeholder: _phoneNumber,
                  placeholderStyle: TextStyle(color: CupertinoColors.black),
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
                  placeholderStyle: TextStyle(color: CupertinoColors.black),
                ),
                SizedBox(
                  height: 20,
                ),
                CupertinoTextField(
                  placeholder: _location,
                  controller: _locationController,
                  decoration: BoxDecoration(
                    border: Border.all(color: CupertinoColors.black),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  placeholderStyle: TextStyle(color: CupertinoColors.black),
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
                  onPressed: () {
                    setState(() {
                      _email=_emailController.text?? mydetailList[0];
                      _name =_nameController.text?? mydetailList[2];
                      _location= _locationController.text?? mydetailList[1];
                      _phoneNumber=_phoneNumberController.text?? mydetailList[3];
                      _streetName= _streetNameController.text;
                      _houseNumber=_houseNumberController.text;
                      _companyName=_companyNameController.text;
                      _pickupPoint =_companyNameController.text;
                      _reference = _referenceController.text;
                      _otherLocation=_otherLocationController.text;
                      

                    });
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
                      _pickupPoint,
                      _lat,
                      _lng,
                    ).then((response){
                      print("--updated response---");
                      print(response.body);

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
            placeholder: 'Street name',
            controller: _streetNameController,
            decoration: BoxDecoration(
                    border: Border.all(color: CupertinoColors.black),
                    borderRadius: BorderRadius.circular(7),
                  ),
            placeholderStyle: TextStyle(color: CupertinoColors.lightBackgroundGray),
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
            placeholderStyle: TextStyle(color: CupertinoColors.lightBackgroundGray),
          ),
          SizedBox(
            height: 20,
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
          placeholderStyle: TextStyle(color: CupertinoColors.lightBackgroundGray),
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
          placeholderStyle: TextStyle(color: CupertinoColors.lightBackgroundGray),
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
          placeholderStyle: TextStyle(color: CupertinoColors.lightBackgroundGray),
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
                        chosenLocation = "office";
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
