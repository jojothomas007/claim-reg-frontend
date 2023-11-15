import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../models/Claim.dart';
import '../models/ClaimItem.dart';
import '../utils/ApiConstants.dart';

class ClaimItemService {
  Future<List<Claim>> getClaimItems(int claimId) async {
    var client = http.Client();
    try {
      var url = Uri.parse(
          "${ApiConstants.baseurl}/claimItems/findByClaim?claimId=$claimId");
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

  Future<ClaimItem> postClaimItem(ClaimItem claimItem) async {
    var client = http.Client();
    try {
      var url = Uri.parse("${ApiConstants.baseurl}/claim-items");
      print(claimItem.toJson().toString());
      var resp = await client.post(url,
          headers: {HttpHeaders.contentTypeHeader: 'application/json'},
          body: jsonEncode(claimItem.toJson()));
      if (resp.statusCode == 200) {
        final json = jsonDecode(resp.body);
        return ClaimItem.fromJson(json);
      } else {
        print(resp.body);
        throw Exception('Failed to create Claim Item : ${resp.body}');
      }
    } catch (e) {
      log(e.toString());
      throw Exception('Error occurred  while creating a Claim Item');
    }
  }
}
