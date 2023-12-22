import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:safe_area/ui/Components/event_select_box.dart';

import 'package:safe_area/core/Data/State/main_controller.dart';

class SinglePage extends StatefulWidget {
  SinglePage({super.key});

  @override
  State<SinglePage> createState() => _SinglePageState();
}

class _SinglePageState extends State<SinglePage> {
  final _controller = Get.put(MainController());
  Offset _tapPosition = Offset.zero;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder(
          future: _controller.getSessionData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: List.generate(
                  snapshot.data!.length,
                  (index) => GestureDetector(
                      onLongPress: () => _showContextMenu(context),
                      onTapDown: (details) => _getTapPosition(details),
                      child: EventSelectBox(
                          user: snapshot.data![index].toUser,
                          boxTitle: snapshot.data![index].toUser.userName,
                          boxType: SELECT_BOX_TYPE.CREATE_SESSION)),
                ),
              );
            }
            return const SizedBox();
          },
        )
      ],
    );
  }

  void _getTapPosition(TapDownDetails details) {
    final RenderBox referenceBox = context.findRenderObject() as RenderBox;
    setState(() {
      _tapPosition = referenceBox.globalToLocal(details.globalPosition);
    });
  }

  void _showContextMenu(BuildContext context) async {
    final RenderObject? overlay = Overlay.of(context)?.context.findRenderObject();

    final result = await showMenu(
        context: context,

        // Show the context menu at the tap location
        position: RelativeRect.fromRect(Rect.fromLTWH(_tapPosition.dx, _tapPosition.dy, 30, 30),
            Rect.fromLTWH(0, 0, overlay!.paintBounds.size.width, overlay.paintBounds.size.height)),

        // set a list of choices for the context menu
        items: [
          const PopupMenuItem(
            value: 'favorites',
            child: Text('Add To Favorites'),
          ),
          const PopupMenuItem(
            value: 'comment',
            child: Text('Write Comment'),
          ),
          const PopupMenuItem(
            value: 'hide',
            child: Text('Hide'),
          ),
        ]);

    // Implement the logic for each choice here
    switch (result) {
      case 'favorites':
        debugPrint('Add To Favorites');
        break;
      case 'comment':
        debugPrint('Write Comment');
        break;
      case 'hide':
        debugPrint('Hide');
        break;
    }
  }
}
