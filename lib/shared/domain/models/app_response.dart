import 'package:mosi2/shared/exceptions/http_exception.dart';
import 'package:mosi2/shared/domain/models/either.dart';

class AppResponse {
  final int statusCode;
  final String? statusMessage;
  final dynamic data;

  AppResponse({required this.statusCode, this.statusMessage, this.data = const {}});

  bool get isSuccessful => statusCode >= 200 && statusCode < 300;
}

extension ResponseExtension on AppResponse {
  Either<AppException, AppResponse> get toEither {
    return isSuccessful ? Right(this) : Left(AppException.fromStatusCode(statusCode, data));
  }
}