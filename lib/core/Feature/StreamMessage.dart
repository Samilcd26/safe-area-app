// ignore: file_names
import 'dart:async';

import 'package:safe_area/core/Data/Models/message_model.dart';

class StreamMessage {
  final _messageController = StreamController<MessageModel>.broadcast();

  Stream<MessageModel> getResponse() => _messageController.stream;

  void addResponse(event) {
    var msg = MessageModel.fromJson(event);
    _messageController.sink.add(msg);
  }

  void dispose() {
    // _messageController.close();
  }
}
