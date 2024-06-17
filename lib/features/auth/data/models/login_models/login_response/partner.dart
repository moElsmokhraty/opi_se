import 'package:hive/hive.dart';

part 'partner.g.dart';

@HiveType(typeId: 1)
//ignore: must_be_immutable

class Partner extends HiveObject {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? userName;
  @HiveField(2)
  String? profileImage;

  Partner({this.id, this.userName, this.profileImage});

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
}
