// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:safe_area/core/Data/Database/model/session_hive_operation.dart';
import 'package:safe_area/core/Data/Models/message_model.dart';
import 'package:safe_area/core/Data/Models/user_model.dart';
import 'package:safe_area/core/Data/State/main_controller.dart';
import 'package:safe_area/ui/Screens/01.home/home.page/view.dart';

mixin SessionPageMixin<T extends StatelessWidget> {
  final SessionHiveOperation _databaseOperation = SessionHiveOperation();
  MainController controller = Get.put(MainController());
  FocusNode focusNode = FocusNode();
  double toolPageHeigh = 0;
  KEYBOARD_TYPE keyboardType = KEYBOARD_TYPE.EMPTY;
  bool inText = false;
  // bool showEmojiPicker = false;
  // bool showMoreTool = false;
  bool isFirstMessage = false;
  List<MessageModel> messages = [];
  bool toolPage = true;

  final ScrollController scrollController = ScrollController();
  final TextEditingController messageInputController = TextEditingController();

  final ValueNotifier<KEYBOARD_TYPE> keyboardNotifier = ValueNotifier<KEYBOARD_TYPE>(KEYBOARD_TYPE.EMPTY);
  final ValueNotifier<bool> textInputActiveNotifier = ValueNotifier<bool>(false);
  //!controller.currentUser ↓↓↓

  void SessionPageInit(String toUserPhone) {
    controller.getCurrentSessionData(toUserPhone);
    if (controller.currentSession != null) {
      messages = controller.currentSession!.messageList;
    }
  }

  List<MessageModel>? getMessageList(String key) {
    return _databaseOperation.getItem(key)?.messageList;
  }

  void sendMessage(UserModel fromUser, UserModel toUser, String message) {
    goToPageEnd();
    MessageModel msg = MessageModel(
        id: 5,
        message: message,
        to: toUser.phone,
        from: fromUser.phone,
        sendDate: DateTime.now(),
        seeDate: DateTime.now(),
        isSend: true,
        isSee: false);

    controller.sendMessage(toUser, msg);
  }

  Future<dynamic> SessionDisposeDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text('Are you sure dispose to session'),
            content: Text('Your seesion data will remove to you and client'),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    controller.disposeSession();
                    Get.to(HomePage());
                  },
                  child: Text('Yes')),
              TextButton(
                onPressed: () {
                  Navigator.pop(context); //close Dialog
                },
                child: Text('Close'),
              )
            ],
          );
        });
  }

  void goToPageEnd() {
    scrollController.animateTo(scrollController.position.maxScrollExtent, duration: Duration(microseconds: 300), curve: Curves.easeOut);
  }

  void chanceTextInputStatus(String text) {
    if (text == "") {
      textInputActiveNotifier.value = false;
    } else {
      textInputActiveNotifier.value = true;
    }
  }

  void chanceKeyboardType(KEYBOARD_TYPE type) {
    if (type != keyboardNotifier.value) {
      if (type != KEYBOARD_TYPE.TEXTFIELD) focusNode.unfocus();
      keyboardNotifier.value = type;
    } else if (type == keyboardNotifier.value) {
      keyboardNotifier.value = KEYBOARD_TYPE.EMPTY;
    }
  }
}

enum KEYBOARD_TYPE { TOOLBOX, TEXTFIELD, EMOJIPICKER, AUDIO, EMPTY }
