const int perPageLimit = 20;

/// 🔥 Modelo genérico para respuestas paginadas
class PaginatedResponse<T> {
  final int total;
  final int skip;
  final List<T> data;

  static const int limit = perPageLimit;

  PaginatedResponse({
    required this.total,
    required this.skip,
    required this.data,
  });

  /// 🔹 Convierte un JSON en `PaginatedResponse<T>`
  factory PaginatedResponse.fromJson(
    Map<String, dynamic> json, {
    required List<T> Function(List<dynamic>) dataParser,
  }) {
    return PaginatedResponse<T>(
      total: json['total'] ?? 0,
      skip: json['skip'] ?? 0,
      data: dataParser(json['data'] ?? []),
    );
  }

  @override
  String toString() => '''
📄 PaginatedResponse:
🔹 Total: $total
🔹 Skip: $skip
🔹 Data size: ${data.length}
''';
}
