import 'package:get/get.dart';
import 'package:safe_area/Business/IConnectService.dart';
import 'package:safe_area/Business/Impl/ConnectService.dart';
import 'package:safe_area/Business/Impl/StreamSocket.dart';
import 'package:safe_area/Data/Models/user_model.dart';

class MainController extends GetxController {
  IConnectService _service = ConnectService();

  var count = 0.obs;
  UserModel currentUser = Rx(UserModel(id: 1, userName: "Ahmet T", phone: 5530146669, verified: true))();

  Stream<String> getStreamData() {
    return _service.getStreamSocket.getResponse;
  }

  void changeCurrentUser(String userName, int phone) {
    currentUser.copyWith(userName: userName);
    currentUser.copyWith(phone: phone);
  }

  //? roomId,from,to
  void createRoom(String? countryCode, UserModel toUser) {
    _service.createRoom(countryCode ?? "nll", currentUser.userName, toUser.userName);
  }

  void sendMessage(UserModel fromUser, UserModel toUser, String message) {
    //? From->To->Message
    _service.sendMessage(fromUser.phone, toUser.phone, message);
  }

  void messageListener() {
    _service.messageListener();
  }
}
