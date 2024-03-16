import 'package:equatable/equatable.dart';

import 'media_item.dart';

class GetChatMediaResponse extends Equatable {
  final int? statusCode;
  final bool? success;
  final String? message;
  final int? totalNumOfItems;
  final int? totalPages;
  final String? currentPage;
  final List<MediaItem>? media;

  const GetChatMediaResponse({
    this.statusCode,
    this.success,
    this.message,
    this.totalNumOfItems,
    this.totalPages,
    this.currentPage,
    this.media,
  });

  factory GetChatMediaResponse.fromJson(Map<String, dynamic> json) {
    return GetChatMediaResponse(
      statusCode: json['statusCode'] as int?,
      success: json['success'] as bool?,
      message: json['message'] as String?,
      totalNumOfItems: json['totalNumOfItems'] as int?,
      totalPages: json['totalPages'] as int?,
      currentPage: json['currentPage'] as String?,
      media: (json['data'] as List<dynamic>?)
          ?.map((e) => MediaItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'statusCode': statusCode,
        'success': success,
        'message': message,
        'totalNumOfItems': totalNumOfItems,
        'totalPages': totalPages,
        'currentPage': currentPage,
        'data': media?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props {
    return [
      statusCode,
      success,
      message,
      totalNumOfItems,
      totalPages,
      currentPage,
      media,
    ];
  }
}
