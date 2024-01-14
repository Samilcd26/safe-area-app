import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safe_area/core/Data/Models/user_model.dart';
import 'package:safe_area/core/Data/State/main_controller.dart';
import 'package:safe_area/core/Feature/image_cached.dart';
import 'package:safe_area/ui/Screens/producer/view.mixin.dart';
import 'package:safe_area/ui/Screens/session/view.dart';
import 'package:safe_area/ui/theme/constants.dart';

mixin SinglePageMixin<T extends StatefulWidget> on State<T> {
  final controller = Get.put(MainController());

  InkWell ListItems(UserModel toUser) {
    return InkWell(
      onTap: () {
        controller.joinRoom(toUser);
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
                              toUser.firstName,
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
