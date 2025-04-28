import 'package:dio/dio.dart';
import 'package:mosi2/shared/domain/models/app_response.dart';
import 'package:mosi2/shared/exceptions/http_exception.dart';
import 'package:mosi2/shared/domain/models/either.dart';

/// Mixin para manejar excepciones en peticiones de red.
mixin ExceptionHandlerMixin {
  Future<Either<AppException, AppResponse>> handleException(
    Future<AppResponse> Function() request, {
    required String endpoint,
  }) async {
    try {
      final response = await request();
      return response
          .toEither; // 🔥 Conversión automática a `Either<AppException, AppResponse>`
    } on DioException catch (dioError) {
      return Left(_handleDioException(dioError, endpoint));
    } catch (e) {
      return Left(AppException(message: "Error desconocido en $endpoint: $e"));
    }
  }

  AppException _handleDioException(DioException dioError, String endpoint) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return AppException(message: "Tiempo de espera agotado en $endpoint");
      case DioExceptionType.badResponse:
        return AppException.fromStatusCode(
            dioError.response?.statusCode, dioError.response?.data);
      default:
        return AppException(message: "Error en $endpoint: ${dioError.message}");
    }
  }
}
