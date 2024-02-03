import 'package:equatable/equatable.dart';

class DeleteNoteResponse extends Equatable {
  final String? message;

  const DeleteNoteResponse({this.message});

  factory DeleteNoteResponse.fromJson(Map<String, dynamic> json) {
    return DeleteNoteResponse(
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
      };

  @override
  List<Object?> get props => [message];
}
