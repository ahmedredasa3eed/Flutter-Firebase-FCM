import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_constants.dart';

class ApiClient {

  dynamic get(
    String path, {
    required Map<String, String> headers,
    required Map<String, dynamic> parameters,
  }) async {
    final url = Uri.https(ApiConstants.BASE_URL, path, parameters);
    final response = await http.get(
      url,
      headers: headers,
    );
    return _checkResponse(response);
  }

  dynamic post(
    String path, {
    required Map<String, dynamic> body,
    required Map<String, String> headers,
    required Map<String, dynamic> parameters,
  }) async {
    final url = Uri.https(ApiConstants.BASE_URL, path, parameters);
    final response = await http.post(
      url,
      body: body == null ? {} : jsonEncode(body),
      headers: headers,
    );
    return _checkResponse(response);
  }

  dynamic _checkResponse(http.Response response) {
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      print(response.reasonPhrase);
      throw Exception(response.reasonPhrase);
    }
  }
}
