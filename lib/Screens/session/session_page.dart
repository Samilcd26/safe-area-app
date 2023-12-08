import 'dart:io';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:safe_area/Business/Impl/StreamSocket.dart';
import 'package:safe_area/Data/Models/message_model.dart';
import 'package:safe_area/Data/Models/user_model.dart';
import 'package:safe_area/Data/State/main_controller.dart';
import 'package:safe_area/setting/color.dart';
import 'package:safe_area/setting/size.dart';
import 'package:flutter/foundation.dart' as foundation;

class SessionPage extends StatefulWidget {
  SessionPage({super.key, required this.toUser, required this.fromUser});
  UserModel toUser;
  UserModel fromUser;
  @override
  State<SessionPage> createState() => _SessionPageState();
}

class _SessionPageState extends State<SessionPage> {
  final _controller = Get.put(MainController());

  final List<MessageModel> _messages = [
    MessageModel(
        message: "asadasd", from: 55300564, to: 5530146669, sendDate: DateTime.now(), seeDate: DateTime.now(), isSend: true, isSee: true),
    MessageModel(
        message: "asdsa", from: 5530146669, to: 55300564, sendDate: DateTime.now(), seeDate: DateTime.now(), isSend: true, isSee: true)
  ];

  File? _selectedImage;
  bool toolPage = true;
  double toolPageHeigh = 0;
  bool inText = false;
  bool showEmojiPicker = false;
  bool showMoreTool = false;
  @override
  void initState() {
    _controller.messageListener();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double scale = MediaQuery.of(context).size.height;
    //final ScrollController _listViewCont = ScrollController();
    final TextEditingController _messageInputController = TextEditingController();

    //!_controller.currentUser ↓↓↓
    final UserModel _currentUser = widget.fromUser;
    final TextEditingController emojiController = TextEditingController();

    //* Functions
    // void goToEnd() {
    //   _listViewCont.jumpTo(_listViewCont.position.maxScrollExtent);
    // }

    Future _pickImageFromGallery() async {
      final returnedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
      setState(() {
        _selectedImage = File(returnedImage!.path);
      });
    }

    //*Send Message
    void sendMessage(String message) {
      setState(() {
        _messages.add(MessageModel(
            message: message,
            from: _currentUser.phone,
            to: 5555555,
            sendDate: DateTime.now(),
            seeDate: DateTime.now(),
            isSend: true,
            isSee: false));
        _controller.sendMessage(widget.fromUser, widget.toUser, message);
      });
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,

        appBar:
            //* AppBar
            AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(4.0),
              child: Container(
                color: const Color(COLORS.primalOrange),
                height: 1.0,
              )),
          leading: IconButton(
            onPressed: () {
              //? Return to home page
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_rounded,
              size: 32,
            ),
            color: const Color(COLORS.primalOrange),
          ),
          title: const Text("Samet"),
          actions: [
            Container(
              width: 60,
              decoration: BoxDecoration(border: Border.all(color: Colors.red), borderRadius: BorderRadius.circular(15)),
              child: Center(child: Text('Close', style: TextStyle(fontSize: 16))),
            ),
            SizedBox(width: 10),
            Icon(Icons.more_vert_outlined),
            SizedBox(width: 10)
          ],
        ),
        //? **************************************************************
        body:
            //* BODY
            WillPopScope(
          onWillPop: () async {
            if (showEmojiPicker || showMoreTool) {
              setState(() {
                showEmojiPicker = false;
                showMoreTool = false;
              });
            } else {
              Get.back();
            }
            return false;
          },
          child: Stack(alignment: Alignment.bottomCenter, children: [
            //* Message TextFiled
            SizedBox(
              height: scale * 0.90,
              child:
                  //* Message List
                  Padding(
                      padding: EdgeInsets.only(bottom: scale * 0.10),
                      child: StreamBuilder(
                        stream: _controller.getStreamData(),
                        builder: (context, snapshot) {
                          return Container(child: Text(snapshot.data.toString(), style: TextStyle(color: Colors.white)));
                        },
                      )
                      //  ListView(
                      //     controller: _listViewCont,
                      //     children:
                      // _messages
                      //     .expand((msg) => [
                      //           if (msg.from == _currentUser.phone) ...[
                      //             RightClient(message: msg.message, isSee: msg.isSee, sendDate: msg.sendDate)
                      //           ]
                      //           //*
                      //           else ...[LeftClient(message: msg.message, isSee: msg.isSee, sendDate: msg.sendDate)]
                      //         ])
                      //     .toList()

                      /*LeftClient(),
                      RightClient(),
                      SizedBox(height: scale * 0.10), */
                      ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: scale * 0.08,
                  color: Colors.black,
                  child: Container(
                    decoration: BoxDecoration(border: BorderDirectional(top: BorderSide(color: Color(COLORS.primalGrey)))),
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
                                  setState(() {
                                    FocusScope.of(context).unfocus();
                                    showEmojiPicker = false;
                                    showMoreTool = !showMoreTool;
                                  });
                                },
                              )),
                          //* Message TextField
                          Expanded(
                              flex: 5,
                              child: Container(
                                decoration: const BoxDecoration(
                                    color: Color(COLORS.primalGrey), borderRadius: BorderRadius.all(Radius.circular(50))),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 6,
                                        child: TextField(
                                          controller: _messageInputController,
                                          minLines: 1,
                                          maxLines: 5,
                                          onTap: () {
                                            setState(() {
                                              showEmojiPicker = false;
                                              showMoreTool = false;
                                            });
                                            //goToEnd();
                                          },
                                          onChanged: (value) {
                                            if (value == "") {
                                              inText = false;
                                            } else {
                                              inText = true;
                                            }
                                          },
                                          onEditingComplete: () {},
                                          onSubmitted: (value) {
                                            if (value.trim().isNotEmpty) sendMessage(value.trim());
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
                                                  showMoreTool = false;
                                                  showEmojiPicker = !showEmojiPicker;
                                                });
                                              },
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
                                  child: Icon(
                                    CupertinoIcons.mic_solid,
                                    size: 25,
                                    color: Colors.white,
                                  ))),
                        ],
                      ),
                    ),
                  ),
                ),

                //* Emoji Picker
                showEmojiPicker
                    ? SizedBox(
                        height: 250,
                        child: emojiSelect(),
                      )
                    : Container(),
                showMoreTool
                    ? SizedBox(
                        height: 250,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          color: Colors.amber,
                          child: Text("sasd"),
                        ),
                      )
                    : Container(),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}

Widget emojiSelect() {
  return EmojiPicker(
    onBackspacePressed: () {
      // Do something when the user taps the backspace button (optional)
      // Set it to null to hide the Backspace-Button
    },
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

class RightClient extends StatelessWidget {
  const RightClient({
    super.key,
    required this.message,
    required this.sendDate,
    required this.isSee,
  });
  final String message;
  final DateTime sendDate;
  final bool isSee;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.all(Radius.circular(7))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(child: Text(message)),
                    Column(
                      children: [
                        SizedBox(height: 20),
                        Text(sendDate.toString()),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LeftClient extends StatelessWidget {
  const LeftClient({
    super.key,
    required this.message,
    required this.sendDate,
    required this.isSee,
  });
  final String message;
  final DateTime sendDate;
  final bool isSee;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.all(Radius.circular(7))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(message),
                    Column(
                      children: [
                        SizedBox(height: 20),
                        Text(sendDate.hour.toString()),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/*
Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.75,
              color: Colors.amber,
              child: Column(
                children: [
                  LeftClient(),
                  RightClient(),
                ],
              ),
            ),
            Container(height: MediaQuery.of(context).size.height * 0.10, color: Colors.blue),
            if (toolPage) ...[
              Positioned(
                  bottom: 0,
                  child: Container(
                    color: Colors.red,
                    width: MediaQuery.of(context).size.width,
                    height: toolPageHeigh,
                  ))
            ]
          ],
        )

 */

/*

Padding(
              padding: EdgeInsets.only(bottom: toolPageHeigh == 0 ? MediaQuery.of(context).viewInsets.bottom : toolPageHeigh),
              child: Container(
                decoration: BoxDecoration(border: BorderDirectional(top: BorderSide(color: Color(COLORS.primalGrey)))),
                height: 70,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: IconButton(
                            icon: Icon(
                              Icons.add_circle_outline,
                              size: SIZE.iconSize,
                            ),
                            color: Color(COLORS.primalGrey),
                            onPressed: () {
                              setState(() {
                                if (toolPageHeigh == 0.0) {
                                  toolPageHeigh = MediaQuery.of(context).viewInsets.bottom;
                                }
                                toolPage = toolPage ? false : true;
                                FocusScope.of(context).unfocus();
                              });
                            },
                          )),
                      Expanded(
                          flex: 5,
                          child: Container(
                            decoration: BoxDecoration(color: Color(COLORS.primalGrey), borderRadius: BorderRadius.all(Radius.circular(20))),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                              child: TextField(
                                keyboardType: TextInputType.multiline,
                                decoration: InputDecoration(border: InputBorder.none),
                              ),
                            ),
                          )),
                      Expanded(
                          flex: 1,
                          child: CircleAvatar(
                            child: Icon(
                              Icons.keyboard_voice_sharp,
                              size: 35,
                              color: Color(COLORS.primalGrey),
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            )
 */
