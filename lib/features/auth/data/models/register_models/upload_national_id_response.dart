import 'package:equatable/equatable.dart';

class UploadNationalIdResponse extends Equatable {
  final String? nationalId;
  final bool? status;
  final String? message;

  const UploadNationalIdResponse({this.nationalId, this.status, this.message});

  factory UploadNationalIdResponse.fromJson(Map<String, dynamic> json) {
    return UploadNationalIdResponse(
      nationalId: json['nationalId'] as String?,
      status: json['status'] as bool?,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'nationalId': nationalId,
        'status': status,
        'message': message,
      };

  @override
  List<Object?> get props => [nationalId, status, message];
}
