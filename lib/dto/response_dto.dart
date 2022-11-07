class ResponseDto<T> {
  final bool success;
  final String? message;
  final T? data;

  ResponseDto({this.success = false, this.message, this.data});

  factory ResponseDto.fromJson(Map<String, dynamic> json) {
    return ResponseDto(
      success: json['success'],
      message: json['message'],
      data: json['data'],
    );
  }
}
