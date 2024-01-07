// ignore_for_file: non_constant_identifier_names, curly_braces_in_flow_control_structures

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:safe_area/core/Data/Models/message_model.dart';
import 'package:safe_area/core/Data/Models/user_model.dart';
import 'package:flutter/foundation.dart' as foundation;

import 'package:safe_area/ui/Screens/session/component/tool_box.dart';
import 'package:safe_area/ui/Screens/session/viewModel/session_page_mixin.dart';
import 'package:safe_area/ui/theme/constants.dart';

class SessionPage extends StatelessWidget with SessionPageMixin {
  SessionPage({super.key, required this.toUser}) {}
  // ignore: empty_constructor_bodies
  UserModel toUser;
  get bottomInputBar => Get.height * 0.08;

  @override
  Widget build(BuildContext context) {
    SessionPageInit(toUser.phone.toString());
    final UserModel currentUser = controller.currentUser;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,

        appBar: appBar(context, toUser.userName),
        //* AppBar
        //? **************************************************************
        body: Column(
          children: [
            Expanded(
              child: StreamBuilder(
                stream: controller.getStreamData(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    messages = [...messages, snapshot.data];
                  }
                  return ListView.builder(
                    controller: scrollController,
                    itemCount: messages.length + 1,
                    itemBuilder: (context, index) {
                      if (index == messages.length) {
                        return Container(height: 70);
                      }
                      if (messages[index].from == currentUser.phone) {
                        return MessageBox(
                            message: messages[index].message, isSee: messages[index].isSee, sendDate: messages[index].sendDate, own: false);
                      } else if (messages[index].from == currentUser.phone) {
                        return MessageBox(
                            message: messages[index].message, isSee: messages[index].isSee, sendDate: messages[index].sendDate, own: true);
                      }
                    },
                  );
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: bottomBar(context, currentUser),
            )
          ],
        ),
      ),
    );
  }

  Widget bottomBar(BuildContext context, UserModel currentUser) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: bottomInputBar,
          color: Colors.black,
          child: Container(
            decoration: const BoxDecoration(border: BorderDirectional(top: BorderSide(color: COLORS.primalGrey))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  //* Open to toolbox
                  ValueListenableBuilder(
                    valueListenable: keyboardNotifier,
                    builder: (BuildContext context, dynamic value, Widget? child) {
                      return Expanded(
                          flex: 1,
                          child: IconButton(
                            icon: const Icon(
                              CupertinoIcons.add_circled,
                              size: SIZE.iconSize,
                              color: CupertinoColors.systemGrey,
                            ),
                            onPressed: () => chanceKeyboardType(KEYBOARD_TYPE.TOOLBOX),
                          ));
                    },
                  ),
                  //* Message TextField
                  Expanded(
                      flex: 5,
                      child: Container(
                        decoration: const BoxDecoration(color: COLORS.primalGrey, borderRadius: BorderRadius.all(Radius.circular(50))),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 6,
                                child: TextField(
                                  focusNode: focusNode,
                                  controller: messageInputController,
                                  minLines: 1,
                                  maxLines: 5,
                                  //onTap: () => chanceKeyboardType(KEYBOARD_TYPE.TEXTFIELD),
                                  onChanged: (value) => chanceTextInputStatus(value),
                                  onEditingComplete: () {},
                                  onSubmitted: (value) {
                                    if (value.trim().isNotEmpty) sendMessage(currentUser, toUser, value.trim());
                                  },
                                  textInputAction: TextInputAction.send,
                                  keyboardType: TextInputType.multiline,
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Type a message",
                                      hintStyle: TextStyle(color: CupertinoColors.systemGrey)),
                                ),
                              ),

                              //* Emoji picker opening
                              Expanded(
                                  flex: 1,
                                  child: IconButton(
                                      onPressed: () => chanceKeyboardType(KEYBOARD_TYPE.EMOJIPICKER),
                                      icon: Icon(CupertinoIcons.smiley),
                                      color: CupertinoColors.systemGrey)),
                            ],
                          ),
                        ),
                      )),

                  //* Voice Message
                  Expanded(
                      flex: 1,
                      child: CircleAvatar(
                        backgroundColor: CupertinoColors.activeGreen,
                        child: ValueListenableBuilder(
                          valueListenable: textInputActiveNotifier,
                          builder: (BuildContext context, dynamic value, Widget? child) {
                            return Icon(
                              textInputActiveNotifier.value ? Icons.send_rounded : CupertinoIcons.mic_solid,
                              size: 25,
                              color: Colors.white,
                            );
                          },
                        ),
                      )),
                ],
              ),
            ),
          ),
        ),
//* Emoji & ToolBox Picker
        ValueListenableBuilder(
          valueListenable: keyboardNotifier,
          builder: (BuildContext context, dynamic value, Widget? child) {
            if (keyboardNotifier.value == KEYBOARD_TYPE.EMOJIPICKER) {
              return SizedBox(
                height: 250,
                child: EmojiSelector(context),
              );
            } else if (keyboardNotifier.value == KEYBOARD_TYPE.TOOLBOX) {
              return ToolBoxPart();
            } else
              return const SizedBox();
          },
        ),
      ],
    );
  }

  AppBar appBar(BuildContext context, String userName) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      bottom: PreferredSize(preferredSize: const Size.fromHeight(4.0), child: Container(color: COLORS.primalOrange, height: 1.0)),
      leading: IconButton(
        onPressed: () => Get.back(),
        icon: const Icon(Icons.arrow_back_rounded, size: 32),
        color: COLORS.primalOrange,
      ),
      title: Text(userName),
      actions: [
        IconButton(icon: const Icon(Icons.delete_forever_rounded, size: 30), onPressed: () => SessionDisposeDialog(context)),
        const SizedBox(width: 10),
        const Icon(Icons.more_vert_outlined, size: 30),
        const SizedBox(width: 10)
      ],
    );
  }

  Widget EmojiSelector(BuildContext context) {
    return EmojiPicker(
      onEmojiSelected: (category, emoji) {},
      onBackspacePressed: () {
        // Do something when the user taps the backspace button (optional)
        // Set it to null to hide the Backspace-Button
        FocusScope.of(context).unfocus();
      },
      textEditingController: messageInputController,
      // pass here the same [TextEditingController] that is connected to your input field, usually a [TextFormField]
      config: Config(
        columns: 7,
        emojiSizeMax: 32 *
            (foundation.defaultTargetPlatform == TargetPlatform.iOS ? 1.30 : 1.0), // Issue: https://github.com/flutter/flutter/issues/28894
        verticalSpacing: 0,
        horizontalSpacing: 0,
        gridPadding: EdgeInsets.zero,
        initCategory: Category.RECENT,
        bgColor: Color(0xFFF2F2F2),
        indicatorColor: Colors.blue,
        iconColor: Colors.grey,
        iconColorSelected: Colors.blue,
        backspaceColor: Colors.blue,
        skinToneDialogBgColor: Colors.white,
        skinToneIndicatorColor: Colors.grey,
        enableSkinTones: true,
        recentTabBehavior: RecentTabBehavior.RECENT,
        recentsLimit: 28,
        noRecents: const Text(
          'No Recents',
          style: TextStyle(fontSize: 20, color: Colors.black26),
          textAlign: TextAlign.center,
        ), // Needs to be const Widget
        loadingIndicator: const SizedBox.shrink(), // Needs to be const Widget
        tabIndicatorAnimDuration: kTabScrollDuration,
        categoryIcons: const CategoryIcons(),
        buttonMode: ButtonMode.MATERIAL,
      ),
    );
  }
}

class MessageBox extends StatelessWidget {
  const MessageBox({super.key, required this.message, required this.sendDate, required this.isSee, required this.own});
  final String message;
  final DateTime sendDate;
  final bool isSee;
  final bool own;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: Row(
        mainAxisAlignment: own ? MainAxisAlignment.start : MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Text("11:44", style: TextStyle(fontSize: 12, color: CupertinoColors.systemGrey3)),
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              decoration: BoxDecoration(
                color: CupertinoColors.systemGreen,
                borderRadius: BorderRadius.only(
                  topLeft: own ? const Radius.circular(0) : const Radius.circular(20),
                  topRight: own ? const Radius.circular(20) : const Radius.circular(0),
                  bottomLeft: const Radius.circular(20),
                  bottomRight: const Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: own
                    ? Text(message, style: const TextStyle(fontSize: 18, color: Colors.white))
                    : Text(message, style: const TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: camel_case_types

//* WHATSAPP Style
/*

Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    own
                        ? Text(message, style: TextStyle(fontSize: 18, color: Colors.white))
                        : Flexible(child: Text(message, style: TextStyle(fontSize: 18, color: Colors.white))),
                    SizedBox(width: 10),
                    Column(
                      children: [
                        const SizedBox(height: 15),
                        Text(
                          "10:52 pm",
                          style: TextStyle(color: CupertinoColors.systemGrey4),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        const SizedBox(height: 15),
                        Icon(
                          isSee ? Icons.done_rounded : Icons.done_all_rounded,
                          size: 15,
                          color: CupertinoColors.systemGrey4,
                        )
                      ],
                    )
                  ],
                ),
              )
 */
