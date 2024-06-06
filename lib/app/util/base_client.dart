import 'dart:convert';
import 'package:http/http.dart' as http;

const String baseUrl = 'http://127.0.0.1:8000';

class BaseClient {
  var client = http.Client();

  Future<dynamic> get(String api) async {
    try {
      var url = Uri.parse(baseUrl + api);
      var _headers = {
        'Authorization': 'bearer_auth_token',
        'api_key': 'api_key',
      };

      var response = await client.get(url, headers: _headers);

      if (response.statusCode == 200) {
        return response.body;
      } else {
        print('Error: Status code ${response.statusCode}');
        // Handle other status codes here
        // throw Exception('Request failed with status ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      // Handle network errors or other exceptions
      // throw Exception('Network error: $e');
    } finally {
      client.close(); // Clean up resources
    }
  }

  Future<dynamic> post(String api, dynamic object) async {
    try {
      var url = Uri.parse(baseUrl + api);
      var _payload = json.encode(object);
      var _headers = {
        'Authorization': 'bearer_auth_token',
        'Content-Type': 'application/json',
        'api_key': 'api_key',
      };

      var response = await client.post(url, body: _payload, headers: _headers);

      if (response.statusCode == 201) {
        return response.body;
      } else {
        print('Error: Status code ${response.statusCode}');
        // Handle other status codes here
        // throw Exception('Request failed with status ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      // Handle network errors or other exceptions
      // throw Exception('Network error: $e');
    } finally {
      client.close(); // Clean up resources
    }
  }

  Future<dynamic> put(String api, dynamic object) async {
    try {
      var url = Uri.parse(baseUrl + api);
      var _payload = json.encode(object);
      var _headers = {
        'Authorization': 'bearer_auth_token',
        'Content-Type': 'application/json',
        'api_key': 'api_key',
      };

      var response = await client.put(url, body: _payload, headers: _headers);

      if (response.statusCode == 200) {
        return response.body;
      } else {
        print('Error: Status code ${response.statusCode}');
        // Handle other status codes here
        // throw Exception('Request failed with status ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      // Handle network errors or other exceptions
      // throw Exception('Network error: $e');
    } finally {
      client.close(); // Clean up resources
    }
  }

  Future<dynamic> delete(String api) async {
    try {
      var url = Uri.parse(baseUrl + api);
      var _headers = {
        'Authorization': 'bearer_auth_token',
        'api_key': 'api_key',
      };

      var response = await client.delete(url, headers: _headers);

      if (response.statusCode == 200) {
        return response.body;
      } else {
        print('Error: Status code ${response.statusCode}');
        // Handle other status codes here
        // throw Exception('Request failed with status ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      // Handle network errors or other exceptions
      // throw Exception('Network error: $e');
    } finally {
      client.close(); // Clean up resources
    }
  }
}
