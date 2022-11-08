import 'dart:convert';

import 'package:demo_cubit/dto/login_response_dto.dart';
import 'package:demo_cubit/dto/response_dto.dart';
import 'package:http/http.dart' as http;

// Las clases Service únicamente realizan solicitudes REST al Backend.
class LoginService {
  // Cómo es posible que la URL cambie de acuerdo a la red WIFI, entonces es
  // recomendable tenerlo en una variable
  static const String backendUrlBase = "http://192.168.0.7:7777";

  // Enviamos al backend username y password para su validación.
  static Future<LoginResponseDto> login(
      String username, String password) async {
    LoginResponseDto result;

    // Construimos la URI para formatear espacios, tildes, etc.
    // username => "JUAN PEREZ" ~URL ENCODING~> "JUAN%20PEREZ"
    // var uri = Uri.parse('http://192.168.0.7:7777/api/v1/auth/' + username);
    var uri = Uri.parse("$backendUrlBase/api/v1/auth/");
    // Construimos el cuerpo de la solicitud REST de acuerdo a la especificaicón
    // Que Banckend nos entrego.
    var body = jsonEncode({
      'username': username,
      'password': password,
    });
    // Como es Java es obligatorio mandar Content-Type y Accept
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    };
    // Realizamos la invocación al Backend con los datos proporcionados.
    var response = await http.post(uri, headers: headers, body: body);
    // Se ha decidido que cualqueira que fuera la respuesta de Backend, siempre
    // se retorna 200, cualquier otra cosa es un error deconocido
    if (response.statusCode == 200) {
      // 200 significa que el backend proceso la solicitud.
      // Decodifficamos el JSON a un objecto Response
      var responseDto = ResponseDto.fromJson(jsonDecode(response.body));
      // Preguto si el backend dió exitosa la solicitud
      if (responseDto.success) {
        // Decodifcamos el data del objecto Response del backend y lo covertimos
        // a una clase Dart para retornarselo al CUBIT
        result = LoginResponseDto.fromJson(responseDto.data);
      } else {
        // Si el backend envíe error (success = true), entonces seguramente
        // envió un message para mostrarle a nuestra usuario final
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

