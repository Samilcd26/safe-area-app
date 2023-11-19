import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:safe_area/Core/image_cached.dart';
import 'package:safe_area/Screens/session/session_page.dart';
import 'package:safe_area/setting/color.dart';

class SinglePage extends StatefulWidget {
  const SinglePage({super.key});

  @override
  State<SinglePage> createState() => _SinglePageState();
}

class _SinglePageState extends State<SinglePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SessionView(title: "My Notebook", date: '14/Mon', customIcon: Icons.note_add_sharp, isNoteMod: true),
      ],
    );
  }
}

class SessionView extends StatelessWidget {
  const SessionView({super.key, required this.title, required this.date, this.customIcon, required this.isNoteMod});

  final String title;
  final String date;
  final IconData? customIcon;
  final bool isNoteMod;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        isNoteMod ? Get.to(SessionPage()) : "";
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(13)), color: Color(COLORS.primalGrey)),
          height: 90,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              children: [
                if (customIcon != null) ...{
                  Expanded(
                      flex: 1,
                      child: Container(
                          height: 70,
                          child: CircleAvatar(backgroundColor: Colors.purple, child: Icon(customIcon, size: 40, color: Colors.white)))),
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
                              title,
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(date),
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
