import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/functions/show_snack_bar.dart';
import '../../../cubits/edit_task_cubit/edit_task_cubit.dart';
import '../../../../../../core/widgets/buttons/auth_button.dart';
import '../../../../../../core/utils/routes_config/routes_config.dart';

class EditTaskButton extends StatelessWidget {
  const EditTaskButton({super.key});

  @override
  Widget build(BuildContext context) {
    final EditTaskCubit cubit = BlocProvider.of<EditTaskCubit>(context);
    return BlocConsumer<EditTaskCubit, EditTaskState>(
      listener: (context, state) async {
        if (state is EditTaskSuccess) {
          showCustomSnackBar(context, 'Task Edited Successfully');
          await GoRouter.of(context).pushReplacement(RoutesConfig.homeLayout);
        } else if (state is EditTaskFailure) {
          showCustomSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        if (state is EditTaskLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return AuthButton(
          text: 'Edit Task',
          onPressed: () async {
            await cubit.editTask();
          },
          backColor: const Color(0xFF036666),
          textColor: Colors.white,
        );
      },
    );
  }
}
