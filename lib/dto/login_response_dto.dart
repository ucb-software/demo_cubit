// Un DTO significa Data Transfer Object
// Tambien puede ser llamado VO que significa Value Object
// En este caso, es un DTO porque es un objeto que se usa para transferir datos
// En java puede llamarse POJO (Plain Old Java Object)
// NO TIENEN LOGICA DE NEGOCIO

class LoginResponseDto {
  final String? token;
  final String? refresh;

  LoginResponseDto({this.token, this.refresh});

  factory LoginResponseDto.fromJson(Map<String, dynamic> json) {
    return LoginResponseDto(token: json['token'], refresh: json['refresh']);
  }
}
