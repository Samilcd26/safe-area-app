// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageModelImpl _$$MessageModelImplFromJson(Map<String, dynamic> json) =>
    _$MessageModelImpl(
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
      'message': instance.message,
      'from': instance.from,
      'to': instance.to,
      'sendDate': instance.sendDate.toIso8601String(),
      'seeDate': instance.seeDate.toIso8601String(),
      'isSend': instance.isSend,
      'isSee': instance.isSee,
    };
