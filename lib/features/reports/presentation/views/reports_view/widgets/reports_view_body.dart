import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'report_item.dart';

class ReportsViewBody extends StatelessWidget {
  const ReportsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;
    final List<String> items = [
      'Item1',
      'Item2',
      'Item3',
      'Item4',
      'Item1',
      'Item2',
      'Item3',
      'Item4',
      'Item1',
      'Item2',
      'Item3',
      'Item4',
    ];
    String? selectedValue;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DropdownButtonHideUnderline(
                child: DropdownButton2<String>(
                  hint: Text(
                    'Quiz Name',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.black.withOpacity(0.8),
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  items: items
                      .map(
                        (String item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Inter',
                              color: Colors.black.withOpacity(0.7),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                  value: selectedValue,
                  onChanged: (value) {
                    // setState(() {
                    //   selectedValue = value;
                    // });
                  },
                  buttonStyleData: ButtonStyleData(
                    height: 50.h,
                    width: 162.5.w,
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(
                        color: const Color(0XFFD9D9D9),
                      ),
                      color: Colors.white,
                    ),
                  ),
                  iconStyleData: IconStyleData(
                    icon: Icon(
                      Icons.arrow_drop_down_outlined,
                      size: 22.sp,
                      color: Colors.black.withOpacity(0.7),
                    ),
                  ),
                  dropdownStyleData: DropdownStyleData(
                    maxHeight: 200.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14.r),
                      color: Colors.white,
                    ),
                    offset: const Offset(-10, 0),
                    scrollbarTheme: ScrollbarThemeData(
                      radius: Radius.circular(40.r),
                      thickness: WidgetStateProperty.all(5.w),
                      thumbVisibility: WidgetStateProperty.all(true),
                    ),
                  ),
                  menuItemStyleData: MenuItemStyleData(
                    height: 40.h,
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                  ),
                ),
              ),
              DropdownButtonHideUnderline(
                child: DropdownButton2<String>(
                  hint: Text(
                    'Quiz Name',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.black.withOpacity(0.8),
                    ),
                  ),
                  items: items
                      .map(
                        (String item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Inter',
                              color: Colors.black.withOpacity(0.7),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                  value: selectedValue,
                  onChanged: (value) {
                    // setState(() {
                    //   selectedValue = value;
                    // });
                  },
                  buttonStyleData: ButtonStyleData(
                    height: 50.h,
                    width: 162.5.w,
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(
                        color: const Color(0XFFD9D9D9),
                      ),
                      color: Colors.white,
                    ),
                  ),
                  iconStyleData: IconStyleData(
                    icon: Icon(
                      Icons.arrow_drop_down_outlined,
                      size: 22.sp,
                      color: Colors.black.withOpacity(0.7),
                    ),
                  ),
                  dropdownStyleData: DropdownStyleData(
                    maxHeight: 200.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14.r),
                      color: Colors.white,
                    ),
                    offset: const Offset(-10, 0),
                    scrollbarTheme: ScrollbarThemeData(
                      radius: Radius.circular(40.r),
                      thickness: WidgetStateProperty.all(5.w),
                      thumbVisibility: WidgetStateProperty.all(true),
                    ),
                  ),
                  menuItemStyleData: MenuItemStyleData(
                    height: 40.h,
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.02),
          DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              hint: Text(
                'Quiz Name',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.black.withOpacity(0.8),
                ),
                overflow: TextOverflow.ellipsis,
              ),
              items: items
                  .map(
                    (String item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Inter',
                          color: Colors.black.withOpacity(0.7),
                        ),
                      ),
                    ),
                  )
                  .toList(),
              value: selectedValue,
              onChanged: (value) {
                // setState(() {
                //   selectedValue = value;
                // });
              },
              buttonStyleData: ButtonStyleData(
                height: 50.h,
                width: 162.5.w,
                padding: EdgeInsets.symmetric(
                  horizontal: 12.w,
                  vertical: 4.h,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(
                    color: const Color(0XFFD9D9D9),
                  ),
                  color: Colors.white,
                ),
              ),
              iconStyleData: IconStyleData(
                icon: Icon(
                  Icons.arrow_drop_down_outlined,
                  size: 22.sp,
                  color: Colors.black.withOpacity(0.7),
                ),
              ),
              dropdownStyleData: DropdownStyleData(
                maxHeight: 200.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14.r),
                  color: Colors.white,
                ),
                offset: const Offset(-10, 0),
                scrollbarTheme: ScrollbarThemeData(
                  radius: Radius.circular(40.r),
                  thickness: WidgetStateProperty.all(5.w),
                  thumbVisibility: WidgetStateProperty.all(true),
                ),
              ),
              menuItemStyleData: MenuItemStyleData(
                height: 40.h,
                padding: EdgeInsets.symmetric(horizontal: 12.w),
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
          Expanded(
            child: ListView.separated(
              itemCount: 5,
              itemBuilder: (context, index) => const ReportItem(),
              separatorBuilder: (context, index) => SizedBox(height: 20.h),
            ),
          ),
        ],
      ),
    );
  }
}
