import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/widgets/buttons/auth_button.dart';
import '../../../../../home/presentation/views/mentor_home_view/widgets/create_quiz_or_task_dialog.dart';

class EmptyLibraryWidget extends StatelessWidget {
  const EmptyLibraryWidget({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;
    return Column(
      children: [
        Image.asset(
          'assets/images/empty_library.png',
          width: double.infinity,
          height: 350.h,
        ),
        Text(
          'No $text yet!',
          style: TextStyle(
            fontSize: 30.sp,
            fontWeight: FontWeight.bold,
            fontFamily: 'Inter',
            color: const Color(0xFF366666),
          ),
        ),
        SizedBox(height: screenHeight * 0.03),
        Text(
          'Create your first Quiz and Task',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
            fontFamily: 'Inter',
            color: Colors.black.withOpacity(0.5),
          ),
        ),
        SizedBox(height: screenHeight * 0.065),
        AuthButton(
          text: '+  Start Create',
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => const CreateQuizOrTaskDialog(),
            );
          },
          backColor: const Color(0XFF366666),
          textColor: Colors.white,
        ),
      ],
    );
  }
}
