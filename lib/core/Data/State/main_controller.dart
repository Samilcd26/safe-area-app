import 'dart:developer';

import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:get/get.dart';
import 'package:safe_area/core/Business/IConnectService.dart';
import 'package:safe_area/core/Business/Impl/ConnectService.dart';

import 'package:safe_area/core/Data/Database/model/session_hive_operation.dart';
import 'package:safe_area/core/Data/Models/message_model.dart';
import 'package:safe_area/core/Data/Models/session_model.dart';
import 'package:safe_area/core/Data/Models/user_model.dart';

class MainController extends GetxController {
  final IConnectService _service = ConnectService();
  List<UserModel>? contactList;
  final SessionHiveOperation _operation = SessionHiveOperation();
  var count = 0.obs;
  List<MessageModel> messageList = [];
  SessionModel? currentSession;
  List<SessionModel> allSessionList = <SessionModel>[].obs;
  UserModel currentUser = Rx(UserModel(id: 1, userName: "Ahmet T", phone: 5530146669, publisher: true, questList: [66666]))();

  Stream<MessageModel> getStreamData() => _service.getStreamMessage.getResponse();

  Future<void> initialize() async {
    await getSessionData();
  }

  void changeCurrentUser(String userName, int phone) {
    currentUser.copyWith(userName: userName);
    currentUser.copyWith(phone: phone);
  }

  //? roomId,from,to
  void createRoom(UserModel toUser) {
    //_service.createRoom(countryCode ?? "nll", currentUser.userName,);
  }
  Future<List<SessionModel>> getSessionData() async {
    await _operation.start();
    allSessionList = _operation.getAllValues();

    return allSessionList;
  }

  //? roomId,from,to
  void getCurrentSessionData(String sessionId) {
    currentSession = _operation.getItem(sessionId);
  }

  void sendMessage(UserModel toUser, MessageModel message) async {
    //? From->To->Message
    SessionModel? tes;
    if (currentSession == null) {
      tes = SessionModel(toUser: toUser, messageList: [message]);
    } else {
      tes = currentSession!.copyWith(messageList: [...currentSession!.messageList, message]);
    }
    _operation.getAllValues();
    _operation.addOrUpdateItem(toUser.phone.toString(), tes);
    _service.sendMessage(message);
  }

  void messageListener() {
    _service.messageListener();
  }

  void disposeSession() {
    currentSession?.messageList.clear();
    _operation.addOrUpdateItem(currentSession!.toUser.phone.toString(), currentSession!);
    currentSession = null;
    //TODO remove connection
  }

  void disposeListener() {
    _service.disposeListener();
  }
}
