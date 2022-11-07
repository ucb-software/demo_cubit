import 'dart:convert';

import 'package:demo_cubit/dto/login_response_dto.dart';
import 'package:demo_cubit/dto/response_dto.dart';
import 'package:http/http.dart' as http;

class LoginService {
  static const String backendUrlBase = "http://192.168.0.7:7777";

  static Future<LoginResponseDto> login(
      String username, String password) async {
    LoginResponseDto result;
    // username => "JUAN PEREZ" ~URL ENCODING~> "JUAN%20PEREZ"
    // var uri = Uri.parse('http://192.168.0.7:7777/api/v1/auth/' + username);
    var uri = Uri.parse("$backendUrlBase/api/v1/auth/");
    var body = jsonEncode({
      'username': username,
      'password': password,
    });
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    };
    var response = await http.post(uri, headers: headers, body: body);
    if (response.statusCode == 200) {
      var responseDto = ResponseDto.fromJson(jsonDecode(response.body));
      if (responseDto.success) {
        result = LoginResponseDto.fromJson(responseDto.data);
      } else {
        throw Exception(responseDto.message);
      }
    } else {
      throw Exception('Failed to login.');
    }
    return result;
  }
}

    // if (username == "jperez" && password == "123456") {
    //   return LoginResponseDto(
    //       success: true,
    //       token: "ey123hg123h123.12h323.adasd",
    //       refreshToken: "ey123hg123h123.12h323.adasd",
    //       firstName: "Juan",
    //       lastName: "Perez");
    // } else if (username == "mgomez") {
    //   throw Exception("Error de comunicación con internet");
    // } else {
    //   return LoginResponseDto(success: false);
    // }

