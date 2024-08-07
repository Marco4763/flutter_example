abstract class IResponseModel {
  late final int? statusCode;
  late final Map<String, dynamic>? body;
  late final String? message;

  IResponseModel({
    this.statusCode,
    this.message,
    this.body,
  });
}
