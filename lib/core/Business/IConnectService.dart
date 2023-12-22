import 'package:safe_area/core/Data/Models/message_model.dart';
import 'package:safe_area/core/Feature/StreamMessage.dart';
import 'package:socket_io_client/socket_io_client.dart';

abstract class IConnectService {
  //************************************************************************************************
  //*Decencies
  StreamMessage get getStreamMessage;
  Socket get socketClient;

  //************************************************************************************************
  //*Message Event
  void sendMessage(MessageModel message);
  void disposeListener();
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
