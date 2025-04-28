/// 🔥 Modelo para Notificaciones Push
class PushMessage {
  final String messageId;
  final String title;
  final String body;
  final DateTime sentDate;
  final Map<String, dynamic>? data;
  final String? imageUrl;

  PushMessage({
    required this.messageId,
    required this.title,
    required this.body,
    required this.sentDate,
    this.data,
    this.imageUrl,
  });

  /// 🔹 Convierte un JSON a `PushMessage`
  factory PushMessage.fromJson(Map<String, dynamic> json) => PushMessage(
        messageId: json["messageId"],
        title: json["title"],
        body: json["body"],
        sentDate: DateTime.parse(json["sentDate"]),
        data: json["data"] != null
            ? Map<String, dynamic>.from(json["data"])
            : null,
        imageUrl: json["imageUrl"],
      );

  /// 🔹 Convierte `PushMessage` a JSON
  Map<String, dynamic> toJson() => {
        "messageId": messageId,
        "title": title,
        "body": body,
        "sentDate": sentDate.toIso8601String(),
        "data": data,
        "imageUrl": imageUrl,
      };

  @override
  String toString() => '''
📩 Notificación Push
🔹 ID: $messageId
🔹 Título: $title
🔹 Mensaje: $body
🔹 Fecha: $sentDate
🔹 Datos: ${data ?? "Sin datos"}
🔹 Imagen: ${imageUrl ?? "Sin imagen"}
''';
}
