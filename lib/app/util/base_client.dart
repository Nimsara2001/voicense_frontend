import 'dart:convert';
import 'package:http/http.dart' as http;

const String baseUrl = 'http://192.168.8.100';

class BaseClient {
  var client = http.Client();
  var token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiNjY2MDlhMDhmMTZhYzFjYmYzMTA4MWQ1IiwiZXhwaXJlcyI6MTcyMjk2ODA1OC4yNzcxODgzfQ.bbcGwVLWQC2RfwQ5INwcaEjjnpYlGYJ6J59zIO7Wjio';

  Future<dynamic> get(String api, {Map<String, String>? parameters}) async {
    try {
      var url = Uri.parse(baseUrl + api);
      if (parameters != null) {
        url = Uri.http(url.authority, url.path, parameters);
      }

      var headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      };

      var response = await client.get(url, headers: headers);

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return {response.statusCode, response.body};
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      client.close();
    }
  }

  Future<dynamic> post(String api, {Map<String, String>? parameters}) async {
    try {
      var url = Uri.parse(baseUrl + api);
      if (parameters != null) {
        url = Uri.http(url.authority, url.path, parameters);
      }

      var headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      };

      var response = await client.post(url, headers: headers);

      if (response.statusCode == 200) {
        return response.body;
      } else {
        return {response.statusCode, response.body};
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      client.close();
    }
  }


}
