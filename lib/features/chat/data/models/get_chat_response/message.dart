import 'package:equatable/equatable.dart';

import 'poll_answer.dart';

class Message extends Equatable {
  final String? messageSender;
  final String? messageType;
  final String? messageContent;
  final String? mediaUrl;
  final String? pollQuestion;
  final List<PollAnswer>? pollAnswers;
  final String? id;
  final DateTime? sentAt;

  const Message({
    this.messageSender,
    this.messageType,
    this.messageContent,
    this.id,
    this.mediaUrl,
    this.sentAt,
    this.pollQuestion,
    this.pollAnswers,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        messageSender: json['messageSender'] as String?,
        messageType: json['messageType'] as String?,
        messageContent: json['messageContent'] as String?,
        mediaUrl: json['mediaUrl'] as String?,
        id: json['_id'] as String?,
        pollQuestion: json['pollQuestion'] as String?,
        sentAt: json['sentAt'] == null
            ? null
            : DateTime.parse(json['sentAt'] as String).toLocal(),
        pollAnswers: json['pollAnswers'] == null
            ? null
            : List<PollAnswer>.from(
                json['pollAnswers'].map((x) => PollAnswer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'messageSender': messageSender,
        'messageType': messageType,
        'messageContent': messageContent,
        'mediaUrl': mediaUrl,
        '_id': id,
        'sentAt': sentAt?.toIso8601String(),
        'pollQuestion': pollQuestion,
        'pollAnswers': pollAnswers?.map((x) => x.toJson()).toList(),
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
      pollQuestion,
      pollAnswers,
    ];
  }
}
