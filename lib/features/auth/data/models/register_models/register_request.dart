import 'package:equatable/equatable.dart';
import 'language.dart';

class RegisterRequest extends Equatable {
  final String? userName;
  final String? email;
  final int? age;
  final String? gender;
  final String? location;
  final String? nationalId;
  final String? password;
  final String? confirmPassword;
  final List<Language>? languages;

  const RegisterRequest({
    this.userName,
    this.email,
    this.age,
    this.gender,
    this.location,
    this.nationalId,
    this.password,
    this.confirmPassword,
    this.languages,
  });

  factory RegisterRequest.fromJson(Map<String, dynamic> json) {
    return RegisterRequest(
      userName: json['userName'] as String?,
      email: json['email'] as String?,
      age: json['age'] as int?,
      gender: json['gender'] as String?,
      location: json['location'] as String?,
      nationalId: json['nationalId'] as String?,
      password: json['password'] as String?,
      confirmPassword: json['confirmPassword'] as String?,
      languages: (json['languages'] as List<dynamic>?)
          ?.map((e) => Language.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'userName': userName,
        'email': email,
        'age': age,
        'gender': gender,
        'location': location,
        'nationalId': nationalId,
        'password': password,
        'confirmPassword': confirmPassword,
        'languages': languages?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props {
    return [
      userName,
      email,
      age,
      gender,
      location,
      nationalId,
      password,
      confirmPassword,
      languages,
    ];
  }
}
