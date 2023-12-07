import 'package:equatable/equatable.dart';

class UserQuestion extends Equatable {
  final String? question;
  final String? answer;

  const UserQuestion({this.question, this.answer});

  factory UserQuestion.fromJson(Map<String, dynamic> json) => UserQuestion(
        question: json['question'] as String?,
        answer: json['answer'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'question': question,
        'answer': answer,
      };

  @override
  List<Object?> get props => [question, answer];
}
