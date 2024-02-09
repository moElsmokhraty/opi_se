import 'package:hive/hive.dart';
import '../utils/constants.dart';
import '../../features/auth/data/models/login_models/login_response/user_cache.dart';
import '../../features/auth/presentation/cubits/user_prefers_cubit/user_prefers_cubit.dart';

void modifyUserPrefersCache(UserPrefersCubit cubit) {
  userCache?.getUserPrefers = false;
  userCache?.skills = cubit.skills;
  userCache?.fieldOfStudy = cubit.fieldOfStudyController.text.trim();
  userCache?.specialization = cubit.specializationController.text.trim();
  Hive.box<UserCache>(boxName).put('user', userCache!);
}
