class UserInfoDto {
  final String firstName;
  final String lastName;
  final String username;

  UserInfoDto(
      {required this.firstName,
      required this.lastName,
      required this.username});

  factory UserInfoDto.fromJson(Map<String, dynamic> json) {
    return UserInfoDto(
      firstName: json['firstName'],
      lastName: json['lastName'],
      username: json['username'],
    );
  }
}
