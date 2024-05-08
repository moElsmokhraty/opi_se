import 'package:equatable/equatable.dart';

class PollAnswer extends Equatable {
  final int? optionNumber;
  final String? optionContent;
  final int? optionVotes;
  final List<String>? optionSelectors;
  final String? id;

  const PollAnswer({
    this.optionNumber,
    this.optionContent,
    this.optionVotes,
    this.optionSelectors,
    this.id,
  });

  factory PollAnswer.fromJson(Map<String, dynamic> json) => PollAnswer(
        optionNumber: json['optionNumber'] as int?,
        optionContent: json['optionContent'] as String?,
        optionVotes: json['optionVotes'] as int?,
        optionSelectors: json['optionSelectors'] == null
            ? null
            : List<String>.from(
                json['optionSelectors'].map((x) => x as String)),
        id: json['_id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'optionNumber': optionNumber,
        'optionContent': optionContent,
        'optionVotes': optionVotes,
        'optionSelectors': optionSelectors,
        '_id': id,
      };

  @override
  List<Object?> get props {
    return [
      optionNumber,
      optionContent,
      optionVotes,
      optionSelectors,
      id,
    ];
  }
}
