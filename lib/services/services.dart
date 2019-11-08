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

Future<http.Response> orderPlaced( String tag,
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
  String server_code,) async {

  Map<String,String> body={
      'tag': tag,
      'pick_up_point': pick_up_point,
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
      'promo_code':promo_code,
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

  final response = await http.post(
    baseUrl + 'updated_order_process.php', 
    headers: {
    HttpHeaders.contentTypeHeader: 'application/json',
  },
  body: json.encode(body)

  );

  return response;

}

Future<http.Response> refferalCode(String tag, String code,String number) async {
  
  Map<String, String> body = {"tag":tag,"code":code,"number":number};

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


Future<http.Response> addUserPromoCode(String tag, String code,String user) async {
  
  Map<String, String> body = {"tag":tag,"code":code,"user":user};

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


Future<http.Response> notifySupport(String tag, String status,String serverCode,String name, String receipt) async {
  
  Map<String, String> body = {"tag":tag,"status":status,"server_code":serverCode, "name":name,"receipt":receipt};
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

/*
Place Order
ForheyService.domain+"updated_order_process.php



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



@FormUrlEncoded
    @POST("access_credentials.php")
    Call<SuccessClass>  updateAccount(@Field("tag") String tag, @Field("email") String email, @Field("name") String name, @Field("location") String location,
                       @Field("phone") String phone,  @Field("other_location") String other_location,
                       @Field("street_name") String street_name, @Field("house_number") String house_number, @Field("reference") String ref,
                       @Field("company_name") String company_name, @Field("pickupPoint") String pickupPoint, @Field("lat") String lat,
                       @Field("lng") String lng);


*/





