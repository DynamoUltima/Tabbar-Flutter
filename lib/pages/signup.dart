import 'package:flutter/material.dart';
import 'package:tabbar/services/services.dart';

class widgetSignUp extends StatefulWidget {
  @override
  _widgetSignUpState createState() => _widgetSignUpState();
}

class _widgetSignUpState extends State<widgetSignUp> {
  final TextEditingController _emailController = TextEditingController();

  TextEditingController _password = TextEditingController();

  TextEditingController _phoneNumber = TextEditingController();

  TextEditingController _username = TextEditingController();

  String _selectedLocation;

  var _currencies = [
    "Accra",
    "Achimota",
    "East Legon",
  ];

  var emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Column(
          children: <Widget>[
            Center(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                elevation: 0,
                child: Container(
                  margin: EdgeInsets.only(bottom: 45),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 20, left: 20, right: 20),
                        child: TextFormField(
                          controller: _username,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Name',
                            prefixIcon: Icon(Icons.person_outline),
                          ),
                        ),
                      ),
                      SizedBox(height: 2),
                      Divider(
                        height: 2,
                        color: Colors.grey,
                        indent: 10,
                        endIndent: 10,
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, left: 20, right: 20),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (!emailValid.hasMatch(value)) {
                              return "Enter valid Email";
                            }
                            if (value.isEmpty) {
                              return "Email Adress";
                            }
                          },
                          controller: _emailController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Email Address',
                            prefixIcon: Icon(Icons.mail_outline),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Divider(
                        height: 2,
                        color: Colors.grey,
                        indent: 15,
                        endIndent: 15,
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, left: 20, right: 20),
                        child: TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Enter phone Number";
                            }

                            if (value.length < 9) {
                              return "Enter Valid Number";
                            }
                          },
                          keyboardType: TextInputType.number,
                          controller: _phoneNumber,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Number',
                            prefixIcon: Icon(Icons.phone),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Divider(
                        height: 2,
                        color: Colors.grey,
                        indent: 15,
                        endIndent: 15,
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, left: 20, right: 20),
                        child: TextFormField(
                          controller: _password,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Password',
                              prefixIcon: Icon(Icons.lock_outline),
                              suffixIcon: Icon(Icons.remove_red_eye)),
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Divider(
                        height: 2,
                        color: Colors.grey,
                        indent: 15,
                        endIndent: 15,
                      ),
                      // locationDropDownMethod()
                      Padding(
                          padding: const EdgeInsets.only(
                              top: 0, left: 20, right: 20),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButtonFormField(
                              value: _selectedLocation,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.add_location)
                              ),
                              hint: Text("Select your location"),
                              onChanged: (value) {

                                setState(() {
                                  _selectedLocation = value;
                                  
                                });
                                print("-----on changed dropdown value-----");

                                print(_selectedLocation);
                              },
                              items: _currencies.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        RaisedButton(
          onPressed: () {},
          child: Text(
            "Sign Up",
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.purple,
          elevation: 4,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        )
        // buildPositionedSignUpButton()
      ],
    );
  }

  Positioned buildPositionedSignUpButton() {
    return Positioned(
      top: 337,
      left: 110,
      child: InkWell(
        splashColor: Colors.grey,
        child: RaisedButton(
          elevation: 15,
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0),
          ),
          onPressed: () {
            // postSignUp(_emailController.text, _password.text, _username.text, "", other_location, _phoneNumber.text);
          },
          textColor: Colors.white,
          padding: const EdgeInsets.all(0.0),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(color: Colors.black26, offset: Offset(0, 9))
              ],
              borderRadius: BorderRadius.circular(10.0),
              gradient: LinearGradient(
                colors: <Color>[
                  Colors.purple,
                  Colors.pink,
                  // Color(0xFF42A5F5),
                ],
              ),
            ),
            padding: const EdgeInsets.all(10.0),
            child: const Text('Sign Up',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
        ),
      ),
    );
  }

  locationDropDownMethod() {
    var _currencies = [
      "Food",
      "Transport",
      "Personal",
      "Shopping",
      "Medical",
      "Rent",
      "Movie",
      "Salary"
    ];

    var _currentSelectedValue = "Enter a value";

    return InputDecorator(
      decoration: InputDecoration(
        // labelStyle: textStyle,
        // errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
        hintText: 'Please select expense',
        // border: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(5.0),
        // ),
      ),
      // isEmpty: false,
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _currentSelectedValue,
          isDense: true,
          onChanged: (String newValue) {
            setState(() {
              _currentSelectedValue = newValue;
            });
          },
          items: _currencies.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );

    ;
  }
}
/*
TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Location',
                              prefixIcon: Icon(Icons.add_location),
                            )
                            //suffixIcon: Icon(Icons.remove_red_eye)),
                            ),
*/
