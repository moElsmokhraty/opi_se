import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:opi_se/features/chat/domain/use_cases/upload_chat_images_use_case.dart';
import 'package:opi_se/features/mental_health/data/repo_impl/mental_health_repo_impl.dart';
import 'package:opi_se/features/mental_health/domain/repo/mental_health_repo.dart';
import 'package:opi_se/features/notes/data/repos_impl/notes_repo_impl.dart';
import 'package:opi_se/features/notes/domain/use_cases/get_notes_use_case.dart';
import 'package:opi_se/features/notes/domain/use_cases/get_trash_use_case.dart';
import 'package:opi_se/features/notes/domain/use_cases/pin_note_use_case.dart';
import 'package:opi_se/features/tasks/data/repo_impl/tasks_repo_impl.dart';
import 'package:opi_se/features/tasks/domain/use_cases/add_task_use_case.dart';
import '../../features/auth/data/repos_impl/mentor_auth_repo_impl.dart';
import '../../features/auth/domain/use_cases/edit_user_prefers_use_case.dart';
import '../../features/auth/domain/use_cases/get_user_profile_use_case.dart';
import '../../features/auth/domain/use_cases/mentor_login_use_case.dart';
import '../../features/chat/domain/use_cases/get_chat_media_use_case.dart';
import '../../features/home/data/repos_impl/profile_repo_impl.dart';
import '../../features/home/domain/use_cases/change_profile_image_use_case.dart';
import '../../features/home/domain/use_cases/delete_profile_image_use_case.dart';
import '../../features/home/domain/use_cases/get_notifications_use_case.dart';
import '../../features/home/domain/use_cases/get_partner_recommendations_use_case.dart';
import '../../features/home/domain/use_cases/get_profile_use_case.dart';
import '../../features/home/domain/use_cases/send_partner_request_use_case.dart';
import '../../features/mental_health/domain/use_cases/get_mental_support_use_case.dart';
import '../../features/notes/data/repos_impl/trash_repo_impl.dart';
import '../../features/notes/domain/use_cases/add_note_use_case.dart';
import '../../features/notes/domain/use_cases/delete_note_from_trash_use_case.dart';
import '../../features/notes/domain/use_cases/delete_note_use_case.dart';
import '../../features/notes/domain/use_cases/edit_note_use_case.dart';
import '../../features/notes/domain/use_cases/flush_trash_use_case.dart';
import '../../features/notes/domain/use_cases/restore_note_use_case.dart';
import '../../features/settings/data/repos_impl/settings_repo_impl.dart';
import '../../features/settings/domain/use_cases/edit_profile_use_case.dart';
import '../../features/tasks/domain/use_cases/delete_task_use_case.dart';
import '../../features/tasks/domain/use_cases/edit_task_use_case.dart';
import '../../features/tasks/domain/use_cases/get_specific_tasks_type_use_case.dart';
import 'api_config/api_config.dart';
import 'api_config/api_service.dart';
import '../../features/auth/data/repos_impl/auth_repo_impl.dart';
import '../../features/auth/domain/use_cases/change_password_use_case.dart';
import '../../features/auth/domain/use_cases/register_use_case.dart';
import '../../features/home/domain/use_cases/accept_match_request_use_case.dart';
import '../../features/auth/domain/use_cases/submit_user_prefers_use_case.dart';
import '../../features/chat/data/repos_impl/chat_repo_impl.dart';
import '../../features/chat/domain/use_cases/get_chat_use_case.dart';
import '../../features/home/data/repos_impl/match_requests_repo_impl.dart';
import '../../features/home/domain/use_cases/decline_match_request_use_case.dart';
import '../../features/home/domain/use_cases/get_match_requests_use_case.dart';
import '../../features/auth/domain/use_cases/forgot_password_use_case.dart';
import '../../features/auth/domain/use_cases/login_use_case.dart';
import '../../features/auth/domain/use_cases/upload_national_id_use_case.dart';
import '../../features/auth/domain/use_cases/verify_account_use_case.dart';

final GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(
        BaseOptions(
          baseUrl: APIConfig.baseUrl,
          connectTimeout: const Duration(seconds: 60),
          receiveTimeout: const Duration(seconds: 60),
          sendTimeout: const Duration(seconds: 60),
          receiveDataWhenStatusError: true,
        ),
      ),
    ),
  );

  getIt.registerSingleton<AuthRepoImpl>(
    AuthRepoImpl(getIt.get<ApiService>()),
  );

  getIt.registerSingleton<LoginUseCase>(
    LoginUseCase(getIt.get<AuthRepoImpl>()),
  );

  getIt.registerSingleton<RegisterUseCase>(
    RegisterUseCase(getIt.get<AuthRepoImpl>()),
  );

  getIt.registerSingleton<UploadNationalIdUseCase>(
    UploadNationalIdUseCase(getIt.get<AuthRepoImpl>()),
  );

  getIt.registerSingleton<ChangePasswordUseCase>(
    ChangePasswordUseCase(getIt.get<AuthRepoImpl>()),
  );

  getIt.registerSingleton<ForgotPasswordUseCase>(
    ForgotPasswordUseCase(getIt.get<AuthRepoImpl>()),
  );

  getIt.registerSingleton<VerifyAccountUseCase>(
    VerifyAccountUseCase(getIt.get<AuthRepoImpl>()),
  );

  getIt.registerSingleton<SubmitUserPrefersUseCase>(
    SubmitUserPrefersUseCase(getIt.get<AuthRepoImpl>()),
  );

  getIt.registerSingleton<EditUserPrefersUseCase>(
    EditUserPrefersUseCase(getIt.get<AuthRepoImpl>()),
  );
  getIt.registerSingleton<GetUserProfileUseCase>(
    GetUserProfileUseCase(getIt.get<AuthRepoImpl>()),
  );

  getIt.registerSingleton<ChatRepoImpl>(ChatRepoImpl(getIt.get<ApiService>()));

  getIt.registerSingleton<GetChatUseCase>(
    GetChatUseCase(getIt.get<ChatRepoImpl>()),
  );

  getIt.registerSingleton<RequestsRepoImpl>(
    RequestsRepoImpl(getIt.get<ApiService>()),
  );

  getIt.registerSingleton<GetMatchRequestsUseCase>(
    GetMatchRequestsUseCase(getIt.get<RequestsRepoImpl>()),
  );

  getIt.registerSingleton<DeclineMatchRequestUseCase>(
    DeclineMatchRequestUseCase(getIt.get<RequestsRepoImpl>()),
  );

  getIt.registerSingleton<AcceptMatchRequestsUseCase>(
    AcceptMatchRequestsUseCase(getIt.get<RequestsRepoImpl>()),
  );

  getIt.registerSingleton<GetProfileUseCase>(
    GetProfileUseCase(getIt.get<RequestsRepoImpl>()),
  );

  getIt.registerSingleton<NotesRepoImpl>(
    NotesRepoImpl(getIt.get<ApiService>()),
  );

  getIt.registerSingleton<GetNotesUseCase>(
    GetNotesUseCase(getIt.get<NotesRepoImpl>()),
  );

  getIt.registerSingleton<AddNoteUseCase>(
    AddNoteUseCase(getIt.get<NotesRepoImpl>()),
  );

  getIt.registerSingleton<PinNoteUseCase>(
    PinNoteUseCase(getIt.get<NotesRepoImpl>()),
  );

  getIt.registerSingleton<DeleteNoteUseCase>(
    DeleteNoteUseCase(getIt.get<NotesRepoImpl>()),
  );

  getIt.registerSingleton<EditNoteUseCase>(
    EditNoteUseCase(getIt.get<NotesRepoImpl>()),
  );

  getIt.registerSingleton<TrashRepoImpl>(
    TrashRepoImpl(getIt.get<ApiService>()),
  );

  getIt.registerSingleton<GetTrashUseCase>(
    GetTrashUseCase(getIt.get<TrashRepoImpl>()),
  );

  getIt.registerSingleton<FlushTrashUseCase>(
    FlushTrashUseCase(getIt.get<TrashRepoImpl>()),
  );

  getIt.registerSingleton<DeleteNoteFromTrashUseCase>(
    DeleteNoteFromTrashUseCase(getIt.get<TrashRepoImpl>()),
  );

  getIt.registerSingleton<RestoreNoteUseCase>(
    RestoreNoteUseCase(getIt.get<NotesRepoImpl>()),
  );

  getIt.registerSingleton<GetPartnerRecommendationsUseCase>(
    GetPartnerRecommendationsUseCase(getIt.get<RequestsRepoImpl>()),
  );

  getIt.registerSingleton<SendPartnerRequestsUseCase>(
    SendPartnerRequestsUseCase(getIt.get<RequestsRepoImpl>()),
  );

  getIt.registerSingleton<SettingsRepoImpl>(
    SettingsRepoImpl(getIt.get<ApiService>()),
  );

  getIt.registerSingleton<EditProfileUseCase>(
    EditProfileUseCase(getIt.get<SettingsRepoImpl>()),
  );

  getIt.registerSingleton<ProfileRepoImpl>(
    ProfileRepoImpl(getIt.get<ApiService>()),
  );

  getIt.registerSingleton<DeleteProfileImageUseCase>(
    DeleteProfileImageUseCase(getIt.get<ProfileRepoImpl>()),
  );

  getIt.registerSingleton<ChangeProfileImageUseCase>(
    ChangeProfileImageUseCase(getIt.get<ProfileRepoImpl>()),
  );

  getIt.registerSingleton<MentalHealthRepo>(
    MentalHealthRepoImpl(),
  );

  getIt.registerSingleton<GetMentalSupportUseCase>(
    GetMentalSupportUseCase(getIt.get<MentalHealthRepo>()),
  );

  getIt.registerSingleton<GetChatMediaUseCase>(
    GetChatMediaUseCase(getIt.get<ChatRepoImpl>()),
  );

  getIt.registerSingleton<TasksRepoImpl>(
    TasksRepoImpl(getIt.get<ApiService>()),
  );

  getIt.registerSingleton<AddTaskUseCase>(
    AddTaskUseCase(getIt.get<TasksRepoImpl>()),
  );

  getIt.registerSingleton<GetSpecificTasksTypeUseCase>(
    GetSpecificTasksTypeUseCase(getIt.get<TasksRepoImpl>()),
  );

  getIt.registerSingleton<EditTaskUseCase>(
    EditTaskUseCase(getIt.get<TasksRepoImpl>()),
  );

  getIt.registerSingleton<DeleteTaskUseCase>(
    DeleteTaskUseCase(getIt.get<TasksRepoImpl>()),
  );

  getIt.registerSingleton<UploadChatImagesUseCase>(
    UploadChatImagesUseCase(getIt.get<ChatRepoImpl>()),
  );

  getIt.registerSingleton<GetNotificationsUseCase>(
    GetNotificationsUseCase(getIt.get<ProfileRepoImpl>()),
  );

  getIt.registerSingleton<MentorAuthRepoImpl>(
    MentorAuthRepoImpl(getIt.get<ApiService>()),
  );
  getIt.registerSingleton<MentorLoginUseCase>(
    MentorLoginUseCase(getIt.get<MentorAuthRepoImpl>()),
  );
}
