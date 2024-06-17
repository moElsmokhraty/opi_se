import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:opi_se/core/utils/constants.dart';
import 'package:opi_se/core/utils/socket_service.dart';

part 'call_state.dart';

class CallCubit extends Cubit<CallState> {
  RTCPeerConnection? peerConnection;

  CallCubit() : super(CallInitial());

  Future<void> initializeMedia({required bool isVideo}) async {
    try {
      final localStream = await navigator.mediaDevices.getUserMedia({
        'video': isVideo,
        'audio': true,
      });
      emit(state.copyWith(localStream: localStream));
    } catch (error) {
      debugPrint('Error: $error');
    }
  }

  void callUser(String userToCallId) async {
    final localStream = state.localStream;
    if (localStream == null) return;

    final peer = await _createPeerConnection();
    peer?.addStream(localStream);

    peer?.onAddStream = (MediaStream stream) {
      emit(state.copyWith(remoteStream: stream));
    };

    peer?.onIceCandidate = (RTCIceCandidate candidate) {
      SocketService.emit(eventName: 'signal', data: {
        'userToCall': userToCallId,
        'signalData': {
          'candidate': candidate.toMap(),
        },
      });
    };

    peer?.onIceConnectionState = (RTCIceConnectionState state) {
      if (state == RTCIceConnectionState.RTCIceConnectionStateDisconnected) {
        emit(this.state.copyWith(isCallEnded: true));
      }
    };

    SocketService.emit(eventName: 'callUser', data: {
      'userToCall': userToCallId,
      'from': userCache?.id,
      'signalData': await peer?.createOffer(),
    });

    emit(state.copyWith(isCalling: true));
    peerConnection = peer;
  }

  void answerCall(Map<String, dynamic> signal) async {
    final localStream = state.localStream;
    if (localStream == null) return;

    final peer = await _createPeerConnection();
    peer?.addStream(localStream);

    peer?.onAddStream = (MediaStream stream) {
      emit(state.copyWith(remoteStream: stream));
    };

    peer?.onIceCandidate = (RTCIceCandidate candidate) {
      SocketService.emit(eventName: 'signal', data: {
        'userToCall': 'caller-id', // Replace with the caller's ID
        'signalData': {
          'candidate': candidate.toMap(),
        },
      });
    };

    peer?.onIceConnectionState = (RTCIceConnectionState state) {
      if (state == RTCIceConnectionState.RTCIceConnectionStateDisconnected) {
        emit(this.state.copyWith(isCallEnded: true));
      }
    };

    peer?.setRemoteDescription(RTCSessionDescription(
      signal['sdp'],
      signal['type'],
    ));

    peerConnection = peer;
    emit(state.copyWith(isCallAccepted: true));
  }

  Future<RTCPeerConnection?> _createPeerConnection() async {
    final config = {
      'iceServers': [
        {'url': 'stun:stun.l.google.com:19302'},
      ],
    };
    return await createPeerConnection(config);
  }

  void endCall() {
    peerConnection?.close();
    emit(state.copyWith(isCallEnded: true));
  }
}
