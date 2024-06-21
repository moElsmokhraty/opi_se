import 'package:hive/hive.dart';
import '../../login_models/login_response/language.dart';
import '../../login_models/login_response/user_skill.dart';
import 'experience.dart';

part 'mentor_cache.g.dart';

@HiveType(typeId: 4)
class MentorCache extends HiveObject {
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
  bool? bio;
  @HiveField(10)
  String? fieldOfStudy;
  @HiveField(11)
  String? specialization;
  @HiveField(12)
  List<Skill>? skills;
  @HiveField(13)
  Experience? experience;
  @HiveField(14)
  int? points;
  @HiveField(15)
  String? role;

  MentorCache({
    this.id,
    this.userName,
    this.email,
    this.age,
    this.gender,
    this.location,
    this.nationalId,
    this.profileImage,
    this.fieldOfStudy,
    this.specialization,
    this.skills,
    this.experience,
    this.languages,
    this.bio,
    this.points,
    this.role,
  });
}
