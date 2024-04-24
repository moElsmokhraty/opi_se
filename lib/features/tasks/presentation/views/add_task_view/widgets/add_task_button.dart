import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cubits/add_task_cubit/add_task_cubit.dart';
import '../../../../../../core/functions/show_snack_bar.dart';
import '../../../../../../core/widgets/buttons/auth_button.dart';
import '../../../../../../core/utils/routes_config/routes_config.dart';

class AddTaskButton extends StatelessWidget {
  const AddTaskButton({super.key});

  @override
  Widget build(BuildContext context) {
    final AddTaskCubit cubit = BlocProvider.of<AddTaskCubit>(context);
    return BlocConsumer<AddTaskCubit, AddTaskState>(
      listener: (context, state) {
        if (state is AddTaskSuccess) {
          showCustomSnackBar(context, 'Task Added Successfully');
          GoRouter.of(context).pushReplacement(RoutesConfig.homeLayout);
        } else if (state is AddTaskFailure) {
          showCustomSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        if (state is AddTaskLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return AuthButton(
          text: 'Add Task',
          onPressed: () async {
            await cubit.addTask();
          },
          backColor: const Color(0xFF036666),
          textColor: Colors.white,
        );
      },
    );
  }
}
