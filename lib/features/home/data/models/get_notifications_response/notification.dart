import 'package:equatable/equatable.dart';

class NotificationModel extends Equatable {
  final String? message;
  final DateTime? date;
  final String? id;

  const NotificationModel({this.message, this.date, this.id});

  factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
        message: json['message'] as String?,
        date: json['date'] == null
            ? null
            : DateTime.parse(json['date'] as String),
        id: json['_id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'date': date?.toIso8601String(),
        '_id': id,
      };

  @override
  List<Object?> get props => [message, date, id];
}
