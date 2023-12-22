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
    _socketClient.emit(EVENT_TYPE.sentMessage, message);
  }

  //****************************************************************
  @override
  void createRoom(String countryCode, String from, String to) async {
    String roomId = countryCode + from + to;
    //TODO: İd içindeki boşlukları silmenin yolunu bul
    roomId = roomId.replaceAll(RegExp(r'[^\w\s\b|\b\s]'), '');
    roomId = roomId.replaceAll(RegExp(r'[^\u0000-\u007F]'), '');
    _socketClient.emit(EVENT_TYPE.register, {from, to});

    //dio.post('${CONNECTIONS.socketUrl}/createRoom', data: {'roomId': roomId, 'from': from, 'to': to});
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
  void joinRoom() {
    _socketClient.emit(EVENT_TYPE.register, (data) => {print(data)});
  }

//****************************************************************
  @override
  void joinRoomSuccessListener() {
    // TODO: implement joinRoomSuccessListener
  }
//****************************************************************
  @override
  void messageListener() {
    _socketClient.on(
      EVENT_TYPE.sentMessage,
      (data) => streamMessage.addResponse(data),
    );
  }

  @override
  void disposeListener() {
    streamMessage.dispose();
  }
}
