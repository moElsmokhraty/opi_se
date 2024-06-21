import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:opi_se/core/utils/routes_config/routes_config.dart';
import 'package:opi_se/core/utils/service_locator.dart';
import 'package:opi_se/core/widgets/home_layout.dart';
import 'package:opi_se/features/auth/domain/use_cases/change_password_use_case.dart';
import 'package:opi_se/features/auth/domain/use_cases/login_use_case.dart';
import 'package:opi_se/features/auth/presentation/cubits/change_password_cubit/change_password_cubit.dart';
import 'package:opi_se/features/auth/presentation/cubits/user_prefers_cubit/user_prefers_cubit.dart';
import 'package:opi_se/features/onboarding/presentation/views/auth_options_view/auth_options_view.dart';
import 'package:opi_se/features/auth/presentation/views/change_password_views/change_password_view.dart';
import 'package:opi_se/features/auth/presentation/views/forgot_password_view/forget_password_view.dart';
import 'package:opi_se/features/auth/presentation/views/login_view/login_view.dart';
import 'package:opi_se/features/auth/presentation/views/register_views/first_register_view.dart';
import 'package:opi_se/features/auth/presentation/views/register_views/map_view.dart';
import 'package:opi_se/features/auth/presentation/views/user_prefers_view/user_prefers_view.dart';
import 'package:opi_se/features/auth/presentation/views/verify_account_view/verify_account_view.dart';
import 'package:opi_se/features/chat/presentation/views/call_view/call_view.dart';
import 'package:opi_se/features/chat/presentation/views/chat_media_view/chat_media_view.dart';
import 'package:opi_se/features/chat/presentation/views/chat_view/chat_view.dart';
import 'package:opi_se/features/dashboard/presentation/views/dashboard_view/dashboard_view.dart';
import 'package:opi_se/features/home/data/models/requests_models/get_match_requests_response/partner_request.dart';
import 'package:opi_se/features/home/domain/use_cases/get_notifications_use_case.dart';
import 'package:opi_se/features/home/presentation/cubits/match_requests_cubit/match_requests_cubit.dart';
import 'package:opi_se/features/home/presentation/cubits/partner_recommendations_cubit/partner_recommendations_cubit.dart';
import 'package:opi_se/features/home/presentation/views/home_view/home_view.dart';
import 'package:opi_se/features/home/presentation/views/partner_request_profile_view/partner_request_view.dart';
import 'package:opi_se/features/home/presentation/views/profile_view/profile_view.dart';
import 'package:opi_se/features/notes/presentation/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:opi_se/features/notes/presentation/views/add_note_view/add_note_view.dart';
import 'package:opi_se/features/notes/presentation/views/edit_note_view/edit_note_view.dart';
import 'package:opi_se/features/notes/presentation/views/notes_view/notes_view.dart';
import 'package:opi_se/features/settings/presentation/cubits/edit_profile_cubit.dart';
import 'package:opi_se/features/settings/presentation/views/edit_profile_view/edit_profile_view.dart';
import 'package:opi_se/features/tasks/data/models/task.dart';
import 'package:opi_se/features/tasks/domain/use_cases/add_task_use_case.dart';
import 'package:opi_se/features/tasks/presentation/cubits/add_task_cubit/add_task_cubit.dart';
import 'package:opi_se/features/tasks/presentation/views/add_task_view/add_task_view.dart';
import '../../../features/auth/domain/use_cases/forgot_password_use_case.dart';
import '../../../features/auth/domain/use_cases/get_user_profile_use_case.dart';
import '../../../features/auth/domain/use_cases/register_use_case.dart';
import '../../../features/auth/domain/use_cases/submit_user_prefers_use_case.dart';
import '../../../features/auth/domain/use_cases/verify_account_use_case.dart';
import '../../../features/auth/presentation/cubits/forgot_password_cubit/forgot_password_cubit.dart';
import '../../../features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import '../../../features/auth/presentation/cubits/mentor_login_otp_cubit/mentor_login_otp_cubit.dart';
import '../../../features/auth/presentation/cubits/mentor_login_cubit/mentor_login_cubit.dart';
import '../../../features/auth/presentation/cubits/mentor_prefers_cubit/mentor_prefers_cubit.dart';
import '../../../features/auth/presentation/cubits/mentor_register/mentor_register_cubit.dart';
import '../../../features/auth/presentation/cubits/register_cubit/register_cubit.dart';
import '../../../features/auth/presentation/cubits/verify_account_cubit/verify_account_cubit.dart';
import '../../../features/auth/presentation/views/change_password_views/successful_change_view.dart';
import '../../../features/auth/presentation/views/manage_profile_view/manage_profile_view.dart';
import '../../../features/auth/presentation/views/mentor_login_otp_view/mentor_login_otp_view.dart';
import '../../../features/auth/presentation/views/mentor_login_view/mentor_login_view.dart';
import '../../../features/auth/presentation/views/mentor_prefers_view/mentor_prefers_view.dart';
import '../../../features/auth/presentation/views/mentor_register_views/mentor_first_register_view.dart';
import '../../../features/auth/presentation/views/mentor_register_views/mentor_second_register_view.dart';
import '../../../features/auth/presentation/views/register_views/second_register_view.dart';
import '../../../features/chat/domain/use_cases/get_chat_media_use_case.dart';
import '../../../features/chat/domain/use_cases/get_chat_use_case.dart';
import '../../../features/chat/domain/use_cases/upload_chat_images_use_case.dart';
import '../../../features/chat/presentation/cubits/chat_cubit/chat_cubit.dart';
import '../../../features/chat/presentation/cubits/chat_media_cubit/chat_media_cubit.dart';
import '../../../features/home/domain/use_cases/accept_match_request_use_case.dart';
import '../../../features/home/domain/use_cases/change_profile_image_use_case.dart';
import '../../../features/home/domain/use_cases/decline_match_request_use_case.dart';
import '../../../features/home/domain/use_cases/delete_profile_image_use_case.dart';
import '../../../features/home/domain/use_cases/get_match_requests_use_case.dart';
import '../../../features/home/domain/use_cases/get_partner_recommendations_use_case.dart';
import '../../../features/home/domain/use_cases/get_profile_use_case.dart';
import '../../../features/home/domain/use_cases/send_partner_request_use_case.dart';
import '../../../features/home/presentation/cubits/notifications_cubit/notifications_cubit.dart';
import '../../../features/home/presentation/cubits/profile_cubit/profile_cubit.dart';
import '../../../features/home/presentation/views/create_quiz_view/create_quiz_view.dart';
import '../../../features/home/presentation/views/mentor_create_task_view/mentor_create_task_view.dart';
import '../../../features/home/presentation/views/notifications_view/notifications_view.dart';
import '../../../features/home/presentation/views/quiz_settings_view/quiz_settings_view.dart';
import '../../../features/home/presentation/views/requests_view/requests_view.dart';
import '../../../features/home/presentation/views/task_settings_view/task_settings_view.dart';
import '../../../features/notes/data/models/get_all_notes_response/note.dart';
import '../../../features/notes/domain/use_cases/add_note_use_case.dart';
import '../../../features/notes/domain/use_cases/delete_note_from_trash_use_case.dart';
import '../../../features/notes/domain/use_cases/edit_note_use_case.dart';
import '../../../features/notes/domain/use_cases/flush_trash_use_case.dart';
import '../../../features/notes/domain/use_cases/get_trash_use_case.dart';
import '../../../features/notes/domain/use_cases/restore_note_use_case.dart';
import '../../../features/notes/presentation/cubits/edit_note_cubit/edit_note_cubit.dart';
import '../../../features/notes/presentation/cubits/trash_cubit/trash_cubit.dart';
import '../../../features/notes/presentation/views/trash_view/trash_view.dart';
import '../../../features/onboarding/presentation/cubits/onboarding_cubit/onboarding_cubit.dart';
import '../../../features/onboarding/presentation/views/get_started_view/get_started_view.dart';
import '../../../features/onboarding/presentation/views/on_boarding_view/on_boarding_view.dart';
import '../../../features/settings/domain/use_cases/edit_profile_use_case.dart';
import '../../../features/tasks/domain/use_cases/edit_task_use_case.dart';
import '../../../features/tasks/presentation/cubits/edit_task_cubit/edit_task_cubit.dart';
import '../../../features/tasks/presentation/views/edit_task_view/edit_task_view.dart';
import '../../widgets/mentor_home_layout.dart';
import '../constants.dart';

abstract class AppRouter {
  static String getInitialRoute() {
    if (userCache == null) {
      return RoutesConfig.getStarted;
    } else {
      if (userCache!.getUserPrefers == true) {
        return RoutesConfig.userPrefers;
      } else {
        return RoutesConfig.homeLayout;
      }
    }
  }

  static final GoRouter router = GoRouter(
    initialLocation: RoutesConfig.mentorCreateTask,
    routes: [
      GoRoute(
        path: RoutesConfig.getStarted,
        builder: (context, state) => const GetStartedView(),
      ),
      GoRoute(
        path: RoutesConfig.onBoarding,
        builder: (context, state) => BlocProvider(
          create: (context) => OnboardingCubit(),
          child: const OnBoardingView(),
        ),
      ),
      GoRoute(
        path: RoutesConfig.authOptions,
        builder: (context, state) => const AuthOptionsView(),
      ),
      GoRoute(
        path: RoutesConfig.login,
        builder: (context, state) => BlocProvider(
          create: (context) => LoginCubit(getIt.get<LoginUseCase>()),
          child: LoginView(hasBackButton: state.extra as bool? ?? true),
        ),
      ),
      GoRoute(
        path: RoutesConfig.firstRegister,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => RegisterCubit(getIt.get<RegisterUseCase>()),
            child: const FirstRegisterView(),
          );
        },
      ),
      GoRoute(
        path: RoutesConfig.secondRegister,
        builder: (context, state) {
          return BlocProvider.value(
            value: state.extra as RegisterCubit,
            child: const SecondRegisterView(),
          );
        },
      ),
      GoRoute(
        path: RoutesConfig.map,
        builder: (context, state) {
          return const MapView();
        },
      ),
      GoRoute(
        path: RoutesConfig.userPrefers,
        builder: (context, state) => BlocProvider(
          create: (context) => UserPrefersCubit(
            getIt.get<SubmitUserPrefersUseCase>(),
          ),
          child: const UserPrefersView(),
        ),
      ),
      GoRoute(
        path: RoutesConfig.changePassword,
        builder: (context, state) => BlocProvider(
          create: (context) => ChangePasswordCubit(
            getIt.get<ChangePasswordUseCase>(),
          ),
          child: const ChangePasswordView(),
        ),
      ),
      GoRoute(
        path: RoutesConfig.successfulChange,
        builder: (context, state) {
          return const SuccessfulChangeView();
        },
      ),
      GoRoute(
        path: RoutesConfig.forgotPassword,
        builder: (context, state) => BlocProvider(
          create: (context) => ForgotPasswordCubit(
            getIt.get<ForgotPasswordUseCase>(),
          ),
          child: const ForgotPasswordView(),
        ),
      ),
      GoRoute(
        path: RoutesConfig.verifyAccount,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => VerifyAccountCubit(
              getIt.get<VerifyAccountUseCase>(),
            ),
            child: VerifyAccountView(email: state.extra as String),
          );
        },
      ),
      GoRoute(
        path: RoutesConfig.editProfile,
        builder: (context, state) => BlocProvider(
          create: (context) => EditProfileCubit(
            getIt.get<EditProfileUseCase>(),
          ),
          child: const EditProfileView(),
        ),
      ),
      GoRoute(
        path: RoutesConfig.profile,
        builder: (context, state) => BlocProvider(
          create: (context) => ProfileCubit(
            getIt.get<GetUserProfileUseCase>(),
            getIt.get<DeleteProfileImageUseCase>(),
            getIt.get<ChangeProfileImageUseCase>(),
          )..getUserProfile(),
          child: const ProfileView(),
        ),
      ),
      GoRoute(
        path: RoutesConfig.homeLayout,
        builder: (context, state) => const HomeLayout(),
      ),
      GoRoute(
        path: RoutesConfig.home,
        builder: (context, state) => BlocProvider(
          create: (context) => PartnerRecommendationsCubit(
            getIt.get<GetPartnerRecommendationsUseCase>(),
            getIt.get<SendPartnerRequestsUseCase>(),
          )..getPartnerRecommendations(),
          child: const HomeView(),
        ),
      ),
      GoRoute(
        path: RoutesConfig.chat,
        builder: (context, state) => BlocProvider(
          create: (context) => ChatCubit(
            getIt.get<GetChatUseCase>(),
            getIt.get<UploadChatImagesUseCase>(),
          )
            ..getChat(page: 1, limit: 20)
            ..listenOnNewMessage()
            ..listenOnMessageDeleted()
            ..listenOnChatSessionRequest(context)
            ..listenOnReplyToSessionRequest(context)
            ..listenOnMatchRequestApproved(),
          child: const ChatView(),
        ),
      ),
      GoRoute(
        path: RoutesConfig.chatMedia,
        builder: (context, state) => BlocProvider(
          create: (context) => ChatMediaCubit(
            getIt.get<GetChatMediaUseCase>(),
          )..getChatMedia(page: 1, limit: 10),
          child: const ChatMediaView(),
        ),
      ),
      GoRoute(
        path: RoutesConfig.call,
        builder: (context, state) => const CallView(),
      ),
      GoRoute(
        path: RoutesConfig.requests,
        builder: (context, state) => BlocProvider(
          create: (context) => MatchRequestsCubit(
            getIt.get<GetMatchRequestsUseCase>(),
            getIt.get<DeclineMatchRequestUseCase>(),
            getIt.get<AcceptMatchRequestsUseCase>(),
            getIt.get<GetProfileUseCase>(),
          )..getMatchRequests(),
          child: const RequestsView(),
        ),
      ),
      GoRoute(
        path: RoutesConfig.partnerRequestProfile,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => MatchRequestsCubit(
              getIt.get<GetMatchRequestsUseCase>(),
              getIt.get<DeclineMatchRequestUseCase>(),
              getIt.get<AcceptMatchRequestsUseCase>(),
              getIt.get<GetProfileUseCase>(),
            )..getProfile((state.extra as PartnerRequest).partnerId ?? ''),
            child: PartnerRequestView(
              requestId: (state.extra as PartnerRequest).id ?? '',
            ),
          );
        },
      ),
      GoRoute(
        path: RoutesConfig.notes,
        builder: (context, state) => const NotesView(),
      ),
      GoRoute(
        path: RoutesConfig.addNote,
        builder: (context, state) => BlocProvider(
          create: (context) => AddNoteCubit(getIt.get<AddNoteUseCase>()),
          child: const AddNoteView(),
        ),
      ),
      GoRoute(
        path: RoutesConfig.editNote,
        builder: (context, state) => BlocProvider(
          create: (context) => EditNoteCubit(
            getIt.get<EditNoteUseCase>(),
          )..setInitialValues(state.extra as Note),
          child: const EditNoteView(),
        ),
      ),
      GoRoute(
        path: RoutesConfig.trash,
        builder: (context, state) => BlocProvider(
          create: (context) => TrashCubit(
            getIt.get<GetTrashUseCase>(),
            getIt.get<FlushTrashUseCase>(),
            getIt.get<DeleteNoteFromTrashUseCase>(),
            getIt.get<RestoreNoteUseCase>(),
          )..getTrash(page: 1, limit: 10),
          child: const TrashView(),
        ),
      ),
      GoRoute(
        path: RoutesConfig.dashboard,
        builder: (context, state) => const DashboardView(),
      ),
      GoRoute(
        path: RoutesConfig.manageProfile,
        builder: (context, state) => const ManageProfileView(),
      ),
      GoRoute(
        path: RoutesConfig.addTask,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => AddTaskCubit(getIt.get<AddTaskUseCase>()),
            child: const AddTaskView(),
          );
        },
      ),
      GoRoute(
        path: RoutesConfig.editTask,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => EditTaskCubit(
              getIt.get<EditTaskUseCase>(),
            )..setValues(state.extra as Task),
            child: const EditTaskView(),
          );
        },
      ),
      GoRoute(
        path: RoutesConfig.notifications,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => NotificationsCubit(
              getIt.get<GetNotificationsUseCase>(),
            )..getNotifications(),
            child: const NotificationsView(),
          );
        },
      ),
      GoRoute(
        path: RoutesConfig.mentorLogin,
        builder: (context, state) => BlocProvider(
          create: (context) => MentorLoginCubit(),
          child: const MentorLoginView(),
        ),
      ),
      GoRoute(
        path: RoutesConfig.mentorLoginOtp,
        builder: (context, state) => BlocProvider(
          create: (context) => MentorLoginOtpCubit(),
          child: const MentorLoginOtpView(),
        ),
      ),
      GoRoute(
        path: RoutesConfig.mentorFirstRegister,
        builder: (context, state) => BlocProvider(
          create: (context) => MentorRegisterCubit(),
          child: const MentorFirstRegisterView(),
        ),
      ),
      GoRoute(
        path: RoutesConfig.mentorSecondRegister,
        builder: (context, state) {
          return BlocProvider.value(
            value: state.extra as MentorRegisterCubit,
            child: const MentorSecondRegisterView(),
          );
        },
      ),
      GoRoute(
        path: RoutesConfig.mentorPrefers,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => MentorPrefersCubit(),
            child: const MentorPrefersView(),
          );
        },
      ),
      GoRoute(
        path: RoutesConfig.mentorHomeLayout,
        builder: (context, state) => const MentorHomeLayout(),
      ),
      GoRoute(
        path: RoutesConfig.quizSettings,
        builder: (context, state) => const QuizSettingsView(),
      ),
      GoRoute(
        path: RoutesConfig.taskSettings,
        builder: (context, state) => const TaskSettingsView(),
      ),
      GoRoute(
        path: RoutesConfig.createQuiz,
        builder: (context, state) => const CreateQuizView(),
      ),
      GoRoute(
        path: RoutesConfig.mentorCreateTask,
        builder: (context, state) => const MentorCreateTaskView(),
      ),
    ],
  );
}
