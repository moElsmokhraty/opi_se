import 'package:opi_se/core/utils/api_config/api_config.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class SocketService {
  static io.Socket? socket;

  static void connect() {
    try {
      socket = io.io(
        APIConfig.baseUrl,
        <String, dynamic>{
          'transports': ['websocket'],
          'autoConnect': false,
        },
      );
      socket!.connect();
      socket!.onConnect((_) {
        print('Connected to socket');
        socket!.emit('joinMatchRoom', {'matchId': '657864d6b9aeadd65b0d92b9'});
      });
    } catch (e) {
      print('Error connecting to socket: $e');
    }
  }

  static void disconnect() {
    socket!.disconnect();
  }

  static void emitEvent(
    String eventName,
    Map<String, dynamic>? data,
  ) {
    if (socket!.connected) {
      try {
        socket!.emit(eventName, data);
      } catch (e) {
        print('Error emitting event: $e');
      }
    } else {
      print('Socket is not connected');
    }
  }

  static void listenOnEvent(
    String eventName,
    void Function(Map<String, dynamic>) handler,
  ) {
    socket!.on(eventName, (eventData) {
      handler(eventData as Map<String, dynamic>);
    });
  }
}
