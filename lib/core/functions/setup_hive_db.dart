import '../utils/constants.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:opi_se/core/models/user_cache.dart';
import '../../features/auth/data/models/login_models/login_response/partner.dart';
import '../../features/auth/data/models/login_models/login_response/language.dart';
import '../../features/auth/data/models/login_models/login_response/user_skill.dart';

Future<void> setupHiveDB() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserCacheAdapter());
  Hive.registerAdapter(LanguageAdapter());
  Hive.registerAdapter(PartnerAdapter());
  Hive.registerAdapter(UserSkillAdapter());
  await Hive.openBox<UserCache>(boxName);
  userCache = Hive.box<UserCache>(boxName).get('user');
}
