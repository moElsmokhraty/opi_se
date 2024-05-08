import 'package:hive/hive.dart';
import '../utils/constants.dart';
import '../../features/auth/data/models/login_models/login_response/user_skill.dart';
import '../../features/auth/data/models/login_models/login_response/user_cache.dart';

Future<void> modifyUserPrefersCache({
  required List<UserSkill> skills,
  required String fieldOfStudy,
  required String specialization,
}) async {
  userCache?.getUserPrefers = false;
  userCache?.skills = skills;
  userCache?.fieldOfStudy = fieldOfStudy;
  userCache?.specialization = specialization;
  await Hive.box<UserCache>(boxName).put('user', userCache!).then((value) {
    userCache = Hive.box<UserCache>(boxName).get('user');
  });
}
