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
    @HiveField(3) required List<int> questList,
    @HiveField(4) required bool publisher,
  }) = _UserModel;

  factory UserModel.fromContact(Contact contact) {
    //TODO:
    final int phone = int.parse(contact.phones.first.number.replaceAll(' ', '').replaceAll('-', '').replaceAll('+', '').substring(1));

    return UserModel(id: phone, userName: contact.displayName, phone: phone, publisher: false, questList: []);
  }

  factory UserModel.fromJson(Map<String, Object?> json) => _$UserModelFromJson(json);

  bool contains(int id) {
    return questList.contains(id);
  }
}
