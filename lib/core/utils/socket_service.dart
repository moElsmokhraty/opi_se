import 'package:flutter/material.dart';
import 'package:opi_se/core/cache/secure_storage_helper.dart';
import 'package:opi_se/core/utils/api_config/api_config.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;
import 'constants.dart';

class SocketService {
  static late io.Socket socket;

  static Future<void> connect() async {
    if (userCache != null) {
      try {
        await configureSocket();
        socket.connect();
        socket.onConnect((_) {
          debugPrint('Connected to socket');
          emit(
            eventName: 'joinUserRoom',
            data: {},
            ack: (data) {
              debugPrint('joinUserRoom ack: $data');
            },
          );
          if (userCache!.matchId != null) {
            emit(
              eventName: 'joinMatchRoom',
              data: {},
              ack: (data) {
                debugPrint('joinMatchRoom ack: $data');
              },
            );
          }
        });
        socket.onDisconnect((_) {
          socket.connect();
        });
      } catch (e) {
        debugPrint('Error connecting to socket: $e');
      }
    }
  }

  static void disconnect() {
    socket.dispose();
    socket.disconnect();
    socket.destroy();
  }

  static Future<void> configureSocket() async {
    String? token = await SecureStorage.getData(key: 'token');
    socket = io.io(
      APIConfig.baseUrl,
      <String, dynamic>{
        'transports': ['websocket'],
        'autoConnect': true,
        'autoReconnect': true,
        'query': {
          'userId': userCache?.id,
          'token': token,
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
      debugPrint('Error emitting event: $e');
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
      debugPrint('Error listening to event: $eventName  ----- $e');
    }
  }
}
