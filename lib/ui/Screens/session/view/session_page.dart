// ignore_for_file: non_constant_identifier_names

import 'dart:math';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:safe_area/core/Data/Models/message_model.dart';
import 'package:safe_area/core/Data/Models/user_model.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:safe_area/ui/Screens/home/view/home_page.dart';
import 'package:safe_area/ui/Screens/session/view/tool_box.dart';
import 'package:safe_area/ui/Screens/session/viewModel/session_page_mixin.dart';
import 'package:safe_area/ui/theme/constants.dart';

class SessionPage extends StatefulWidget {
  SessionPage({super.key, required this.toUser});
  UserModel toUser;

  @override
  State<SessionPage> createState() => _SessionPageState();
}

class _SessionPageState extends State<SessionPage> with SessionPageMixin {
  @override
  void initState() {
    super.initState();
    SessionPageInit(widget.toUser.phone.toString());
  }

  @override
  Widget build(BuildContext context) {
    final UserModel currentUser = controller.currentUser;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,

        appBar: appBar(widget.toUser.userName)
        //* AppBar
        ,
        //? **************************************************************
        body:
            //* BODY

            PopScope(
          canPop: false,
          onPopInvoked: (didPop) {
            if (keyboardType != KEYBOARD_TYPE.EMPTY) {
              keyboardType = KEYBOARD_TYPE.EMPTY;
              didPop = false;
            } else {
              //
            }
          },
          child: Stack(alignment: Alignment.bottomCenter, children: [
            //* Message TextFiled
            SizedBox(
              height: Get.height * 0.90,
              child:
                  //* Message List
                  Padding(
                      padding: EdgeInsets.only(bottom: Get.height * 0.10),
                      child: StreamBuilder<MessageModel>(
                        stream: controller.getStreamData(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            messages = [...messages, snapshot.data!];
                          }
                          //snapshot.data != null ? _messages.add(snapshot.data) : "";
                          return ListView(
                              controller: listViewCont,
                              children: messages
                                  .expand((msg) => [
                                        if (msg.from == currentUser.phone) ...[
                                          MessageBox(message: msg.message, isSee: msg.isSee, sendDate: msg.sendDate, own: false)
                                        ]
                                        //*
                                        else if (msg.from == widget.toUser.phone) ...[
                                          MessageBox(message: msg.message, isSee: msg.isSee, sendDate: msg.sendDate, own: true)
                                          //LeftClient(message: msg.message, isSee: msg.isSee, sendDate: msg.sendDate)
                                        ]
                                      ])
                                  .toList());
                        },
                      )),
            ),
            bottomBar(currentUser)
          ]),
        ),
      ),
    );
  }

  Widget bottomBar(UserModel currentUser) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: Get.height * 0.08,
          color: Colors.black,
          child: Container(
            decoration: const BoxDecoration(border: BorderDirectional(top: BorderSide(color: COLORS.primalGrey))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  //* Open to toolbox
                  Expanded(
                      flex: 1,
                      child: IconButton(
                        icon: const Icon(
                          CupertinoIcons.add_circled,
                          size: SIZE.iconSize,
                        ),
                        color: CupertinoColors.systemGrey,
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                          setState(() {
                            if (keyboardType != KEYBOARD_TYPE.TOOLBOX) {
                              keyboardType = KEYBOARD_TYPE.TOOLBOX;
                            } else {
                              keyboardType = KEYBOARD_TYPE.EMPTY;
                            }
                          });
                        },
                      )),
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
                                  controller: messageInputController,
                                  minLines: 1,
                                  maxLines: 5,
                                  onTap: () {
                                    setState(() {
                                      keyboardType = KEYBOARD_TYPE.TEXTFIELD;
                                    });
                                    //goToEnd();
                                  },
                                  onChanged: (value) {
                                    setState(() {
                                      if (value == "") {
                                        inText = true;
                                      } else {
                                        inText = false;
                                      }
                                    });
                                  },
                                  onEditingComplete: () {},
                                  onSubmitted: (value) {
                                    if (value.trim().isNotEmpty) sendMessage(currentUser, widget.toUser, value.trim());
                                  },
                                  textInputAction: TextInputAction.send,
                                  keyboardType: TextInputType.multiline,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Type a message",
                                      hintStyle: TextStyle(color: CupertinoColors.systemGrey)),
                                ),
                              ),

                              //* Emoji picker opening
                              Expanded(
                                  flex: 1,
                                  child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          FocusScope.of(context).unfocus();
                                          if (keyboardType != KEYBOARD_TYPE.EMOJIPICKER) {
                                            keyboardType = KEYBOARD_TYPE.EMOJIPICKER;
                                          } else {
                                            keyboardType = KEYBOARD_TYPE.EMPTY;
                                          }
                                        });
                                      },
                                      icon: Icon(CupertinoIcons.smiley),
                                      color: CupertinoColors.systemGrey))
                            ],
                          ),
                        ),
                      )),

                  //* Voice Message
                  Expanded(
                      flex: 1,
                      child: CircleAvatar(
                          backgroundColor: CupertinoColors.activeGreen,
                          child: Icon(
                            inText ? CupertinoIcons.mic_solid : Icons.send_rounded,
                            size: 25,
                            color: Colors.white,
                          ))),
                ],
              ),
            ),
          ),
        ),

        //* Emoji Picker
        if (keyboardType == KEYBOARD_TYPE.EMOJIPICKER) ...[
          SizedBox(
            height: 250,
            child: EmojiSelector(),
          )
        ] else if (keyboardType == KEYBOARD_TYPE.TOOLBOX) ...[
          ToolBoxPart()
        ]
      ],
    );
  }

  AppBar appBar(String userName) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            color: COLORS.primalOrange,
            height: 1.0,
          )),
      leading: IconButton(
        onPressed: () {
          //? Return to home page
          Get.offAll(HomePage());
        },
        icon: const Icon(
          Icons.arrow_back_rounded,
          size: 32,
        ),
        color: COLORS.primalOrange,
      ),
      title: Text(userName),
      actions: [
        IconButton(icon: const Icon(Icons.delete_forever_rounded, size: 30), onPressed: SessionDisposeDialog),
        const SizedBox(width: 10),
        const Icon(Icons.more_vert_outlined, size: 30),
        const SizedBox(width: 10)
      ],
    );
  }

  Widget EmojiSelector() {
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