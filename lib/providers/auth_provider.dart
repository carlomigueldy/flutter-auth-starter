import 'package:auth_starter/services/auth_service.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart';
import 'dart:convert';

class AuthProvider extends ChangeNotifier {
  final _authService = AuthService();
  String _token;
  String _tokenType;
  Map _user;
  bool _loggedIn = false;

  Map get user => _user;
  bool get loggedIn => _loggedIn;
  String get token => _token;
  String get tokenType => _tokenType;
  String get fullName {
    if (_user == null) {
      return 'Anonymous';
    }

    return _user['full_name'];
  }

  void setUser(user) {
    _user = user;
    notifyListeners();
  }

  void setLoggedIn(value) {
    _loggedIn = value;
    notifyListeners();
  }

  /// Get the user
  void fetchUser() async {
    try {
      Response response = await _authService.fetchUser();
      setUser(jsonDecode(response.body));
    } catch (e) {
      print('Error caugh: $e');
    }
  }

  /// Login to API
  Future<int> login(String email, String password) async {
    Response response = await _authService.authenticate(email, password);

    if (response.statusCode != 200) {
      setLoggedIn(false);
      return response.statusCode;
    }

    var data = jsonDecode(response.body);
    storeToken(data['access_token'], data['token_type']);
    setLoggedIn(true);
    return response.statusCode;
  }

  /// Logout from API
  Future<int> logout() async {
    Response response = await _authService.unauthenticate();
    if (response.statusCode != 200) {
      setLoggedIn(true);
      return response.statusCode;
    }

    destroyToken();
    setLoggedIn(false);
    return response.statusCode;
  }

  Future<String> getToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString('auth.token');
    return token;
  }

  /// Stores the authentication token
  void storeToken(String token, String tokenType) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('auth.token', token);
    pref.setString('auth.token_type', tokenType);
    notifyListeners();
  }

  /// Destroys the token
  void destroyToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove('auth.token');
    pref.remove('auth.token_type');
    notifyListeners();
  }
}
