import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:jusst_echnologies_task/socket/socket.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class NextScreenProvider extends ChangeNotifier {
  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();
  final TextEditingController controller3 = TextEditingController();
  final TextEditingController controller4 = TextEditingController();
  final TextEditingController controller5 = TextEditingController();

  final channel = WebSocketChannel.connect(
    Uri.parse(SocketCall.Url2),
  );

  void sendMessage() {
    if (controller1.text.isNotEmpty ||
        controller2.text.isNotEmpty ||
        controller3.text.isNotEmpty ||
        controller4.text.isNotEmpty ||
        controller5.text.isNotEmpty) {
      // channel.sink.add(controller1.text);
      Map<String, dynamic> data = new Map<String, dynamic>();
      data['full name'] = controller1.text;
      data['surname'] = controller2.text;
      data['country'] = controller3.text;
      // data['Interest'] = "{\"OMSId\":1}";
      data['Interest'] = controller4.text;
      data['Work form'] = controller5.text;
      final json = jsonEncode(data);
      channel.sink.add(json);
    }
  }
}
