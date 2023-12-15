import 'package:equatable/equatable.dart';
import 'message.dart';

class GetChatResponse extends Equatable {
  final int? statusCode;
  final bool? success;
  final String? message;
  final int? totalNumOfItems;
  final int? totalPages;
  final String? currentPage;
  final List<Message>? messages;

  const GetChatResponse({
    this.statusCode,
    this.success,
    this.message,
    this.totalNumOfItems,
    this.totalPages,
    this.currentPage,
    this.messages,
  });

  factory GetChatResponse.fromJson(Map<String, dynamic> json) {
    return GetChatResponse(
      statusCode: json['statusCode'] as int?,
      success: json['success'] as bool?,
      message: json['message'] as String?,
      totalNumOfItems: json['totalNumOfItems'] as int?,
      totalPages: json['totalPages'] as int?,
      currentPage: json['currentPage'] as String?,
      messages: (json['data'] as List<dynamic>?)
          ?.map((e) => Message.fromJson(e as Map<String, dynamic>))
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
        'data': messages?.map((e) => e.toJson()).toList(),
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
      messages,
    ];
  }
}
