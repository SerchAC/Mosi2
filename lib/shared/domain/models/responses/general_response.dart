/// 🔥 Modelo para respuestas generales de API
class GeneralResponse {
  final String message;
  final int status;

  GeneralResponse({
    required this.message,
    required this.status,
  });

  /// 🔹 Indica si la respuesta es exitosa (código 200-299)
  bool get success => status >= 200 && status < 300;

  /// 🔹 Convierte un JSON a `GeneralResponse`
  factory GeneralResponse.fromJson(Map<String, dynamic> json) =>
      GeneralResponse(
        message: json["message"] ?? "",
        status: json["status"] ?? 500,
      );

  /// 🔹 Convierte `GeneralResponse` a JSON
  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
      };

  @override
  String toString() =>
      '📩 GeneralResponse(status: $status, message: "$message")';
}
