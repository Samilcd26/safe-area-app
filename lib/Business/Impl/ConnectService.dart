import 'package:safe_area/Business/IConnectService.dart';
import 'package:safe_area/Core/socket_client.dart';
import 'package:socket_io_client/socket_io_client.dart';

class ConnectService extends IConnectService {
  final _socketClient = SocketClient.instance.socket!;

  Socket get socketClient => _socketClient;

  @override
  void addTestData() {
    _socketClient.emit('createRoom', {});
  }

  @override
  void createRoom() {
    _socketClient.emit('createRoom', {
      'nickname': "nickname",
    });
  }

  @override
  void createRoomSuccessListener() {
    // TODO: implement createRoomSuccessListener
  }

  @override
  void errorOccuredListener() {
    // TODO: implement errorOccuredListener
  }

  @override
  void joinRoom() {
    // TODO: implement joinRoom
  }

  @override
  void joinRoomSuccessListener() {
    // TODO: implement joinRoomSuccessListener
  }
}
