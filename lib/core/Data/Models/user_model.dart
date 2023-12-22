import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:safe_area/core/Data/Database/core/hive_types.dart';
import 'package:safe_area/core/Data/Database/model/hive_model.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel extends HiveObject with _$UserModel {
  UserModel._();

  @HiveType(typeId: HiveTypes.userModelId)
  factory UserModel({
    @HiveField(0) required int id,
    @HiveField(1) required String userName,
    @HiveField(2) required int phone,
    @HiveField(3) required bool verified,
  }) = _UserModel;

  factory UserModel.fromContact(Contact contact) {
    final int phone = int.parse(contact.phones.first.number.replaceAll(' ', '').substring(1));

    return UserModel(id: phone, userName: contact.displayName, phone: phone, verified: false);
  }

  factory UserModel.fromJson(Map<String, Object?> json) => _$UserModelFromJson(json);
}
