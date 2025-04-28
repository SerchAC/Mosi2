import 'package:equatable/equatable.dart';
import 'package:mosi2/shared/domain/models/user/gender.dart';

/// 🔥 Modelo del usuario
class User extends Equatable {
  final String nickName;

  final String id;
  final String name;
  final String lastName;
  final String email;
  final Gender gender;

  const User(
      {this.id = '',
      this.name = '',
      this.lastName = '',
      this.nickName = '',
      this.email = '',
      this.gender = Gender.other,
   });

  @override
  List<Object?> get props =>
      [id, name, lastName, email, gender, nickName];

  /// 🔹 Convierte un JSON a `User`
  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'] ?? '',
        name: json['name'] ?? '',
        lastName: json['lastName'] ?? '',
        nickName: json['nickName'] ?? '',
        email: json['email'] ?? '',
        gender: GenderExtension.fromString(json['gender'] ?? 'other'),
      );

  /// 🔹 Convierte `User` a JSON
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "lastName": lastName,
        "nickName": nickName,
        "email": email,
        "gender": gender.toJson(),
      };

  /// 🔹 Permite copiar el usuario con datos nuevos sin modificar el original
  User copyWith(
      {String? id,
      String? name,
      String? lastName,
      String? email,
      String? nickName,
      Gender? gender,}) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      nickName: nickName ?? this.nickName,
      email: email ?? this.email,
      gender: gender ?? this.gender,
    );
  }

  @override
  String toString() => '''
___________________ User ______________________
ID: $id
Nombre: $name $lastName
NickName: $nickName
Email: $email
Género: ${gender.toJson()}
_______________________________________________
''';
}
