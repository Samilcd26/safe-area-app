import 'package:safe_area/Business/EventType.dart';
import 'package:safe_area/Business/IConnectService.dart';
import 'package:safe_area/Business/Impl/StreamSocket.dart';
import 'package:safe_area/Core/socket_client.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:dio/dio.dart';

class ConnectService extends IConnectService {
  final _socketClient = SocketClient.instance.socket!;

  final dio = Dio();

  StreamSocket streamSocket = StreamSocket();

  //****************************************************************
  //*Decencies
  @override
  StreamSocket get getStreamSocket => streamSocket;
  @override
  Socket get socketClient => _socketClient;
  //****************************************************************

  @override
  void sendMessage(int from, int to, String message) {
    _socketClient.emit(EVENT_TYPE.sentMessage, {
      'from': from,
      'to': to,
      'message': message,
    });
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
    _socketClient.onConnect((_) {
      print('connect');
      _socketClient.emit(EVENT_TYPE.register, (data) => {print(data)});
    });
  }

//****************************************************************
  @override
  void joinRoomSuccessListener() {
    // TODO: implement joinRoomSuccessListener
  }
//****************************************************************
  @override
  void messageListener() {
    _socketClient.on(EVENT_TYPE.sentMessage, (data) => streamSocket.addResponse(data));
  }
}
