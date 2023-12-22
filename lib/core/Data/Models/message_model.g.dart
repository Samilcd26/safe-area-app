// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MessageModelImplAdapter extends TypeAdapter<_$MessageModelImpl> {
  @override
  final int typeId = 0;

  @override
  _$MessageModelImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$MessageModelImpl(
      id: fields[0] as int,
      message: fields[1] as String,
      from: fields[2] as int,
      to: fields[3] as int,
      sendDate: fields[4] as DateTime,
      seeDate: fields[5] as DateTime,
      isSend: fields[6] as bool,
      isSee: fields[7] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, _$MessageModelImpl obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.message)
      ..writeByte(2)
      ..write(obj.from)
      ..writeByte(3)
      ..write(obj.to)
      ..writeByte(4)
      ..write(obj.sendDate)
      ..writeByte(5)
      ..write(obj.seeDate)
      ..writeByte(6)
      ..write(obj.isSend)
      ..writeByte(7)
      ..write(obj.isSee);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MessageModelImplAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageModelImpl _$$MessageModelImplFromJson(Map<String, dynamic> json) =>
    _$MessageModelImpl(
      id: json['id'] as int,
      message: json['message'] as String,
      from: json['from'] as int,
      to: json['to'] as int,
      sendDate: DateTime.parse(json['sendDate'] as String),
      seeDate: DateTime.parse(json['seeDate'] as String),
      isSend: json['isSend'] as bool,
      isSee: json['isSee'] as bool,
    );

Map<String, dynamic> _$$MessageModelImplToJson(_$MessageModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'message': instance.message,
      'from': instance.from,
      'to': instance.to,
      'sendDate': instance.sendDate.toIso8601String(),
      'seeDate': instance.seeDate.toIso8601String(),
      'isSend': instance.isSend,
      'isSee': instance.isSee,
    };
