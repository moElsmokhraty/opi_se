import 'package:equatable/equatable.dart';
import '../../../../auth/data/models/login_models/login_response/user_data.dart';

class GetPartnerRecommendationsResponse extends Equatable {
  final String? message;
  final int? totalNumOfItems;
  final int? totalPages;
  final int? currentPage;
  final List<UserData>? recommendations;

  const GetPartnerRecommendationsResponse({
    this.message,
    this.totalNumOfItems,
    this.totalPages,
    this.currentPage,
    this.recommendations,
  });

  Map<String, dynamic> toJson() => {
        'message': message,
        'totalNumOfItems': totalNumOfItems,
        'totalPages': totalPages,
        'currentPage': currentPage,
        'data': recommendations?.map((e) => e.toJson()).toList(),
      };

  factory GetPartnerRecommendationsResponse.fromJson(
          Map<String, dynamic> json) =>
      GetPartnerRecommendationsResponse(
        message: json['message'] as String?,
        totalNumOfItems: json['totalNumOfItems'] as int?,
        totalPages: json['totalPages'] as int?,
        currentPage: json['currentPage'] as int?,
        recommendations: (json['data'] as List<dynamic>?)
            ?.map((e) => UserData.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  @override
  List<Object?> get props {
    return [
      message,
      totalNumOfItems,
      totalPages,
      currentPage,
      recommendations,
    ];
  }
}
