// Un DTO significa Data Transfer Object
// Tambien puede ser llamado VO que significa Value Object
// En este caso, es un DTO porque es un objeto que se usa para transferir datos
// En java puede llamarse POJO (Plain Old Java Object)
// NO TIENEN LOGICA DE NEGOCIO

class LoginResponseDto {
  final bool success;
  final String? token;
  final String? refreshToken;
  final String? firstName;
  final String? lastName;

  LoginResponseDto(
      {this.success = false,
      this.token,
      this.refreshToken,
      this.firstName,
      this.lastName});

  // El endpoint retornará un JSON con la siguiente estructura:
  // { "token": "ey123hg123h123.12h323.adasd", "refreshToken": "ey123hg123h123.12h323.adasd",
  // "firstName": "Juan", "lastName": "Perez" }

  factory LoginResponseDto.fromJson(Map<String, dynamic> json) {
    return LoginResponseDto(
      token: json['token'],
      refreshToken: json['refreshToken'],
      firstName: json['firstName'],
      lastName: json['lastName'],
    );
  }
}
