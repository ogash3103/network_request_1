
class Employees{
  int? id;
  String? employee_name;
  int? employee_salary;
  String? profile_image;

  Employees({this.id, this.employee_name, this.employee_salary , this.profile_image});

  Employees.fromJson(Map<String, dynamic> json): id = json['id'],
        employee_name = json['employee_name'],
        employee_salary = json['employee_salary'],
        profile_image = json['profile_image'];
  Map<String, dynamic> toJson() => {
    'id':id,
    'employee_name':employee_name,
    'employee_salary':employee_salary,
    'profile_image':profile_image,
  };

}