/// 🔥 Modelo para respuestas de API con estructura genérica
class ParseResponse<T> {
  final bool success;
  final String? status;
  final String? message;
  final T? data;

  ParseResponse({
    required this.success,
    this.status,
    this.message,
    this.data,
  });

  /// 🔹 Convierte un JSON en `ParseResponse<T>`
  factory ParseResponse.fromJson(
    Map<String, dynamic> json, {
    required T Function(dynamic) dataParser,
  }) {
    return ParseResponse<T>(
      success: json['status'] == 'success',
      status: json['status'],
      message: json['message'],
      data: dataParser(json['data']),
    );
  }

  @override
  String toString() => '''
📩 ParseResponse:
🔹 Success: $success
🔹 Status: $status
🔹 Message: $message
🔹 Data: ${data ?? "No data"}
''';
}
