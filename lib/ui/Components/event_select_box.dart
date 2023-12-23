// ignore_for_file: constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safe_area/core/Data/Models/user_model.dart';
import 'package:safe_area/core/Data/State/main_controller.dart';
import 'package:safe_area/core/Feature/image_cached.dart';

import 'package:safe_area/ui/Screens/session/view/session_page.dart';
import 'package:safe_area/ui/theme/constants.dart';

class EventSelectBox extends StatelessWidget {
  const EventSelectBox(
      {super.key, required this.user, required this.boxType, this.customIcon = Icons.not_accessible, required this.boxTitle, this.getPage});

  //? Default mode notebook
  final UserModel user;
  final SELECT_BOX_TYPE boxType;
  final getPage;
  final IconData customIcon;
  final String boxTitle;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MainController());

    //*
    return InkWell(
      onTap: () {
        if (boxType == SELECT_BOX_TYPE.CREATE_SESSION) {
          Get.to(SessionPage(
            toUser: user,
          ));
        } else {
          Get.to(getPage);
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
          decoration:
              //* Box Background Color
              BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(13)),
                  color: SELECT_BOX_TYPE.CREATE_SESSION == boxType ? COLORS.black : COLORS.primalGrey),
          height: 90,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child:
                //* Box Icon Or Logo
                Row(
              children: [
                if (boxType == SELECT_BOX_TYPE.CREATE_SESSION) ...{
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      height: 70,
                      child: CircleAvatar(
                        //TODO: ADD user profine pic
                        backgroundImage: NETWORK_IMAGE.GetImageProvider("https://xsgames.co/randomusers/avatar.php?g=male"),
                      ),
                    ),
                  )
                } else ...{
                  Expanded(
                      flex: 1,
                      child: SizedBox(
                          height: 70,
                          child: CircleAvatar(backgroundColor: Colors.purple, child: Icon(customIcon, size: 40, color: Colors.white))))
                },

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
                              boxTitle,
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

enum SELECT_BOX_TYPE { CREATE_SESSION, NOTE_MOD, CUSTOM }
