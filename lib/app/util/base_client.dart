import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

const String baseUrl = 'http://192.168.8.100:8000';

Future<String?> getToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('token');
  return token;
}


class BaseClient {
  var client = http.Client();

  Future<dynamic> get(String api, {Map<String, String>? parameters}) async {
    try {
      var url = Uri.parse(baseUrl + api);
      var token = await getToken();
      if (parameters != null) {
        url = Uri.http(url.authority, url.path, parameters);
      }

      var headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      };

      var response = await client.get(url, headers: headers);

      return response;

    } catch (e) {
      print('Error: $e');
    } finally {
      client.close();
    }
  }

  Future<dynamic> post(String api, {Map<String, String>? parameters}) async {
    try {
      var url = Uri.parse(baseUrl + api);
      var token = await getToken();
      if (parameters != null) {
        url = Uri.http(url.authority, url.path, parameters);
      }

      var headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      };

      var response = await client.post(url, headers: headers);

      return response;

    } catch (e) {
      print('Error: $e');
    } finally {
      client.close();
    }
  }

  Future<dynamic> put(String api, {Map<String, String>? parameters}) async {
    try {
      var url = Uri.parse(baseUrl + api);
      var token = await getToken();
      if (parameters != null) {
        url = Uri.http(url.authority, url.path, parameters);
      }

      var headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      };

      var response = await client.put(url, headers: headers);

      return response;

    } catch (e) {
      print('Error: $e');
    } finally {
      client.close();
    }
  }
}
