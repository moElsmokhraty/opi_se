import 'package:equatable/equatable.dart';

class Message extends Equatable {
  final String? messageSender;
  final String? messageType;
  final String? messageContent;
  final String? mediaUrl;
  final String? id;
  final DateTime? sentAt;

  const Message({
    this.messageSender,
    this.messageType,
    this.messageContent,
    this.id,
    this.mediaUrl,
    this.sentAt,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        messageSender: json['messageSender'] as String?,
        messageType: json['messageType'] as String?,
        messageContent: json['messageContent'] as String?,
        mediaUrl: json['mediaUrl'] as String?,
        id: json['_id'] as String?,
        sentAt: json['sentAt'] == null
            ? null
            : DateTime.parse(json['sentAt'] as String).toLocal(),
      );

  Map<String, dynamic> toJson() => {
        'messageSender': messageSender,
        'messageType': messageType,
        'messageContent': messageContent,
        'mediaUrl': mediaUrl,
        '_id': id,
        'sentAt': sentAt?.toIso8601String(),
      };

  @override
  List<Object?> get props {
    return [
      messageSender,
      messageType,
      messageContent,
      mediaUrl,
      id,
      sentAt,
    ];
  }
}
