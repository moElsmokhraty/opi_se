import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:opi_se/core/errors/failure.dart';
import '../../../domain/use_cases/get_notifications_use_case.dart';
import '../../../data/models/get_notifications_response/notification.dart';

part 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit(
    this._getNotificationsUseCase,
  ) : super(NotificationsInitial());

  final GetNotificationsUseCase _getNotificationsUseCase;

  List<NotificationModel> notifications = [];

  Future<void> getNotifications({
    int page = 1,
    int limit = 10,
  }) async {
    emit(GetNotificationsLoading());
    final result = await _getNotificationsUseCase.call({
      'page': page,
      'limit': limit,
    });
    result.fold(
      (failure) => emit(GetNotificationsFailure(failure)),
      (response) {
        notifications.addAll(response.data?.first.notifications ?? []);
        emit(GetNotificationsSuccess(response.data?.first.notifications ?? []));
      },
    );
  }
}
