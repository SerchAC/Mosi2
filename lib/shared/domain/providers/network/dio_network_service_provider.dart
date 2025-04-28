import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mosi2/core/network/dio_network_service.dart';

/// ✅ Proveedor de `DioNetworkService` con una única instancia global.
final dioProvider = Provider<Dio>((ref) {
  final Dio dio = Dio(BaseOptions(
    baseUrl: "https://api.yapsi.com",
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
    headers: {
      "accept": "application/json",
      "content-type": "application/json",
    },
  ));

  dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

  return dio;
});

/// ✅ Proveedor de `DioNetworkService`, inyectando el `Dio` centralizado.
final networkServiceProvider = Provider<DioNetworkService>((ref) {
  final dio = ref.watch(dioProvider);
  return DioNetworkService(dio);
});
