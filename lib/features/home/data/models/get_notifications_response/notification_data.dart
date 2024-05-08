import 'package:equatable/equatable.dart';

import 'notification.dart';

class NotificationData extends Equatable {
  final String? id;
  final List<NotificationModel>? notifications;

  const NotificationData({this.id, this.notifications});

  factory NotificationData.fromJson(Map<String, dynamic> json) =>
      NotificationData(
        id: json['_id'] as String?,
        notifications: (json['notifications'] as List<dynamic>?)
            ?.map((e) => NotificationModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'notifications': notifications?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [id, notifications];
}
