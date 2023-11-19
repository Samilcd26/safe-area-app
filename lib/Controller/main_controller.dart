import 'package:get/get.dart';
import 'package:safe_area/Business/IConnectService.dart';
import 'package:safe_area/Business/Impl/ConnectService.dart';

class MainController extends GetxController {
  IConnectService _service = ConnectService();

  var count = 0.obs;
  void CreateRoom() {
    _service.createRoom();
  }
}
