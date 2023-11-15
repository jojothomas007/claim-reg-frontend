import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:claim_reg_frontend/models/DocField.dart';
import 'package:claim_reg_frontend/utils/Constants.dart';
import 'package:http/http.dart' as http;

class ScannerService {
  Future<List<DocField>> postScanFile(String filePath) async {
    var client = http.Client();
    try {
      var url = Uri.parse("${Constants.baseurl}/scan-file");
      log("scanning file : $filePath");
      var resp = await client.post(url,
          headers: {HttpHeaders.contentTypeHeader: 'application/json'},
          body: filePath);
      if (resp.statusCode == 200) {
        return parseDocField(resp.body);
      } else {
        throw Exception('Failed to scan file.');
      }
    } catch (e) {
      log(e.toString());
      throw Exception('Error occurred  while scanning file');
    }
  }

  List<DocField> parseDocField(String responseBody) {
    final parsed =
        (jsonDecode(responseBody) as List).cast<Map<String, dynamic>>();
    return parsed.map<DocField>((json) => DocField.fromJson(json)).toList();
  }
}
