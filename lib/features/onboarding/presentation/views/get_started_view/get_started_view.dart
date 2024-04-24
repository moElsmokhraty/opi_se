import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/buttons/auth_button.dart';

class GetStartedView extends StatelessWidget {
  const GetStartedView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.2),
              Image.asset('assets/images/opi_se_logo.png'),
              SizedBox(height: screenHeight * 0.45),
              AuthButton(
                text: 'Get Started',
                backColor: const Color(0XFF036666),
                textColor: Colors.white,
                onPressed: () {
                  // Navigator.pushNamed(context, '/sign_in');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
