import 'package:opi_se/core/utils/api_config/api_config.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;
import 'constants.dart';

// ignore_for_file: avoid_print

class SocketService {
  static io.Socket? socket;

  static void connect() {
    try {
      socket = io.io(
        APIConfig.baseUrl,
        <String, dynamic>{
          'transports': ['websocket'],
          'autoConnect': true,
          'autoReconnect': true,
          'query': {
            'userId': userId,
            'matchId': matchId,
            'email': email,
            'fcmToken': fcmToken,
            'nationalId': nationalId,
            'token': token,
          },
        },
      );
      socket!.connect();
      socket!.onConnect((_) {
        print('Connected to socket');
        emit(
            eventName: 'joinUserRoom',
            data: {},
            ack: (data) {
              print('joinUserRoom ack: $data');
            });
      });
      socket!.onDisconnect((_) {
        disconnect();
        print('Disconnected from socket');
      });
    } catch (e) {
      print('Error connecting to socket: $e');
    }
  }

  static void disconnect() {
    socket!.dispose();
    socket!.disconnect();
  }

  static void emit({
    required String eventName,
    Map<String, dynamic>? data,
    Function? ack,
  }) {
    if (socket!.connected) {
      try {
        socket!.emitWithAck(eventName, data, ack: ack);
        print('Emitted event: $eventName');
      } catch (e) {
        print('Error emitting event: $e');
      }
    } else {
      connect();
      Future.delayed(const Duration(seconds: 2), () {
        socket!.emitWithAck(eventName, data, ack: ack);
      });
    }
  }

  static void on({
    required String eventName,
    void Function(Map<String, dynamic>)? handler,
  }) {
    if (socket!.connected) {
      socket!.on(eventName, (eventData) {
        handler!(eventData as Map<String, dynamic>);
      });
    } else {
      connect();
      Future.delayed(const Duration(seconds: 2), () {
        socket!.on(eventName, (eventData) {
          handler!(eventData as Map<String, dynamic>);
        });
      });
    }
  }
}
