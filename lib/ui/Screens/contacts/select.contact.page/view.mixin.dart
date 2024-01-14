import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:get/get.dart';
import 'package:safe_area/core/Data/Models/user_model.dart';
import 'package:safe_area/core/Data/State/main_controller.dart';
import 'package:safe_area/ui/Screens/producer/view.mixin.dart';
import 'package:safe_area/ui/Screens/session/view.dart';
import 'package:safe_area/ui/theme/constants.dart';
import 'package:share_plus/share_plus.dart';

mixin ContactPageMixin<T extends StatelessWidget> {
  final controller = Get.put(MainController());
  List<Widget> contactList = [];

  void instigation(BuildContext context) async {
    for (UserModel cnt in controller.contactList!) {
      contactList.add(CreateSessionButton(context, cnt));
    }
  }

  InkWell CreateSessionButton(BuildContext context, UserModel toUser) {
    return InkWell(
      onTap: () {
        //controller.joinRoom(toUser);
        Get.to(SessionPage(
          toUser: toUser,
          answerMod: EnumAnswer.NORMAL,
        ));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
          decoration:
              //* Box Background Color
              BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(13)), color: COLORS.black),
          height: 90,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child:
                //* Box Icon Or Logo
                Row(
              children: [
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: 70,
                    child: CircleAvatar(
                        //TODO: ADD user profine pic
                        //backgroundImage: NETWORK_IMAGE.GetImageProvider("https://xsgames.co/randomusers/assets/avatars/male/16.jpg"),
                        ),
                  ),
                ),
                //* Box Body
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
                              toUser.userName,
                              style: TextStyle(fontSize: 20),
                            ),
                            const SizedBox(),
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

  List<DropdownMenuItem> dropDownItems = [
    //TODO:Add Invite message
    DropdownMenuItem(onTap: () => Share.share("Invite"), value: dropDownItemsVal.invite, child: const Text("Invite a friend")),
    DropdownMenuItem(onTap: () => FlutterContacts.openExternalPick(), value: dropDownItemsVal.contact, child: const Text("Contacts")),
    //TODO:Add refresh
    DropdownMenuItem(onTap: () {}, value: dropDownItemsVal.refresh, child: const Text("Refresh")),
  ];
}

enum dropDownItemsVal {
  // ignore: unused_field
  invite,
  contact,
  refresh,
}
