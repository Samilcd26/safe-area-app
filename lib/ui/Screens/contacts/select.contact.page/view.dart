import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safe_area/ui/Screens/contacts/select.contact.page/view.mixin.dart';

import 'package:safe_area/ui/theme/constants.dart';

class SelectContactPage extends StatelessWidget with ContactPageMixin {
  SelectContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    instigation(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(CupertinoIcons.chevron_back, size: SIZE.iconSize)),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Available contact", style: TextStyle(fontSize: 20)),
            Text('${contactList.length} current contact', style: const TextStyle(fontSize: 12)),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search, size: SIZE.iconSize)),
          DropdownButton2(
            dropdownStyleData: DropdownStyleData(
              width: 160,
              padding: const EdgeInsets.symmetric(vertical: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
              ),
              offset: const Offset(40, -4),
            ),
            customButton: const Icon(Icons.more_vert_outlined, size: SIZE.iconSize),
            underline: const SizedBox(),
            value: dropDownItemsVal.contact,
            items: dropDownItems,
            onChanged: (value) {},
          ),
        ],
      ),
      body: ListView(
        children: contactList,
      ),
    );
  }
}
