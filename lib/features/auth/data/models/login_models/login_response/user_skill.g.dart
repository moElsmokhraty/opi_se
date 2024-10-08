// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_skill.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SkillAdapter extends TypeAdapter<Skill> {
  @override
  final int typeId = 2;

  @override
  Skill read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Skill(
      skillName: fields[0] as String?,
      skillRate: fields[1] as int?,
      id: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Skill obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.skillName)
      ..writeByte(1)
      ..write(obj.skillRate)
      ..writeByte(2)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SkillAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
