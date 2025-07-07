import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:bwv2/constants/env.dart';

class APICall {
  Future<dynamic> get(String route) async {
    final url = Uri.parse('$API_URL/$route');
    try {
      final response = await http.get(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      return jsonDecode(response.body);
    } catch (e) {
      return null;
    }
  }

  Future<dynamic> post(String route, dynamic body) async {
    final url = Uri.parse('$API_URL/$route');
    try {
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(body),
      );
      return jsonDecode(response.body);
    } catch (e) {
      return null;
    }
  }
}
