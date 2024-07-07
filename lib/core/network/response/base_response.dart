import 'dart:convert';

class Response<T> {
  T? data;
  int? statusCode;
  String? statusMessage;

  Response({
    this.data,
    this.statusCode = 200,
    this.statusMessage = 'OK',
  });

  @override
  String toString() {
    if (data is Map) {
      return json.encode(data);
    }
    return data.toString();
  }
}
