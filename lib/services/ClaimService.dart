import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:claim_reg_frontend/enums/claim_status.dart';
import 'package:http/http.dart' as http;

import '../models/Claim.dart';
import '../utils/Constants.dart';

class ClaimService {
  Future<List<Claim>> getClaims(ClaimStatus status) async {
    var client = http.Client();
    try {
      var url = Uri.parse("${Constants.baseurl}/claims?status=${status.name}");
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
      var url = Uri.parse("${Constants.baseurl}/claims");
      log(url.toString());
      print('Request body: ${jsonEncode(claim.toJson())}');
      var resp = await client.post(url,
          headers: {HttpHeaders.contentTypeHeader: 'application/json'},
          body: jsonEncode(claim.toJson()));
      if (resp.statusCode == 200) {
        final json = jsonDecode(resp.body);
        print('Response body: ${Claim.fromJson(json)}');
        return Claim.fromJson(jsonDecode(resp.body));
      } else {
        throw Exception('Failed to create a Claim : ${resp.body}');
      }
    } catch (e) {
      log(e.toString());
      throw Exception('Error occurred  while loading Claims');
    }
  }
}
