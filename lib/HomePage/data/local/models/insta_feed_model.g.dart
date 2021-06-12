// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insta_feed_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class InstaFeedModelLocalAdapter extends TypeAdapter<InstaFeedModelLocal> {
  @override
  final int typeId = 1;

  @override
  InstaFeedModelLocal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return InstaFeedModelLocal(
      id: fields[0] as String,
      channelname: fields[1] as String,
      title: fields[2] as String,
      highThumbnail: fields[3] as String,
      lowThumbnail: fields[4] as String,
      mediumThumbnail: fields[5] as String,
      tags: (fields[6] as List).cast<dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, InstaFeedModelLocal obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.channelname)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.highThumbnail)
      ..writeByte(4)
      ..write(obj.lowThumbnail)
      ..writeByte(5)
      ..write(obj.mediumThumbnail)
      ..writeByte(6)
      ..write(obj.tags);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InstaFeedModelLocalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
