import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:network_request_1/Model/employees.dart';

class Network {
  static String BASE = "dummy.restapiexample.com/api/v1/employees";
  static Map<String, String> headers = {
    'Content-type': 'application/json; charset=UTF-8',
  };

  // Http Apis
  static String API_LIST = "/api/v1/employees";
  static String API_CREATE = "/api/v1/create";
  static String API_UPDATE = "/api/v1/update/"; // {id}
  static String API_DELETE = "/api/v1/delete/"; // {id}

  // Http Requests
  static Future<String?> GET(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api, params);
    var response = await get(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      print("Error: ${response.statusCode} ");
      return null;
    }
  }

  static Future<String?> POST(String api, Map<String, dynamic> params) async {
    var uri = Uri.https(BASE, api);
    var response = await post(uri, headers: headers, body: jsonEncode(params));
    if (response.statusCode == 201) {
      return response.body;
    } else {
      print("Error: ${response.statusCode} ");
      return null;
    }
  }

  static Future<String?> PUT(String api, Map<String, dynamic> params) async {
    var uri = Uri.https(BASE, api);
    var response = await put(uri, headers: headers, body: jsonEncode(params));
    if (response.statusCode == 200 || response.statusCode == 202) {
      return response.body;
    } else {
      print("Error: ${response.statusCode}");
      return null;
    }
  }

  static Future<String?> DELETE(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api, params);
    var response = await delete(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      print("Error: ${response.statusCode}");
      return null;
    }
  }

  // Http params
  static Map<String, String> paramsEmpty() {
    Map<String, String> params = Map();
    return params;
  }

  static Map<String, dynamic> paramsCreate(Employees employees) {
    Map<String, dynamic> params = {
      'employee_name': employees.employee_name!,
      'employee_salary': employees.employee_salary,
      'profile_image': employees.profile_image,
    };
    return params;
  }

  static Map<String, dynamic> paramsUpdate(Employees employees) {
    Map<String, dynamic> params = {
      'id': employees.id.toString(),
      'employee_name': employees.employee_name!,
      'employee_salary': employees.employee_salary,
      'profile_image': employees.profile_image,
    };
    return params;
  }

// Http Response
}
