class AppException implements Exception {
  final String message;
  final int? statusCode;

  AppException({required this.message, this.statusCode});

  /// Crea una excepción a partir de un código de estado HTTP
  factory AppException.fromStatusCode(int? statusCode, dynamic data) {
    switch (statusCode) {
      case 400:
        return AppException(message: "Solicitud incorrecta", statusCode: 400);
      case 401:
        return AppException(message: "No autorizado", statusCode: 401);
      case 403:
        return AppException(message: "Prohibido", statusCode: 403);
      case 404:
        return AppException(message: "No encontrado", statusCode: 404);
      case 500:
        return AppException(message: "Error interno del servidor", statusCode: 500);
      default:
        return AppException(message: "Error desconocido", statusCode: statusCode);
    }
  }

  @override
  String toString() => "AppException($statusCode): $message";
}