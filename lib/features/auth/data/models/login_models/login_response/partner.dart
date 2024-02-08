import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'partner.g.dart';

@HiveType(typeId: 1)
class Partner extends Equatable {
  final String? id;
  final String? userName;
  final String? profileImage;

  const Partner({this.id, this.userName, this.profileImage});

  factory Partner.fromJson(Map<String, dynamic> json) => Partner(
        id: json['_id'] as String?,
        userName: json['userName'] as String?,
        profileImage: json['profileImage'] as String?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'userName': userName,
        'profileImage': profileImage,
      };

  @override
  List<Object?> get props => [id, userName, profileImage];
}
