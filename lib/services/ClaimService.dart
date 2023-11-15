import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../models/Claim.dart';
import '../utils/ApiConstants.dart';

class ClaimService {
  Future<List<Claim>> getClaims() async {
    var client = http.Client();
    try {
      var url = Uri.parse("${ApiConstants.baseurl}/claims?status=created");
      print(url.toString());
      var resp = await client.get(url);
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

  Future<Claim> postClaim(Claim claim) async {
    var client = http.Client();
    try {
      var url = Uri.parse("${ApiConstants.baseurl}/claims");
      log(url.toString());
      print(claim.toJson().toString());
      var resp = await client.post(url,
          headers: {HttpHeaders.contentTypeHeader: 'application/json'},
          body: jsonEncode(claim.toJson()));
      if (resp.statusCode == 200) {
        final json = jsonDecode(resp.body);
        return Claim.fromJson(json);
      } else {
        throw Exception('Failed to load Claims : ${resp.body}');
      }
    } catch (e) {
      log(e.toString());
      throw Exception('Error occurred  while loading Claims');
    }
  }
}
