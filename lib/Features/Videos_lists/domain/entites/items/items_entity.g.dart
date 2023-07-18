// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'items_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ItemsEntityAdapter extends TypeAdapter<ItemsEntity> {
  @override
  final int typeId = 1;

  @override
  ItemsEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ItemsEntity(
      id: fields[1] as int,
      title: fields[2] as String,
      videoUrl: fields[0] as String,
      mediaPath: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ItemsEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.videoUrl)
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
      other is ItemsEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
