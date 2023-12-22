// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SessionModelImplAdapter extends TypeAdapter<_$SessionModelImpl> {
  @override
  final int typeId = 1;

  @override
  _$SessionModelImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$SessionModelImpl(
      toUser: fields[0] as UserModel,
      messageList: (fields[1] as List).cast<MessageModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, _$SessionModelImpl obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.toUser)
      ..writeByte(1)
      ..write(obj.messageList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SessionModelImplAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SessionModelImpl _$$SessionModelImplFromJson(Map<String, dynamic> json) =>
    _$SessionModelImpl(
      toUser: UserModel.fromJson(json['toUser'] as Map<String, dynamic>),
      messageList: (json['messageList'] as List<dynamic>)
          .map((e) => MessageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SessionModelImplToJson(_$SessionModelImpl instance) =>
    <String, dynamic>{
      'toUser': instance.toUser,
      'messageList': instance.messageList,
    };
