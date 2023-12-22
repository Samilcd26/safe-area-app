// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:safe_area/core/Data/Database/model/session_hive_operation.dart';
import 'package:safe_area/core/Data/Models/message_model.dart';
import 'package:safe_area/core/Data/Models/user_model.dart';
import 'package:safe_area/core/Data/State/main_controller.dart';
import 'package:safe_area/ui/Screens/home/view/home_page.dart';

mixin SessionPageMixin<T extends StatefulWidget> on State<T> {
  final SessionHiveOperation _databaseOperation = SessionHiveOperation();
  MainController controller = Get.put(MainController());

  double toolPageHeigh = 0;
  KEYBOARD_TYPE keyboardType = KEYBOARD_TYPE.EMPTY;
  bool inText = false;
  // bool showEmojiPicker = false;
  // bool showMoreTool = false;
  bool isFirstMessage = false;
  List<MessageModel> messages = [];
  bool toolPage = true;

  final ScrollController listViewCont = ScrollController();
  final TextEditingController messageInputController = TextEditingController();

  //!controller.currentUser ↓↓↓

  void SessionPageInit(String toUserPhone) {
    controller.getCurrentSessionData(toUserPhone);
    if (controller.currentSession != null) {
      messages = controller.currentSession!.messageList;
    }
    print(messages);
  }

  List<MessageModel>? getMessageList(String key) {
    return _databaseOperation.getItem(key)?.messageList;
  }

  void sendMessage(UserModel fromUser, UserModel toUser, String message) {
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

  Future<dynamic> SessionDisposeDialog() {
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
    listViewCont.jumpTo(listViewCont.position.maxScrollExtent);
  }

  Future pickImageFromGallery() async {
    final returnedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
  }
}

enum KEYBOARD_TYPE { TOOLBOX, TEXTFIELD, EMOJIPICKER, EMPTY }
