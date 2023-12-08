import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:opi_se/core/functions/validate_text.dart';
import 'package:opi_se/core/widgets/text_fields/auth_text_field.dart';

import 'recommendation_item.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16.w, left: 16.w, top: 16.h),
      child: Column(
        children: [
          AuthTextField(
            controller: TextEditingController(),
            hintText: 'Search your study partner..',
            validator: (value) {
              return validateText('Partner Name', value!);
            },
            keyboardType: TextInputType.name,
            prefixIcon: Icon(
              Icons.search,
              size: 24.sp,
              color: const Color(0xFF036666),
            ),
          ),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context, index) => const RecommendationItem(),
            ),
          ),
        ],
      ),
    );
  }
}


