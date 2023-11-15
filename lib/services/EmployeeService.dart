import 'dart:convert';
import 'dart:developer';

import 'package:claim_reg_frontend/utils/ApiConstants.dart';
import 'package:http/http.dart' as http;

import '../models/Employee.dart';

class EmployeeService {
  Future<List<Employee>> getEmployees() async {
    var client = http.Client();
    try {
      var url = Uri.parse("${ApiConstants.baseurl}/employees?role=Approver");
      var resp = await client.get(url);
      if (resp.statusCode == 200) {
        var json = resp.body;
        return parseEmployee(resp.body);
      } else {
        throw Exception('Failed to load Employees');
      }
    } catch (e) {
      log(e.toString());
      throw Exception('Error occurred  while loading Employees');
    }
  }

  // A function that converts a response body into a List<Objects>.
  List<Employee> parseEmployee(String responseBody) {
    final parsed =
        (jsonDecode(responseBody) as List).cast<Map<String, dynamic>>();

    return parsed.map<Employee>((json) => Employee.fromJson(json)).toList();
  }
}
