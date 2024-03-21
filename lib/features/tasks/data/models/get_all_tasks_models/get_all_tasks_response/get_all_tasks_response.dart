import 'package:equatable/equatable.dart';
import '../../task.dart';

class GetAllTasksResponse extends Equatable {
  final bool? success;
  final int? statusCode;
  final String? message;
  final int? totalNumOfItems;
  final int? totalPages;
  final int? currentPage;
  final List<Task>? tasks;

  const GetAllTasksResponse({
    this.success,
    this.statusCode,
    this.message,
    this.totalNumOfItems,
    this.totalPages,
    this.currentPage,
    this.tasks,
  });

  factory GetAllTasksResponse.fromJson(Map<String, dynamic> json) {
    return GetAllTasksResponse(
      success: json['success'] as bool?,
      statusCode: json['statusCode'] as int?,
      message: json['message'] as String?,
      totalNumOfItems: json['totalNumOfItems'] as int?,
      totalPages: json['totalPages'] as int?,
      currentPage: json['currentPage'] as int?,
      tasks: (json['data'] as List<dynamic>?)
          ?.map((e) => Task.fromJson(e as Map<String, dynamic>))
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
        'data': tasks?.map((e) => e.toJson()).toList(),
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
      tasks,
    ];
  }
}
