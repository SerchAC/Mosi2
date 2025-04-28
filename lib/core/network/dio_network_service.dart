import 'package:dio/dio.dart' as dio;
import 'package:flutter/foundation.dart';
import 'package:mosi2/core/network/network_service.dart';
import 'package:mosi2/core/network/exception_handler_mixin.dart';
import 'package:mosi2/core/environment/env_config.dart';
import 'package:mosi2/shared/domain/models/app_response.dart';
import 'package:mosi2/shared/domain/models/either.dart';
import 'package:mosi2/shared/exceptions/http_exception.dart';

/// Implementación de `NetworkService` utilizando `Dio`
class DioNetworkService extends NetworkService with ExceptionHandlerMixin {
  final dio.Dio _dio;

  DioNetworkService(this._dio) {
    _dio.options = dioBaseOptions;
    _updateDioHeaders();
    if (kDebugMode) {
      _dio.interceptors
          .add(dio.LogInterceptor(requestBody: true, responseBody: true));
    }
  }

  /// 🔥 Implementación concreta de `baseUrl`
  @override
  String get baseUrl => EnvConfig.instance.baseUrl;

  /// Opciones base de `Dio`
  dio.BaseOptions get dioBaseOptions => dio.BaseOptions(
        baseUrl: baseUrl,
        headers: headers,
      );

  /// Cabeceras generales para todas las peticiones
  @override
  Map<String, Object> get headers => {
        'accept': 'application/json',
        'content-type': 'application/json',
      };

  /// Actualiza las cabeceras de `_dio`
  void _updateDioHeaders([Map<String, dynamic>? newHeaders]) {
    _dio.options.headers = {...headers, ...?newHeaders};
  }

  /// Actualiza dinámicamente las cabeceras
  @override
  Map<String, dynamic>? updateHeader(Map<String, dynamic> data) {
    final updatedHeaders = {...headers, ...data};
    _updateDioHeaders(updatedHeaders);
    return updatedHeaders;
  }

  /// Realiza una petición `GET`
  @override
  Future<Either<AppException, AppResponse>> get(String endpoint,
      {Map<String, dynamic>? queryParameters}) {
    return handleException(
      () async {
        final res = await _dio.get(endpoint, queryParameters: queryParameters);
        return AppResponse(
          statusCode: res.statusCode ?? 500,
          statusMessage: res.statusMessage,
          data: res.data,
        ); // 🔥 Ahora retorna un `Future<AppResponse>`
      },
      endpoint: endpoint,
    );
  }

  /// Realiza una petición `POST`
  @override
  Future<Either<AppException, AppResponse>> post(String endpoint,
      {Map<String, dynamic>? data}) {
    return handleException(
      () async {
        final res = await _dio.post(endpoint, data: data);
        return AppResponse(
          statusCode: res.statusCode ?? 500,
          statusMessage: res.statusMessage,
          data: res.data,
        );
      },
      endpoint: endpoint,
    );
  }

  /// Realiza una petición `PUT`
  @override
  Future<Either<AppException, AppResponse>> put(String endpoint,
      {Map<String, dynamic>? data}) {
    return handleException(
      () async {
        final res = await _dio.put(endpoint, data: data);
        return AppResponse(
          statusCode: res.statusCode ?? 500,
          statusMessage: res.statusMessage,
          data: res.data,
        );
      },
      endpoint: endpoint,
    );
  }

  /// Realiza una petición `DELETE`
  @override
  Future<Either<AppException, AppResponse>> delete(String endpoint,
      {Map<String, dynamic>? queryParameters}) {
    return handleException(
      () async {
        final res =
            await _dio.delete(endpoint, queryParameters: queryParameters);
        return AppResponse(
          statusCode: res.statusCode ?? 500,
          statusMessage: res.statusMessage,
          data: res.data,
        );
      },
      endpoint: endpoint,
    );
  }
}
