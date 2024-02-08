import 'package:hive/hive.dart';
import '../utils/constants.dart';
import 'package:opi_se/core/models/user_cache.dart';
import '../../features/auth/data/models/login_models/login_response/login_response.dart';

void cacheUserData(LoginResponse response) {
  var box = Hive.box<UserCache>(boxName);
  box.put(
    'user',
    UserCache(
      token: response.token,
      id: response.data?.id,
      email: response.data?.email,
      userName: response.data?.userName,
      nationalId: response.data?.nationalId,
      matchId: response.data?.matchId,
      fcmToken: fcmToken,
      age: response.data?.age,
      gender: response.data?.gender,
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
}
