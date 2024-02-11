import 'package:hive/hive.dart';
import 'language.dart';
import 'partner.dart';
import 'user_skill.dart';

part 'user_cache.g.dart';

@HiveType(typeId: 0)
class UserCache extends HiveObject {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? userName;
  @HiveField(2)
  String? email;
  @HiveField(3)
  int? age;
  @HiveField(4)
  String? gender;
  @HiveField(5)
  String? location;
  @HiveField(6)
  String? nationalId;
  @HiveField(7)
  String? profileImage;
  @HiveField(8)
  List<Language>? languages;
  @HiveField(9)
  bool? getUserPrefers;
  @HiveField(10)
  String? fieldOfStudy;
  @HiveField(11)
  String? specialization;
  @HiveField(12)
  List<UserSkill>? skills;
  @HiveField(13)
  String? matchId;
  @HiveField(14)
  Partner? partner;
  @HiveField(15)
  String? token;
  @HiveField(16)
  String? fcmToken;

  UserCache({
    this.id,
    this.userName,
    this.email,
    this.age,
    this.gender,
    this.location,
    this.nationalId,
    this.profileImage,
    this.getUserPrefers,
    this.fieldOfStudy,
    this.specialization,
    this.skills,
    this.matchId,
    this.partner,
    this.languages,
    this.token,
    this.fcmToken,
  });
}
