import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:safe_area/core/Data/Database/core/hive_types.dart';
import 'package:safe_area/core/Data/Database/model/hive_model.dart';
import 'package:safe_area/core/Data/Models/message_model.dart';
import 'package:safe_area/core/Data/Models/user_model.dart';

part 'session_model.freezed.dart';
part 'session_model.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class SessionModel extends HiveObject with HiveModelMixin, _$SessionModel {
  SessionModel._();

  @override
  // ignore: recursive_getters
  String get key => toUser.phone.toString();

  @HiveType(typeId: HiveTypes.sessionModelId)
  factory SessionModel({
    @HiveField(0) required UserModel toUser,
    @HiveField(1) required List<MessageModel> messageList,
  }) = _SessionModel;
  factory SessionModel.fromJson(Map<String, Object?> json) => _$SessionModelFromJson(json);
}
