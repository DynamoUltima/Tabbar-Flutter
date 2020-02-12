import 'package:http/http.dart' as http;

String baseUrl = "http://www.forhey.com/forhey_mobile_scripts/";

Future<http.Response> postLogin(String email, String password) async {
  //var loginBody = LoginModel(email: email, password: password,tag: "login");
  // print(loginBody);
  //print(json.encode(loginBody));

  Map<String, String> body = {
    "email": email,
    "password": password,
    "tag": "login"
  };

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

Future<http.Response> postSignUp(
  String email,
  String password,
  String username,
  String location,
  String other_location,
  String phoneNumber,
) async {
  //var loginBody = LoginModel(email: email, password: password,tag: "login");
  // print(loginBody);
  //print(json.encode(loginBody));

  Map<String, String> body = {
    "tag": "register",
    "email": email,
    "password": password,
    "location": location,
    "other_location": other_location,
    "phone": phoneNumber,
    "gcm_regid": "",
    "new_user": "true",
    "From": "Email"
  };

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

Future<http.Response> orderPlaced(
  String tag,
  String pick_up_point,
  String pickup_date,
  String pick_from_time,
  String pick_to_time,
  String note,
  String delivery_date,
  String delivery_from_time,
  String delivery_to_time,
  String status,
  String user_id,
  String pickup_to_hour,
  String pickup_to_minute,
  String pickup_from_hour,
  String pickup_from_minute,
  String delivery_from_hour,
  String delivery_from_min,
  String delivery_to_hour,
  String delivery_to_min,
  String promotion,
  String promo_code,
  String fold,
  String press,
  String dry_clean,
  String p_only,
  String home_service,
  String nameOfUser,
  String location,
  String other_location,
  String server_code,
) async {
  Map<String, String> body = {
    'tag': tag,
    'pickup_point': pick_up_point,
    'pickup_date': pickup_date,
    'pick_from_time': pick_from_time,
    'pick_to_time': pick_to_time,
    'note': note,
    'delivery_date': delivery_date,
    'delivery_from_time': delivery_from_time,
    'delivery_to_time': delivery_to_time,
    'status': status,
    'user_id': user_id,
    'pickup_to_hour': pickup_to_hour,
    'pickup_to_minute': pickup_to_minute,
    'pickup_from_hour': pickup_from_hour,
    'pickup_from_minute': pickup_from_minute,
    'delivery_from_hour': delivery_from_hour,
    'delivery_from_min': delivery_from_min,
    'delivery_to_hour': delivery_to_hour,
    'delivery_to_min': delivery_to_min,
    'promotion': promotion,
    'promo_code': promo_code,
    'fold': fold,
    'press': press,
    'dry_clean': dry_clean,
    'p_only': p_only,
    'home_service': home_service,
    'nameOfUser': nameOfUser,
    'location': location,
    'other_location': other_location,
    'server_code': server_code
  };

  // print(json.encode(placeOrder));

  final response = await http.post(baseUrl + 'updated_order_process.php',
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded"
      },
      body: body);

  print(body);

  return response;
}

Future<http.Response> refferalCode(
    String tag, String code, String number) async {
  Map<String, String> body = {"tag": tag, "code": code, "number": number};

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

Future<http.Response> addUserPromoCode(
    //add_user_promo_code -tag
    String tag,
    String code,
    String userId) async {
  Map<String, String> body = {"tag": tag, "code": code, "user_id": userId};

  final response = await http.post(
    baseUrl + "new_forhey_scripts.php",
    headers: {
      "Accept": "application/json",
      "Content-Type": "application/x-www-form-urlencoded"
    },
    body: body,
  );
  return response;
}

Future<http.Response> notifySupport(
    String tag,
    int status,
//AppController.forheyService.notifySupport("complete_payment", 1, server_code, name, "")
    String serverCode,
    String name,
    String receipt) async {
  Map<String, dynamic> body = {
    "tag": tag,
    "status": status,
    "server_code": serverCode,
    "name": name,
    "receipt": receipt
  };
  //"complete_payment" tag
  //1 status
  //receipt ""

  final response = await http.post(
    baseUrl + "Order_Post.php",
    headers: {
      "Accept": "application/json",
      "Content-Type": "application/x-www-form-urlencoded"
      // HttpHeaders.contentTypeHeader: "application/x-www-form-urlencoded",
    },
    body: body,
  );
  return response;
}

Future<http.Response> sendSmsMessage(
  String message,
  String phoneNumber,
) async {
  Map<String, String> body = {
    "sms_message": message,
    "phonenumber": phoneNumber,
  };

  final response = await http.post(
    baseUrl + "txt_message_terminal.php",
    headers: {
      "Accept": "application/json",
      "Content-Type": "application/x-www-form-urlencoded"
    },
    body: body,
  );
  return response;
}

Future<http.Response> updateAccount(
  String tag,
  String email,
  String name,
  String location,
  String phone,
  String other_location,
  String street_name,
  String house_number,
  String reference,
  String company_name,
  String pickupPoint,
  String lat,
  String lng,
  String updated_at,
) async {
  Map<String, String> body = {
    "tag": tag,
    "email": email,
    "name": name,
    "location":location,
    "phone": phone,
    "other_location": other_location,
    "street_name": street_name,
    "house_number": house_number,
    "reference": reference,
    "company_name": company_name,
    "pickupPoint": pickupPoint,
    "lat": lat,
    "lng": lng,
    "updated_at":updated_at
  };

  final response = await http.post(
    baseUrl + "access_credentials.php",
    headers: {
      "Accept": "application/json",
      "Content-Type": "application/x-www-form-urlencoded"
    },
    body: body,
  );
  return response;
}

Future<http.Response> getOrderState(
  String tag,
  String serverCode,
) async {
  Map<String, dynamic> body = {
    "tag": tag,
    "server_code": serverCode,
  };

  final response = await http.post(
    baseUrl + "access_credentials.php",
    headers: {
      "Accept": "application/json",
      "Content-Type": "application/x-www-form-urlencoded"
    },
    body: body,
  );
  return response;
}

Future<http.Response> getOrderHistory(
  String tag,
  String email,
) async {
  Map<String, dynamic> body = {
    "tag": tag,
    "email": email,
  };

  final response = await http.post(
    baseUrl + "access_credentials.php",
    headers: {
      "Accept": "application/json",
      "Content-Type": "application/x-www-form-urlencoded"
    },
    body: body,
  );
  return response;
}

Future<http.Response> getPriceList(
  String tag,
) async {
  Map<String, dynamic> body = {
    "tag": tag,
  };

  final response = await http.post(
    baseUrl + "access_credentials.php",
    headers: {
      "Accept": "application/json",
      "Content-Type": "application/x-www-form-urlencoded"
    },
    body: body,
  );
  return response;
}

// Future<http.Response> updateAccounts(
//   String tag,
//   String email,
//   String name,
//   String location,
//   String phone,
//   String other_location,
//   String street_name,
//   String house_number,
//   String reference,
//   String company_name,
//   String pickupPoint, //watch out this could be pick_up_point
//   String lat,
//   String lng,
// ) async {
//   Map<String, dynamic> body = {
//     "tag": tag,
//     "email": email,
//     "name": name,
//     "location": location,
//     "phone": phone,
//     "other_location": other_location,
//     "street_name": street_name,
//     "house_number": house_number,
//     "reference": reference,
//     "company_name": company_name,
//     "pickupPoint": pickupPoint,
//     "lat": lat,
//     "lng": lng,
//   };

//   final response = await http.post(
//     baseUrl + "access_credentials.php",
//     headers: {
//       "Accept": "application/json",
//       "Content-Type": "application/x-www-form-urlencoded"
//     },
//     body: body,
//   );
//   return response;
// }

Future<http.Response> cancelOrder(
  String tag,
  String server_code,
  String status,
) async {
  Map<String, dynamic> body = {
    "tag": tag,
    "server_code": server_code,
    "status": status
  };

  final response = await http.post(
    baseUrl + "access_credentials.php",
    headers: {
      "Accept": "application/json",
      "Content-Type": "application/x-www-form-urlencoded"
    },
    body: body,
  );
  return response;
}

/*
Place Order
ForheyService.domain+"updated_order_process.php

@FormUrlEncoded
    @POST("access_credentials.php")
    Call<SuccessClass>  updateAccount(@Field("tag") String tag, @Field("email") String email, @Field("name") String name, @Field("location") String location,
                       @Field("phone") String phone,  @Field("other_location") String other_location,
                       @Field("cc") String street_name, @Field("house_number") String house_number, @Field("reference") String ref,
                       @Field("company_name") String company_name, @Field("pickupPoint") String pickupPoint, @Field("lat") String lat,
                       @Field("lng") String lng);




place order model

please note that some of the values of the PlaceOrderModel already have initial values
which can be added from the constuctors or  initialised as global variables

response model
{
"tag":"AddOrder",
"success":1,"error":0,"
user_id":"TH1031192646",
"promo":false,"
promo_message":"no promo",
"gcm_result":"Error=DeprecatedEndpoint",
"p_only":"0",
"press":"0",
"fold":"1",
"dry_clean":"0"
}

 class SuccessClass {
    public int success=0,error=0;
    public String error_msg,success_message;





*/
