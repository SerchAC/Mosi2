/// 🔥 Modelo para Ubicaciones
class Location {
  final String cp;
  final String name;
  final String city;
  final String state;

  Location({
    required this.cp,
    required this.name,
    required this.city,
    required this.state,
  });

  /// 🔹 Convierte un JSON a un objeto `Location`
  factory Location.fromJson(Map<String, dynamic> json) => Location(
        cp: json["cp"],
        name: json["name"],
        city: json["city"],
        state: json["state"],
      );

  /// 🔹 Convierte un objeto `Location` a JSON
  Map<String, dynamic> toJson() => {
        "cp": cp,
        "name": name,
        "city": city,
        "state": state,
      };
}
