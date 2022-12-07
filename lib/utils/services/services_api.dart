import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:qr_code_scanner_app/config/base_url.dart';

class ApiService {
  Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization': ""
  };

  //GET Method
  Future<Map<String, dynamic>?> getFunction(
      String urlEndPoint, String jsonParameters) async {
    try {
      var url = Uri.parse(
          BaseURL.baseURL + urlEndPoint.toString() + jsonParameters.toString());
      var response = await http.get(url, headers: requestHeaders);
      if (response.statusCode == 200) {
        var _model = jsonDecode(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
      return jsonDecode(e.toString());
    }
    return null;
  }

  //POST Method

  Future<Map<String, dynamic>?> postFunction(
      String urlEndPoint, Map<String, dynamic> jsonParameters) async {
    try {
      var url = Uri.parse(BaseURL.baseURL + urlEndPoint);
      var response = await http.post(url, body: jsonEncode(jsonParameters));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      }
    } catch (e) {
      log(e.toString());
      return jsonDecode(e.toString());
    }
    return null;
  }

//PUT Method
  Future<Map<String, dynamic>?> putFunction(
      String urlEndPoint, dynamic jsonParameters) async {
    try {
      var url = Uri.parse(BaseURL.baseURL + urlEndPoint);
      var response = await http.put(url, body: jsonEncode(jsonParameters));
      if (response.statusCode == 200) {
        var _model = jsonDecode(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
      return jsonDecode(e.toString());
    }
    return null;
  }
}
