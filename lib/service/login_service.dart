import 'package:demo_cubit/dto/login_response_dto.dart';

class LoginService {
  static Future<LoginResponseDto> login(
      String username, String password) async {
    if (username == "jperez" && password == "123456") {
      return LoginResponseDto(
          token: "ey123hg123h123.12h323.adasd",
          refreshToken: "ey123hg123h123.12h323.adasd",
          firstName: "Juan",
          lastName: "Perez");
    } else {
      throw Exception("Credenciales invalidas");
    }
  }
}


// var response = await http.post(
//       'http://localhost:8080/login',
//       body: jsonEncode({
//         'username': username,
//         'password': password,
//       }),
//     );

//     if (response.statusCode == 200) {
//       return LoginResponse.fromJson(jsonDecode(response.body));
//     } else {
//       throw Exception('Failed to login.');
//     }