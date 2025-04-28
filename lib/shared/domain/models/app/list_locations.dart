import 'package:mosi2/shared/domain/models/app/locations.dart';

/// 🔥 Modelo para Listas de Ubicaciones
class ListLocations {
  final List<Location> locations;

  ListLocations({required this.locations});

  /// 🔹 Convierte un JSON a `ListLocations`
  factory ListLocations.fromJson(Map<String, dynamic> json) {
    return ListLocations(
      locations: (json["data"] as List<dynamic>)
          .map((x) => Location.fromJson(x))
          .toList(),
    );
  }

  /// 🔹 Convierte `ListLocations` a JSON
  Map<String, dynamic> toJson() => {
        "data": locations.map((x) => x.toJson()).toList(),
      };
}
