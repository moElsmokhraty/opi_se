part of 'notifications_cubit.dart';

@immutable
abstract class NotificationsState {}

class NotificationsInitial extends NotificationsState {}

class GetNotificationsLoading extends NotificationsState {}

class GetNotificationsSuccess extends NotificationsState {
  final List<NotificationModel> notifications;

  GetNotificationsSuccess(this.notifications);
}

class GetNotificationsFailure extends NotificationsState {
  final Failure failure;

  GetNotificationsFailure(this.failure);
}
