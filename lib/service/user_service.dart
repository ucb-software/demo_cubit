import 'dart:convert';

import 'package:demo_cubit/dto/response_dto.dart';
import 'package:demo_cubit/dto/user_info_dto.dart';

import 'package:http/http.dart' as http;

class UserService {
  static const String backendUrlBase = "http://192.168.0.7:7777";
  Future<UserInfoDto> getUserInfo(String token) async {
    UserInfoDto result;
    var uri = Uri.parse("$backendUrlBase/api/v1/user/");
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    // Invocamos al backend
    var response = await http.get(uri, headers: headers);

    if (response.statusCode == 200) {
      // El backend procesó la solicitud entonces decodificamos
      ResponseDto backendResponse =
          ResponseDto.fromJson(jsonDecode(response.body));
      if (backendResponse.success) {
        // Si el backend me envió la información del usuario lo extraemos
        result = UserInfoDto.fromJson(backendResponse.data);
      } else {
        throw Exception(backendResponse.message);
      }
    } else {
      throw Exception(
          "Error desonocido al intentar consultar la información del usuario");
    }
    return result;
  }
}
