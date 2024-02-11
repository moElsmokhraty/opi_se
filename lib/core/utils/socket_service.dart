import 'package:opi_se/core/utils/api_config/api_config.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;
import 'constants.dart';

// ignore_for_file: avoid_print

class SocketService {
  static late io.Socket socket;

  static void connect() {
    try {
      configureSocket();
      socket.connect();
      socket.onConnect((_) {
        print('Connected to socket');
        if (userCache != null) {
          emit(
            eventName: 'joinUserRoom',
            data: {},
            ack: (data) {
              print('joinUserRoom ack: $data');
            },
          );
        }
      });
      socket.onDisconnect((_) {
        disconnect();
        print('Disconnected from socket');
      });
    } catch (e) {
      print('Error connecting to socket: $e');
    }
  }

  static void disconnect() {
    socket.dispose();
    socket.disconnect();
  }

  static void configureSocket() {
    socket = io.io(
      APIConfig.baseUrl,
      <String, dynamic>{
        'transports': ['websocket'],
        'autoConnect': true,
        'autoReconnect': true,
        'query': {
          //'userId': userCache?.id,
          'matchId': userCache?.matchId,
          // 'email': userCache?.email,
          // 'fcmToken': userCache?.fcmToken,
          // 'nationalId': userCache?.nationalId,
          'token': userCache?.token,
        },
      },
    );
  }

  static void emit({
    required String eventName,
    Map<String, dynamic>? data,
    Function? ack,
  }) {
    try {
      socket.emitWithAck(eventName, data, ack: ack);
    } catch (e) {
      print('Error emitting event: $e');
    }
  }

  static void on({
    required String eventName,
    void Function(Map<String, dynamic>)? handler,
  }) {
    try {
      socket.on(eventName, (eventData) {
        handler!(eventData as Map<String, dynamic>);
      });
    } catch (e) {
      print('Error listening to event: $e');
    }
  }
}
