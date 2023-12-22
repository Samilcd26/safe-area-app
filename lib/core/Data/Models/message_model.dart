import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:safe_area/core/Data/Database/core/hive_types.dart';
import 'package:safe_area/core/Data/Database/model/hive_model.dart';

part 'message_model.freezed.dart';
part 'message_model.g.dart';

@freezed
abstract class MessageModel extends HiveObject with HiveModelMixin, _$MessageModel {
  MessageModel._();

  @override
  String get key => id.toString();

  @HiveType(typeId: HiveTypes.messageModelId)
  factory MessageModel({
    @HiveField(0) required int id,
    @HiveField(1) required String message,
    @HiveField(2) required int from,
    @HiveField(3) required int to,
    @HiveField(4) required DateTime sendDate,
    @HiveField(5) required DateTime seeDate,
    @HiveField(6) required bool isSend,
    @HiveField(7) required bool isSee,
  }) = _MessageModel;

  factory MessageModel.fromJson(Map<String, Object?> json) => _$MessageModelFromJson(json);
}
