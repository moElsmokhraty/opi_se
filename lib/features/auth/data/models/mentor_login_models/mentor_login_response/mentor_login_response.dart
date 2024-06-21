import 'package:equatable/equatable.dart';

import 'mentor_data.dart';

class MentorLoginResponse extends Equatable {
  final String? message;
  final String? token;
  final MentorData? data;

  const MentorLoginResponse({this.message, this.token, this.data});

  factory MentorLoginResponse.fromJson(Map<String, dynamic> json) {
    return MentorLoginResponse(
      message: json['message'] as String?,
      token: json['token'] as String?,
      data: json['data'] == null
          ? null
          : MentorData.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'token': token,
        'data': data?.toJson(),
      };

  @override
  List<Object?> get props => [message, token, data];
}
