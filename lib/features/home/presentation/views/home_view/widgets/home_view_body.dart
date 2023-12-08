import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:opi_se/core/utils/styling/styles.dart';
import 'package:opi_se/core/functions/validate_text.dart';
import 'package:opi_se/core/widgets/buttons/auth_button.dart';
import 'package:opi_se/core/widgets/text_fields/auth_text_field.dart';

import 'recommendation_item.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
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

// Expanded(
//   child: ListView(
//     physics: const BouncingScrollPhysics(),
//     children: [
//       SizedBox(height: screenHeight * 0.025),
//       Text.rich(
//         textScaler: const TextScaler.linear(1.1),
//         TextSpan(
//           children: [
//             TextSpan(
//               text: 'With',
//               style: AppStyles.textStyle24.copyWith(
//                 fontSize: 30.sp,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//             TextSpan(
//               text: ' Opi Se ',
//               style: AppStyles.textStyle24.copyWith(
//                 color: const Color(0xFF036666),
//                 fontSize: 30.sp,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//             TextSpan(
//               text: 'You\nCan Find The\nPerfect Study Partner',
//               style: AppStyles.textStyle24.copyWith(
//                 fontSize: 30.sp,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ],
//         ),
//       ),
//       SizedBox(height: screenHeight * 0.03),
//       Text(
//         'Lorem ipsum dolor sit amet, consectetur elit, sed nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velitesse cillum dolore eu fugiat nulla',
//         style: AppStyles.textStyle24.copyWith(
//           fontSize: 15.sp,
//           color: Colors.black.withOpacity(0.6),
//           overflow: TextOverflow.visible,
//           fontWeight: FontWeight.w600,
//         ),
//       ),
//       SizedBox(height: screenHeight * 0.05),
//       AuthButton(
//         text: 'Get a new Brain Buddy',
//         onPressed: () {},
//         backColor: const Color(0xFF036666),
//         textColor: Colors.white,
//       ),
//       Image.asset(
//         'assets/images/home_asset.png',
//         width: double.infinity,
//         height: 225.h,
//       ),
//     ],
//   ),
// ),
