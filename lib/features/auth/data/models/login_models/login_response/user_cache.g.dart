// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_cache.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserCacheAdapter extends TypeAdapter<UserCache> {
  @override
  final int typeId = 0;

  @override
  UserCache read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserCache(
      id: fields[0] as String?,
      userName: fields[1] as String?,
      email: fields[2] as String?,
      age: fields[3] as int?,
      gender: fields[4] as String?,
      location: fields[5] as String?,
      nationalId: fields[6] as String?,
      profileImage: fields[7] as String?,
      getUserPrefers: fields[9] as bool?,
      fieldOfStudy: fields[10] as String?,
      specialization: fields[11] as String?,
      skills: (fields[12] as List?)?.cast<UserSkill>(),
      matchId: fields[13] as String?,
      partner: fields[14] as Partner?,
      languages: (fields[8] as List?)?.cast<Language>(),
      token: fields[15] as String?,
      fcmToken: fields[16] as String?,
      bio: fields[17] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserCache obj) {
    writer
      ..writeByte(18)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.userName)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.age)
      ..writeByte(4)
      ..write(obj.gender)
      ..writeByte(5)
      ..write(obj.location)
      ..writeByte(6)
      ..write(obj.nationalId)
      ..writeByte(7)
      ..write(obj.profileImage)
      ..writeByte(8)
      ..write(obj.languages)
      ..writeByte(9)
      ..write(obj.getUserPrefers)
      ..writeByte(10)
      ..write(obj.fieldOfStudy)
      ..writeByte(11)
      ..write(obj.specialization)
      ..writeByte(12)
      ..write(obj.skills)
      ..writeByte(13)
      ..write(obj.matchId)
      ..writeByte(14)
      ..write(obj.partner)
      ..writeByte(15)
      ..write(obj.token)
      ..writeByte(16)
      ..write(obj.fcmToken)
      ..writeByte(17)
      ..write(obj.bio);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserCacheAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
