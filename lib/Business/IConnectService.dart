import 'package:safe_area/Business/Impl/StreamSocket.dart';
import 'package:socket_io_client/socket_io_client.dart';

abstract class IConnectService {
  //************************************************************************************************
  //*Decencies
  StreamSocket get getStreamSocket;
  Socket get socketClient;

  //************************************************************************************************
  //*Message Event
  void sendMessage(int from, int to, String message);

  //************************************************************************************************
  //*Listener Event
  void messageListener();
  void createRoomSuccessListener();
  void joinRoomSuccessListener();
  void errorOccuredListener();

  //************************************************************************************************
  //*Room Events
  void createRoom(String countryCode, String from, String to);
  void joinRoom();
}
