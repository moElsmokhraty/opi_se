import 'package:equatable/equatable.dart';
import 'package:opi_se/features/auth/data/models/login_models/login_response/profile_details.dart';

import '../../../auth/data/models/login_models/login_response/user_data.dart';

class GetProfileResponse extends Equatable {
  final String? message;
  final UserData? data;
  final ProfileDetails? profileDetails;

  const GetProfileResponse({this.message, this.data, this.profileDetails});

  factory GetProfileResponse.fromJson(Map<String, dynamic> json) {
    return GetProfileResponse(
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : UserData.fromJson(json['data'] as Map<String, dynamic>),
      profileDetails: json['profileDetails'] == null
          ? null
          : ProfileDetails.fromJson(
              json['profileDetails'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'data': data?.toJson(),
        'profileDetails': profileDetails?.toJson(),
      };

  @override
  List<Object?> get props => [message, data, profileDetails];
}
