import 'package:flutter/cupertino.dart';
import 'package:jusst_echnologies_task/socket/socket.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class HomeScreenProvider extends ChangeNotifier{

  final channel = WebSocketChannel.connect(
    Uri.parse(SocketCall.Url),
  );
}