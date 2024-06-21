// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mentor_cache.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MentorCacheAdapter extends TypeAdapter<MentorCache> {
  @override
  final int typeId = 4;

  @override
  MentorCache read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MentorCache(
      id: fields[0] as String?,
      userName: fields[1] as String?,
      email: fields[2] as String?,
      age: fields[3] as int?,
      gender: fields[4] as String?,
      location: fields[5] as String?,
      nationalId: fields[6] as String?,
      profileImage: fields[7] as String?,
      fieldOfStudy: fields[10] as String?,
      specialization: fields[11] as String?,
      skills: (fields[12] as List?)?.cast<Skill>(),
      experience: fields[13] as Experience?,
      languages: (fields[8] as List?)?.cast<Language>(),
      bio: fields[9] as bool?,
      points: fields[14] as int?,
      role: fields[15] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, MentorCache obj) {
    writer
      ..writeByte(16)
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
      ..write(obj.bio)
      ..writeByte(10)
      ..write(obj.fieldOfStudy)
      ..writeByte(11)
      ..write(obj.specialization)
      ..writeByte(12)
      ..write(obj.skills)
      ..writeByte(13)
      ..write(obj.experience)
      ..writeByte(14)
      ..write(obj.points)
      ..writeByte(15)
      ..write(obj.role);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MentorCacheAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
