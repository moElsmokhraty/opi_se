import '../utils/constants.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../features/auth/data/models/login_models/login_response/partner.dart';
import '../../features/auth/data/models/login_models/login_response/language.dart';
import '../../features/auth/data/models/login_models/login_response/user_cache.dart';
import '../../features/auth/data/models/login_models/login_response/user_skill.dart';
import '../../features/auth/data/models/login_models/login_response/login_response.dart';
import 'package:opi_se/features/auth/data/models/user_profile_models/get_user_profile_response.dart';

class HiveHelper {
  static Future<void> setupHiveDB() async {
    await Hive.initFlutter();
    Hive.registerAdapter(UserCacheAdapter());
    Hive.registerAdapter(LanguageAdapter());
    Hive.registerAdapter(PartnerAdapter());
    Hive.registerAdapter(SkillAdapter());
    await Hive.openBox<UserCache>(boxName);
    userCache = getUserCache();
  }

  static Future<void> cacheUserData(LoginResponse response) async {
    var box = Hive.box<UserCache>(boxName);
    await box.put(
      'user',
      UserCache(
        id: response.data?.id,
        email: response.data?.email,
        userName: response.data?.userName,
        nationalId: response.data?.nationalId,
        matchId: response.data?.matchId,
        age: response.data?.age,
        gender: response.data?.gender,
        bio: response.data?.bio,
        profileImage: response.data?.profileImage,
        location: response.data?.location,
        partner: response.data?.partner,
        languages: response.data?.languages,
        getUserPrefers: response.data?.getUserPrefers,
        fieldOfStudy: response.profileDetails?.fieldOfStudy,
        specialization: response.profileDetails?.specialization,
        skills: response.profileDetails?.userSkills,
      ),
    );
    userCache = box.get('user');
  }

  static Future<void> refreshUserCache(GetUserProfileResponse response) async {
    var box = Hive.box<UserCache>(boxName);
    await box.put(
      'user',
      UserCache(
        id: response.data?.id,
        email: response.data?.email,
        userName: response.data?.userName,
        nationalId: response.data?.nationalId,
        matchId: response.data?.matchId?.id,
        age: response.data?.age,
        gender: response.data?.gender,
        bio: response.data?.bio,
        profileImage: response.data?.profileImage,
        location: response.data?.location,
        partner: response.data?.partner,
        languages: response.data?.languages,
        getUserPrefers: response.data?.getUserPrefers,
        fieldOfStudy: response.data?.profileDetails?.fieldOfStudy,
        specialization: response.data?.profileDetails?.specialization,
        skills: response.data?.profileDetails?.userSkills,
      ),
    );
    userCache = box.get('user');
  }

  static UserCache? getUserCache() {
    return Hive.box<UserCache>(boxName).get('user');
  }

  static Future<void> updateUserCache(UserCache? userCache) async {
    await Hive.box<UserCache>(boxName).put('user', userCache!).then((value) {
      userCache = HiveHelper.getUserCache();
    });
  }

  static Future<void> modifyUserPrefersCache({
    required List<Skill> skills,
    required String fieldOfStudy,
    required String specialization,
  }) async {
    userCache?.getUserPrefers = false;
    userCache?.skills = skills;
    userCache?.fieldOfStudy = fieldOfStudy;
    userCache?.specialization = specialization;
    await updateUserCache(userCache);
  }
}
