import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:opi_se/core/widgets/text_fields/auth_text_field.dart';

class CreatePollWidget extends StatefulWidget {
  const CreatePollWidget({super.key});

  @override
  State<CreatePollWidget> createState() => _CreatePollWidgetState();
}

class _CreatePollWidgetState extends State<CreatePollWidget> {
  List<TextEditingController> listController = [TextEditingController()];

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 24.w,
      bottom: 65.h,
      child: Container(
        width: 315.w,
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 16.h,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              blurRadius: 1.r,
              spreadRadius: 1.r,
            ),
            BoxShadow(
              color: Colors.grey.shade400,
              blurRadius: 1.r,
              spreadRadius: 1.r,
            ),
          ],
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/create_poll.png',
                    width: 35.w,
                    height: 35.h,
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    'Create Poll',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.h),
              SizedBox(
                height: 40.h,
                child: AuthTextField(
                  controller: TextEditingController(),
                  hintText: 'Type your Question',
                  validator: (p0) => null,
                ),
              ),
              SizedBox(height: 15.h),
              SizedBox(
                height: 40.h,
                child: AuthTextField(
                  controller: TextEditingController(),
                  hintText: 'Option 1',
                  validator: (p0) => null,
                ),
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: listController.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 40.h,
                            child: AuthTextField(
                              controller: TextEditingController(),
                              hintText: 'Option ${index + 2}',
                              validator: (p0) => null,
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        GestureDetector(
                          onTap: () {},
                          child: Container(),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
