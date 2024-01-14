import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safe_area/core/Data/Models/user_model.dart';
import 'package:safe_area/ui/Screens/session/view.dart';

mixin ProducerPageMixin<T extends StatelessWidget> {
  ValueNotifier valueNotifier = ValueNotifier(EnumAnswer.VIDEO.name);
  List<DropdownMenuItem<String>> ttt = [
    //? Video Ask mode
    DropdownMenuItem<String>(
      //TODO:Payment System need to added
      onTap: () => Get.to(SessionPage(
        toUser: UserModel(
            id: 66666, firstName: "Ahmet", lastName: "Sonuç", userName: "Jahrein", phone: 9057874564, publisher: true, questList: []),
        answerMod: EnumAnswer.AUDIO,
      )),
      value: EnumAnswer.VIDEO.name,
      child: SizedBox(
        width: Get.width - 30,
        child: const ListTile(
          leading: Icon(Icons.video_chat_rounded, size: 30),
          title: Text("Videolu Cevap"),
          subtitle: Text('20 USD'),
          //trailing: const Icon(Icons.arrow_forward_ios_rounded),
        ),
      ),
    ),
    //? Audio Ask mode
    DropdownMenuItem<String>(
      onTap: () => Get.to(SessionPage(
        toUser: UserModel(
            id: 66666, firstName: "Ahmet", lastName: "Sonuç", userName: "Jahrein", phone: 9057874564, publisher: true, questList: []),
        answerMod: EnumAnswer.AUDIO,
      )),
      value: EnumAnswer.AUDIO.name,
      child: SizedBox(
        width: Get.width - 30,
        child: const ListTile(
          leading: Icon(Icons.audiotrack_rounded, size: 30),
          title: Text("Sesli Cevap"),
          subtitle: Text('15 USD'),
          //trailing: const Icon(Icons.arrow_forward_ios_rounded),
        ),
      ),
    ),
    //? Text Ask mode
    DropdownMenuItem<String>(
      onTap: () => Get.to(SessionPage(
        toUser: UserModel(
            id: 66666, firstName: "Ahmet", lastName: "Sonuç", userName: "Jahrein", phone: 9057874564, publisher: true, questList: []),
        answerMod: EnumAnswer.AUDIO,
      )),
      value: EnumAnswer.TEXT.name,
      child: SizedBox(
        width: Get.width - 30,
        child: const ListTile(
          leading: Icon(Icons.text_fields_sharp, size: 30),
          title: Text("Yazılı Cevap"),
          subtitle: Text('5 USD'),
          //trailing: const Icon(Icons.arrow_forward_ios_rounded),
        ),
      ),
    )
  ];

  ValueListenableBuilder AskTpe() {
    return ValueListenableBuilder(
      valueListenable: valueNotifier,
      builder: (BuildContext context, dynamic value, Widget? child) {
        return DropdownButton<String>(
            icon: Icon(Icons.arrow_downward_rounded, size: 30),
            value: valueNotifier.value,
            underline: SizedBox(),
            onChanged: (String? value) {
              valueNotifier.value = value;
            },
            items: ttt);
      },
    );
  }
}

enum EnumAnswer { VIDEO, AUDIO, TEXT, NORMAL }
