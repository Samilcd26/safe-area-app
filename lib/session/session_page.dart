import 'package:flutter/material.dart';
import 'package:safe_area/setting/color.dart';
import 'package:safe_area/setting/size.dart';

class SessionPage extends StatelessWidget {
  const SessionPage({super.key});

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
          leading: const Icon(
            Icons.arrow_back_rounded,
            color: Color(COLORS.primalOrange),
            size: 32,
          ),
          title: const Text("Samet"),
          actions: const [
            Icon(
              Icons.cancel,
              size: SIZE.iconSize,
              color: Color(COLORS.danger),
            ),
            Icon(Icons.more_vert_outlined),
          ],
        ),
        //? **************************************************************
        body: Column(
          children: [
            LeftClient(),
            RightClient(),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
            color: Colors.transparent,
            elevation: 0.0,
            shape: const CircularNotchedRectangle(),
            notchMargin: 8.0,
            child: Container(
              decoration: BoxDecoration(border: BorderDirectional(top: BorderSide(color: Color(COLORS.primalGrey)))),
              height: 70,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Icon(
                          Icons.add_circle_outline,
                          color: Color(COLORS.primalGrey),
                          size: SIZE.iconSize,
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
