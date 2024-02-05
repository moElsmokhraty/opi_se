class DeleteNoteFromTrashResponse {
  final String? message;

  DeleteNoteFromTrashResponse({this.message});

  factory DeleteNoteFromTrashResponse.fromJson(Map<String, dynamic> json) {
    return DeleteNoteFromTrashResponse(
      message: json['message'],
    );
  }
}
