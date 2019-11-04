import 'dart:convert';
import 'dart:io';


import 'package:http/http.dart' as http;
import 'package:tabbar/models/login/login_mode.dart';
import 'package:tabbar/models/place_order/place_order.dart';




String baseUrl = "http://www.forhey.com/forhey_mobile_scripts/";


Future<http.Response> postLogin(String email, String password) async {
  //var loginBody = LoginModel(email: email, password: password,tag: "login");
 // print(loginBody);
  //print(json.encode(loginBody));

  Map<String, String> body = {"email":email,"password":password,"tag":"login"};

  final response = await http.post(
    baseUrl + "access_credentials.php", 
    headers: {
      "Accept": "application/json",
      "Content-Type": "application/x-www-form-urlencoded"
   // HttpHeaders.contentTypeHeader: "application/x-www-form-urlencoded",
  },
  body: body,
  

  );
 
  return response;

}

Future<http.Response> orderPlaced(PlaceOrder placeOrder) async {
  
  print(json.encode(placeOrder));

  final response = await http.post(
    baseUrl + 'updated_order_process.php', 
    headers: {
    HttpHeaders.contentTypeHeader: 'application/json',
  },
  body: json.encode(placeOrder)

  );

  return response;

}





