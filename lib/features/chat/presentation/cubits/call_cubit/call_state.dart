part of 'call_cubit.dart';

class CallState extends Equatable {
  final MediaStream? localStream;
  final MediaStream? remoteStream;
  final bool isCalling;
  final bool isCallAccepted;
  final bool isCallEnded;

  const CallState({
    this.localStream,
    this.remoteStream,
    this.isCalling = false,
    this.isCallAccepted = false,
    this.isCallEnded = false,
  });

  CallState copyWith({
    MediaStream? localStream,
    MediaStream? remoteStream,
    bool? isCalling,
    bool? isCallAccepted,
    bool? isCallEnded,
  }) {
    return CallState(
      localStream: localStream ?? this.localStream,
      remoteStream: remoteStream ?? this.remoteStream,
      isCalling: isCalling ?? this.isCalling,
      isCallAccepted: isCallAccepted ?? this.isCallAccepted,
      isCallEnded: isCallEnded ?? this.isCallEnded,
    );
  }

  @override
  List<Object?> get props => [
        localStream,
        remoteStream,
        isCalling,
        isCallAccepted,
        isCallEnded,
      ];
}

class CallInitial extends CallState {}
