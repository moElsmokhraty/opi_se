import 'package:equatable/equatable.dart';

import 'note.dart';

class GetNotesResponse extends Equatable {
  final bool? success;
  final int? statusCode;
  final String? message;
  final int? totalNumOfItems;
  final int? totalPages;
  final String? currentPage;
  final List<Note>? notes;

  const GetNotesResponse({
    this.success,
    this.statusCode,
    this.message,
    this.totalNumOfItems,
    this.totalPages,
    this.currentPage,
    this.notes,
  });

  factory GetNotesResponse.fromJson(Map<String, dynamic> json) {
    return GetNotesResponse(
      success: json['success'] as bool?,
      statusCode: json['statusCode'] as int?,
      message: json['message'] as String?,
      totalNumOfItems: json['totalNumOfItems'] as int?,
      totalPages: json['totalPages'] as int?,
      currentPage: json['currentPage'] as String?,
      notes: (json['data'] as List<dynamic>?)
          ?.map((e) => Note.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'statusCode': statusCode,
        'message': message,
        'totalNumOfItems': totalNumOfItems,
        'totalPages': totalPages,
        'currentPage': currentPage,
        'data': notes?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props {
    return [
      success,
      statusCode,
      message,
      totalNumOfItems,
      totalPages,
      currentPage,
      notes,
    ];
  }
}
