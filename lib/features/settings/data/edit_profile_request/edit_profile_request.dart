import 'package:equatable/equatable.dart';
import '../../../auth/data/models/login_models/login_response/language.dart';

class EditProfileRequest extends Equatable {
  final String? userName;
  final String? email;
  final List<Language>? languages;

  const EditProfileRequest({this.userName, this.email, this.languages});

  factory EditProfileRequest.fromJson(Map<String, dynamic> json) {
    return EditProfileRequest(
      userName: json['userName'] as String?,
      email: json['email'] as String?,
      languages: (json['languages'] as List<dynamic>?)
          ?.map((e) => Language.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'userName': userName,
        'email': email,
        'languages': languages?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [userName, email, languages];
}
