import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:network_request_1/Model/employees.dart';
import 'package:network_request_1/Model/post_model.dart';

class Network {
  static String BASE = "dummy.restapiexample.com";
  static Map<String, String> headers = {
    'Content-type': 'application/json; charset=UTF-8',
  };

  // Http Apis
  static String API_LIST = "/posts";
  static String API_Create = "/posts";
  static String API_Update = "/posts"; // {id}
  static String API_Delete = "/posts"; // {id}

  // Http Requests
  static Future<String?> GET(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api, params);
    var response = await get(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      print("Error: ${response.statusCode} - ${response.reasonPhrase}");
      return null;
    }
  }


  static Future<String?> POST(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api);
    var response = await post(uri, headers: headers, body: jsonEncode(params));
    if(response.statusCode == 200 ||response.statusCode == 201){
      return response.body;
    }
    return null;
  }
  static Future<String?> PUT(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api);
    var response = await put(uri, headers: headers, body: jsonEncode(params));
    if(response.statusCode == 200 ||response.statusCode == 202){
      return response.body;
    }
    return null;
  }
  static Future<String?> DELETE(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api, params);
    var response = await delete(uri, headers: headers);
    if(response.statusCode == 200){
      return response.body;
    }
    return null;
  }

// Http params
static Map<String , String> paramsEmpty(){
    Map<String, String> params = Map();
    return params;
}

static Map<String , String> paramsCreate (Employees employees){
    Map<String , String> params = Map();
    params.addAll({
      'employee_name': employees.employee_name!,
      'employee_salary': employees.employee_salary.toString(),
      'profile_image': employees.profile_image.toString(),
    });
    return params;
}

  static Map<String , String> paramsUpdate(Employees employees){
    Map<String , String> params = Map();
    params.addAll({
      'id': employees.id.toString(),
      'employee_name': employees.employee_name!,
      'employee_salary': employees.employee_salary.toString(),
      'profile_image': employees.profile_image.toString(),
    });
    return params;
  }

// Http Response
}
