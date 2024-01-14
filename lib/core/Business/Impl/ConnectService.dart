import 'package:safe_area/core/Business/EventType.dart';
import 'package:safe_area/core/Business/IConnectService.dart';
import 'package:safe_area/core/Data/Models/message_model.dart';
import 'package:safe_area/core/Feature/StreamMessage.dart';
import 'package:safe_area/core/Feature/socket_client.dart';

import 'package:socket_io_client/socket_io_client.dart';

class ConnectService extends IConnectService {
  final _socketClient = SocketClient.instance.socket!;

  var test = [];
  final streamMessage = StreamMessage();

  @override
  // TODO: implement getStreamMessage
  StreamMessage get getStreamMessage => streamMessage;

  //****************************************************************
  //*Decencies

  @override
  Socket get socketClient => _socketClient;
  //****************************************************************

  @override
  void sendMessage(MessageModel message) {
    streamMessage.addResponse(message.toJson());
    _socketClient.emit(EVENT_TYPE.sentMessage, message.toJson());
  }

  //****************************************************************
  @override
  void createRoomSuccessListener() {
    // TODO: implement createRoomSuccessListener
  }

  //****************************************************************
  @override
  void errorOccuredListener() {
    // TODO: implement errorOccuredListener
  }

  //****************************************************************
  @override
  void joinRoom(String from, String to) {
    _socketClient.emit(EVENT_TYPE.register, {from, to});
  }

//****************************************************************
  @override
  void joinRoomSuccessListener() {
    // TODO: implement joinRoomSuccessListener
  }
//****************************************************************
  @override
  void messageListener(String userNumber) {
    _socketClient.on(
      userNumber,
      (data) => streamMessage.addResponse(data),
    );
  }

  @override
  void disposeListener() {
    streamMessage.dispose();
  }
}
