import 'package:equatable/equatable.dart';

class FlushTrashResponse extends Equatable {
  final String? message;

  const FlushTrashResponse({this.message});

  factory FlushTrashResponse.fromJson(Map<String, dynamic> json) {
    return FlushTrashResponse(
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
      };

  @override
  List<Object?> get props => [message];
}
