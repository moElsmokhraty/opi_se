part of 'verify_account_cubit.dart';

@immutable
abstract class VerifyAccountState {}

class VerifyAccountInitial extends VerifyAccountState {}

class VerifyAccountLoading extends VerifyAccountState {}

class VerifyAccountSuccess extends VerifyAccountState {
  final VerifyAccountResponse response;

  VerifyAccountSuccess(this.response);
}

class VerifyAccountFailure extends VerifyAccountState {
  final String errMessage;

  VerifyAccountFailure(this.errMessage);
}
