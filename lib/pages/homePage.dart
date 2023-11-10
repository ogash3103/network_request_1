import 'package:flutter/material.dart';
import 'package:network_request_1/Model/employees.dart';

import '../service/Network_employee.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // _apiPostList();
    var employees = Employees(id: 1, employee_name: "John", employee_salary: 1200000, profile_image: "url");
    _apiPostCreate(employees);
    // _apiPostUpdate(employees);
  }
  void _apiPostList() {
    Network.GET(Network.API_LIST, Network.paramsEmpty()).then((response) => {
      print("API Response: $response"),
    });
  }



  void _apiPostCreate(Employees employees) {
    Network.POST(Network.API_CREATE, Network.paramsCreate(employees)).then(
          (response) => {
        print(response.toString()),
      },
    );
  }

  void _apiPostUpdate(Employees employees) {
    Network.PUT(Network.API_UPDATE + employees.id.toString(),
        Network.paramsUpdate(employees))
        .then(
          (response) => {
        print(response.toString()),
      },
    );
  }

  void _apiPostDelete(Employees employees) {
    Network.DELETE(Network.API_DELETE + employees.id.toString(),
        Network.paramsEmpty())
        .then(
          (response) => {
        print(response.toString()),
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
