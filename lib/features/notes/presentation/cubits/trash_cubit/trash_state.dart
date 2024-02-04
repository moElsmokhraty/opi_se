part of 'trash_cubit.dart';

@immutable
abstract class TrashState {}

class TrashInitial extends TrashState {}

class GetTrashLoading extends TrashState {}

class GetTrashSuccess extends TrashState {
  final GetTrashResponse response;

  GetTrashSuccess({required this.response});
}

class GetTrashFailure extends TrashState {
  final Failure failure;

  GetTrashFailure({required this.failure});
}
