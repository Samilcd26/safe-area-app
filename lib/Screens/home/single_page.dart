import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:safe_area/Core/image_cached.dart';
import 'package:safe_area/Data/Models/user_model.dart';
import 'package:safe_area/Data/State/main_controller.dart';
import 'package:safe_area/Screens/note/note_page.dart';
import 'package:safe_area/Screens/session/session_page.dart';
import 'package:safe_area/setting/color.dart';

class SinglePage extends StatefulWidget {
  SinglePage({super.key});
  final _controller = Get.put(MainController());
  @override
  State<SinglePage> createState() => _SinglePageState();
}

class _SinglePageState extends State<SinglePage> {
  final UserModel testUser = UserModel(id: 123456, userName: "Ahmet CanServer", phone: 1234567, verified: true);
  final UserModel testUser2 = UserModel(id: 654321, userName: "Sinan Aktaş", phone: 7654321, verified: true);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SessionView(user: widget._controller.currentUser, fromUser: widget._controller.currentUser, isNoteMod: true),
        SessionView(user: testUser, fromUser: testUser2, isNoteMod: false),
        SessionView(user: testUser2, fromUser: testUser, isNoteMod: false),
      ],
    );
  }
}

class SessionView extends StatelessWidget {
  const SessionView({super.key, required this.user, required this.fromUser, required this.isNoteMod});

  final UserModel user;
  final UserModel fromUser;
  final bool isNoteMod;
  @override
  Widget build(BuildContext context) {
    final String? currentLoc = View.of(context).platformDispatcher.locale.countryCode;
    final _controller = Get.put(MainController());
    return InkWell(
      onTap: () {
        if (!isNoteMod) {
          _controller.createRoom(currentLoc, user);
          Get.to(SessionPage(
            toUser: user,
            fromUser: fromUser,
          ));
        } else {
          Get.to(NotePage());
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(13)), color: Color(isNoteMod ? COLORS.primalGrey : COLORS.black)),
          height: 90,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              children: [
                if (isNoteMod) ...{
                  const Expanded(
                      flex: 1,
                      child: SizedBox(
                          height: 70,
                          child: CircleAvatar(
                              backgroundColor: Colors.purple, child: Icon(Icons.note_add_sharp, size: 40, color: Colors.white)))),
                } else ...{
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 70,
                      child: CircleAvatar(
                        backgroundImage: NETWORK_IMAGE.GetImageProvier("https://xsgames.co/randomusers/avatar.php?g=male"),
                      ),
                    ),
                  )
                },
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              isNoteMod ? "MyNotes" : user.userName,
                              style: TextStyle(fontSize: 20),
                            ),
                            Text("Mon/14"),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
