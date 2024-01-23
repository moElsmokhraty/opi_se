import 'package:equatable/equatable.dart';

import 'match_requests_data.dart';

class GetMatchRequestsResponse extends Equatable {
  final String? message;
  final MatchRequestsData? data;

  const GetMatchRequestsResponse({this.message, this.data});

  factory GetMatchRequestsResponse.fromJson(Map<String, dynamic> json) {
    return GetMatchRequestsResponse(
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : MatchRequestsData.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'data': data?.toJson(),
      };

  @override
  List<Object?> get props => [message, data];
}
