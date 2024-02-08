// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_skill.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserSkillAdapter extends TypeAdapter<UserSkill> {
  @override
  final int typeId = 2;

  @override
  UserSkill read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return const UserSkill();
  }

  @override
  void write(BinaryWriter writer, UserSkill obj) {
    writer.writeByte(0);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserSkillAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
