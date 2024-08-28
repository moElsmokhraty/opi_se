import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'done_tasks_list.dart';
import 'todo_tasks_list.dart';
import 'task_type_tabs_widget.dart';
import 'in_progress_tasks_list.dart';
import '../../../cubits/tasks_cubit/tasks_cubit.dart';

class TasksViewBody extends StatefulWidget {
  const TasksViewBody({super.key});

  @override
  State<TasksViewBody> createState() => _TasksViewBodyState();
}

class _TasksViewBodyState extends State<TasksViewBody>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {
        BlocProvider.of<TasksCubit>(
          context,
          listen: false,
        ).selectedIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.removeListener(() {});
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;
    return Column(
      children: [
        SizedBox(height: screenHeight * 0.03),
        // const TasksCalendar(),
        // SizedBox(height: screenHeight * 0.05),
        TaskTypeTabsWidget(tabController: _tabController),
        SizedBox(height: screenHeight * 0.03),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: const [
              TodoTasksList(),
              InProgressTasksList(),
              DoneTasksList(),
            ],
          ),
        ),
      ],
    );
  }
}
