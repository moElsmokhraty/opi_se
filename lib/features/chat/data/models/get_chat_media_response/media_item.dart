import 'package:equatable/equatable.dart';

class MediaItem extends Equatable {
  final String? messageSender;
  final String? mediaUrl;
  final String? id;
  final DateTime? sentAt;

  const MediaItem({this.messageSender, this.mediaUrl, this.id, this.sentAt});

  factory MediaItem.fromJson(Map<String, dynamic> json) => MediaItem(
        messageSender: json['messageSender'] as String?,
        mediaUrl: json['mediaUrl'] as String?,
        id: json['_id'] as String?,
        sentAt: json['sentAt'] == null
            ? null
            : DateTime.parse(json['sentAt'] as String),
      );

  Map<String, dynamic> toJson() => {
        'messageSender': messageSender,
        'mediaUrl': mediaUrl,
        '_id': id,
        'sentAt': sentAt?.toIso8601String(),
      };

  @override
  List<Object?> get props => [messageSender, mediaUrl, id, sentAt];
}
