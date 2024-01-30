import 'package:equatable/equatable.dart';

import '../../../auth/data/models/login_models/login_response/user_data.dart';

class GetProfileResponse extends Equatable {
  final String? message;
  final UserData? data;

  const GetProfileResponse({this.message, this.data});

  factory GetProfileResponse.fromJson(Map<String, dynamic> json) {
    return GetProfileResponse(
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : UserData.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'data': data?.toJson(),
      };

  @override
  List<Object?> get props => [message, data];
}
