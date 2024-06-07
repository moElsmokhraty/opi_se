import 'dart:async';

import 'package:hive/hive.dart';
import 'package:opi_se/features/home/data/models/get_profile_response.dart';
import '../utils/constants.dart';
import '../../features/auth/data/models/login_models/login_response/user_cache.dart';
import '../../features/auth/data/models/login_models/login_response/login_response.dart';

Future<void> cacheUserData(LoginResponse response) async {
  var box = Hive.box<UserCache>(boxName);
  await box.put(
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

void updateUserCache(GetProfileResponse response) {
  var box = Hive.box<UserCache>(boxName);
  box.put(
    'user',
    UserCache(
      token: userCache!.token,
      id: response.data?.id,
      email: response.data?.email,
      userName: response.data?.userName,
      nationalId: response.data?.nationalId,
      matchId: response.data?.matchId,
      fcmToken: fcmToken,
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
