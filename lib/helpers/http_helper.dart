import 'dart:io';
import 'package:auth_starter/services/config_service.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HttpHelper {
  final config = ConfigService();

  /// GET
  Future<http.Response> get(String requestUrl) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString('auth.token');

    return http.get(config.baseURL + requestUrl,
        headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});
  }

  /// DELETE
  Future<http.Response> delete(String requestUrl) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString('auth.token');

    return http.delete(config.baseURL + requestUrl,
        headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});
  }

  /// POST
  Future<http.Response> post(String requestUrl, {dynamic body}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString('auth.token');

    return http.post(config.baseURL + requestUrl,
        body: body,
        headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});
  }

  /// PUT
  Future<http.Response> put(String requestUrl, {dynamic body}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString('auth.token');

    return http.put(config.baseURL + requestUrl,
        body: body,
        headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});
  }
}
