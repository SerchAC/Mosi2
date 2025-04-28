/// 🔥 Enumeración para el género del usuario
enum Gender { male, female, other }

/// 🔹 Extensión para convertir `Gender` a JSON y desde String
extension GenderExtension on Gender {
  /// 🔹 Convierte un string a `Gender`
  static Gender fromString(String gender) {
    switch (gender.toLowerCase()) {
      case 'male':
        return Gender.male;
      case 'female':
        return Gender.female;
      default:
        return Gender.other;
    }
  }

  /// 🔹 Convierte `Gender` a JSON
  String toJson() => name;
}
