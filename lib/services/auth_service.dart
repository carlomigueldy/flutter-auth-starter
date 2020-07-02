import 'package:auth_starter/helpers/http_helper.dart';
import 'package:http/http.dart';

class AuthService {
  final http = HttpHelper();

  /// Authenticate user to API.
  Future<Response> authenticate(String email, String password) async {
    return http
        .post('/api/auth/login', body: {'email': email, 'password': password});
  }

  /// Authenticate user to API.
  Future<Response> unauthenticate() async {
    return http.get('/api/auth/logout');
  }

  /// Fetch the currently authenticated user
  Future<Response> fetchUser() async {
    return http.get('/api/auth/user');
  }
}
