import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safe_area/core/Data/Models/user_model.dart';
import 'package:safe_area/ui/Screens/producer/view.mixin.dart';
import 'package:safe_area/ui/Screens/session/view.dart';

class ProducerProfilePage extends StatelessWidget with ProducerPageMixin {
  ProducerProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    const double avatarSize = 120;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: const Icon(
          Icons.arrow_back_ios_new_outlined,
        ),
      ),
      body: SizedBox(
        width: Get.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            //? Avatar Photo

            SizedBox(
              height: 115,
              width: 115,
              child: Stack(
                clipBehavior: Clip.none,
                fit: StackFit.expand,
                children: [
                  // const CircleAvatar(
                  //   backgroundImage: NetworkImage("https://xsgames.co/randomusers/assets/avatars/female/7.jpg"),
                  // ),
                  Positioned(
                      bottom: -12,
                      right: -24,
                      child: RawMaterialButton(
                        onPressed: () {},
                        elevation: 2.0,
                        fillColor: Colors.transparent,
                        padding: const EdgeInsets.all(4.0),
                        shape: const CircleBorder(),
                        child: const Icon(
                          Icons.circle,
                          color: CupertinoColors.activeGreen,
                        ),
                      )),
                ],
              ),
            ),
            const SizedBox(height: 20),
            //? Name and title
            Text("Debbie", style: Theme.of(context).textTheme.headlineLarge),
            Text("Photographer", style: Theme.of(context).textTheme.bodyMedium),

            const SizedBox(height: 30),
            //? Producer's achievement and data
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ColDescription(context, "483", "Post"),
                  const VerticalDivider(),
                  ColDescription(context, "483", "Post"),
                  const VerticalDivider(),
                  ColDescription(context, "483", "Post"),
                ],
              ),
            ),
            const SizedBox(height: 20),

            ProductItem(Icons.call, "30 Dakikalık Görüşme", 60.0, () {}),
            ProductItem(Icons.call, "30 Dakikalık Görüşme", 60.0, () {}),
            AskTpe()
          ],
        ),
      ),
    );
  }

  InkWell ProductItem(IconData icon, String name, double price, Function function) {
    return InkWell(
      onTap: () => function(),
      child: ListTile(
        leading: Icon(icon, size: 30),
        title: Text(name),
        subtitle: Text('$price USD'),
        trailing: const Icon(Icons.arrow_forward_ios_rounded),
      ),
    );
  }

  Column ColDescription(BuildContext context, String upText, String downText) {
    return Column(
      children: [
        Text(upText,
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: CupertinoColors.systemGrey2, fontWeight: FontWeight.w200)),
        Text(downText,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: CupertinoColors.systemGrey2, fontWeight: FontWeight.w200)),
      ],
    );
  }
}
