// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:hive/hive.dart';
import 'package:videos_lists/Features/Videos_lists/domain/entites/topics/topics_entity.dart';

class TopicsEntityAdapter extends TypeAdapter<TopicsEntity> {
  @override
  final int typeId = 0;

  @override
  TopicsEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TopicsEntity(
      id: fields[1] as int,
      title: fields[2] as String,
      itemCount: fields[0] as int,
      mediaPath: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TopicsEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.itemCount)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.mediaPath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TopicsEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
