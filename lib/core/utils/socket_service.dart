import 'package:opi_se/core/utils/api_config/api_config.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;
import 'constants.dart';

// ignore_for_file: avoid_print

class SocketService {
  static late io.Socket socket;

  static void connect() {
    if (userCache != null) {
      try {
        configureSocket();
        socket.connect();
        socket.onConnect((_) {
          print('Connected to socket');
          emit(
            eventName: 'joinUserRoom',
            data: {},
            ack: (data) {
              print('joinUserRoom ack: $data');
            },
          );
          if (userCache!.matchId != null) {
            emit(
                eventName: 'joinMatchRoom',
                data: {},
                ack: (data) {
                  print('joinMatchRoom ack: $data');
                });
          }
        });
        socket.onDisconnect((_) {
          socket.connect();
        });
      } catch (e) {
        print('Error connecting to socket: $e');
      }
    }
  }

  static void disconnect() {
    socket.dispose();
    socket.disconnect();
    socket.destroy();
  }

  static void configureSocket() {
    socket = io.io(
      APIConfig.baseUrl,
      <String, dynamic>{
        'transports': ['websocket'],
        'autoConnect': true,
        'autoReconnect': true,
        'query': {
          'userId': userCache?.id,
          'token': userCache?.token,
          'roomId': userCache?.id,
          if (userCache?.matchId != null) 'matchId': userCache?.matchId,
        },
      },
    );
  }

  static void emit({
    required String eventName,
    Map<String, dynamic>? data,
    Function? ack,
  }) {
    if (socket.connected == false) connect();
    try {
      socket.emitWithAck(eventName, data, ack: ack);
    } catch (e) {
      print('Error emitting event: $e');
    }
  }

  static void on({
    required String eventName,
    Function(dynamic)? handler,
  }) {
    try {
      socket.on(eventName, (data) {
        handler!(data as dynamic);
      });
    } catch (e) {
      print('Error listening to event: $eventName  ----- $e');
    }
  }
}
