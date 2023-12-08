import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safe_area/Data/State/main_controller.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(MainController());
    final _userName = TextEditingController(text: _controller.currentUser.userName);
    final _userPhone = TextEditingController(text: _controller.currentUser.phone.toString());
    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              //* Left Space
              const Expanded(child: SizedBox()),
              //* User Avatar
              const Expanded(child: CircleAvatar(minRadius: 40, maxRadius: 60, backgroundColor: Colors.amber)),
              //* Edit User ınfo
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    alignment: Alignment.topRight,
                    height: 100,
                    child: IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Container(
                                height: 200,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      //* User Name Edit
                                      Container(
                                          width: 200,
                                          decoration: BoxDecoration(border: Border.all(), borderRadius: BorderRadius.circular(30)),
                                          child: Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: TextField(
                                                  controller: _userName, decoration: InputDecoration.collapsed(hintText: "hintText")))),
                                      //* User Phone Edit
                                      Container(
                                          width: 200,
                                          decoration: BoxDecoration(border: Border.all(), borderRadius: BorderRadius.circular(30)),
                                          child: Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: TextField(
                                                  controller: _userPhone, decoration: InputDecoration.collapsed(hintText: "hintText")))),
                                      ElevatedButton(
                                        child: const Text('Save'),
                                        onPressed: () => _controller.changeCurrentUser(_userName.text, int.parse(_userPhone.text)),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        icon: const Icon(CupertinoIcons.pencil, size: 30)),
                  )
                ],
              )),
            ],
          ),
          const SizedBox(height: 10),
          Text(_controller.currentUser.userName, style: const TextStyle(color: CupertinoColors.white, fontSize: 20)),
          const SizedBox(height: 5),
          Text(_controller.currentUser.phone.toString(), style: const TextStyle(color: CupertinoColors.systemGrey, fontSize: 15))
        ],
      ),
    );
  }
}
