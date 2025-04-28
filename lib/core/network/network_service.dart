import 'package:mosi2/shared/domain/models/either.dart';
import 'package:mosi2/shared/domain/models/app_response.dart';
import 'package:mosi2/shared/exceptions/http_exception.dart';

/// Interfaz para servicios de red
abstract class NetworkService {
  String get baseUrl;
  Map<String, Object> get headers;

  Future<Either<AppException, AppResponse>> get(String endpoint,
      {Map<String, dynamic>? queryParameters});
  Future<Either<AppException, AppResponse>> post(String endpoint,
      {Map<String, dynamic>? data});
  Future<Either<AppException, AppResponse>> put(String endpoint,
      {Map<String, dynamic>? data});
  Future<Either<AppException, AppResponse>> delete(String endpoint,
      {Map<String, dynamic>? queryParameters});

  Map<String, dynamic>? updateHeader(Map<String, dynamic> data);
}

/// Servicio para comunicarse con Dialogflow CX.
/// 
/// Maneja la autenticación con una cuenta de servicio y permite enviar mensajes a un chatbot de Dialogflow.
/// 
/// 🔹 **Ejemplo de uso:**
/// ```dart
/// import 'package:dio/dio.dart';
/// import 'package:mosi2/core/network/dio_network_service.dart';
/// 
/// final networkService = DioNetworkService(Dio());
/// 
/// networkService.updateHeader({'Authorization': 'Bearer my-token'}); // 🔥 Agregar token global
/// 
/// final response = await networkService.get('/users');
/// ```