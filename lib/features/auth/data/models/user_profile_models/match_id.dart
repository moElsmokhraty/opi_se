import 'package:equatable/equatable.dart';

class MatchId extends Equatable {
  final String? id;
  final int? progressPoints;
  final List<dynamic>? matchBadges;

  const MatchId({this.id, this.progressPoints, this.matchBadges});

  factory MatchId.fromJson(Map<String, dynamic> json) => MatchId(
        id: json['_id'] as String?,
        progressPoints: json['progressPoints'] as int?,
        matchBadges: json['matchBadges'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'progressPoints': progressPoints,
        'matchBadges': matchBadges,
      };

  @override
  List<Object?> get props => [id, progressPoints, matchBadges];
}
