import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../models/Claim.dart';

class RemoteService {
  Future<List<Claim>> getClaims() async {
    var client = http.Client();
    try {
      var url = Uri.parse("${ApiConstants.baseurl}/claims?status=created");
      print(url.toString());
      var resp = await client.get(url);
      //, headers: {'Access-Control-Allow-Origin':'*','Access-Control-Allow-Credentials':'true', 'Access-Control-Allow-Methods':'GET, DELETE, HEAD, OPTIONS'});
      if (resp.statusCode == 200) {
        var json = resp.body;
        return parseClaim(resp.body);
      } else {
        throw Exception('Failed to load Claims');
      }
    } catch (e) {
      log(e.toString());
      throw Exception('Error occurred  while loading Claims');
    }
  }

  // A function that converts a response body into a List<Photo>.
  List<Claim> parseClaim(String responseBody) {
    final parsed =
        (jsonDecode(responseBody) as List).cast<Map<String, dynamic>>();

    return parsed.map<Claim>((json) => Claim.fromJson(json)).toList();
  }
}

class ApiConstants {
  static String baseurl = 'http://localhost:8080';
}
