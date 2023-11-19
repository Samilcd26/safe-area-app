import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safe_area/Controller/main_controller.dart';
import 'package:safe_area/setting/color.dart';
import 'package:safe_area/setting/size.dart';

class SessionPage extends StatefulWidget {
  SessionPage({super.key});

  @override
  State<SessionPage> createState() => _SessionPageState();
}

class _SessionPageState extends State<SessionPage> {
  final _controller = Get.put(MainController());

  bool toolPage = false;
  double toolPageHeigh = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,

        //?AppBar
        appBar: AppBar(
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
        body: Stack(
          children: [
            Column(
              children: [
                LeftClient(),
                RightClient(),
              ],
            ),
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
        ),
        bottomNavigationBar: BottomAppBar(
            color: Colors.transparent,
            elevation: 0.0,
            shape: const CircularNotchedRectangle(),
            notchMargin: 8.0,
            child: Padding(
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
            )),
      ),
    );
  }
}

class RightClient extends StatelessWidget {
  const RightClient({
    super.key,
  });

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
                    Flexible(child: Text("ohbet edek en azından")),
                    Column(
                      children: [
                        SizedBox(height: 20),
                        Text("Mon:22:22"),
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
  });

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
                    Text("ohbet edek en azından"),
                    Column(
                      children: [
                        SizedBox(height: 20),
                        Text("Mon:22:22"),
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

 Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.all(Radius.circular(7))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("ohbet edek en azından"),
              Column(
                children: [
                  SizedBox(height: 20),
                  Text("Mon:22:22"),
                ],
              )
            ],
          ),
        ),
      ),
    )
 */
