import 'package:http/http.dart' as http;
import 'dart:convert';

/// POST {KEYCLOAK_BASE_URL}/realms/{REALM_NAME}/protocol/openid-connect/token
/// {
//   "client_id": "CLIENT_ID",
//   "grant_type": "password",
//   "client_secret": "CLIENT_SECRET",
//   "username": "USERNAME",
//   "password": "PASSWORD"
// }
class AuthRepository {
  final String baseUrl;
  final String realm;
  final String clientId;
  final String clientSecret;

  AuthRepository({
    required this.baseUrl,
    required this.realm,
    required this.clientId,
    required this.clientSecret,
  });

  Future<String?> login(String username, String password) async {
    final url = '$baseUrl/realms/$realm/protocol/openid-connect/token';

    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: {
        'client_id': clientId,
        'grant_type': 'password',
        'client_secret': clientSecret,
        'username': username,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['access_token'];
    } else {
      print('Login failed: ${response.statusCode}');
      return null;
    }
  }
}
