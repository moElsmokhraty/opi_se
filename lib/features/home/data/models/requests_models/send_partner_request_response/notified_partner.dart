import 'package:equatable/equatable.dart';

class NotifiedPartner extends Equatable {
  final String? notifiedPartner;

  const NotifiedPartner({this.notifiedPartner});

  factory NotifiedPartner.fromJson(Map<String, dynamic> json) =>
      NotifiedPartner(
        notifiedPartner: json['notifiedPartner'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'notifiedPartner': notifiedPartner,
      };

  @override
  List<Object?> get props => [notifiedPartner];
}
