import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MultipleChoiceQuiz extends StatelessWidget {
  const MultipleChoiceQuiz({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
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
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: const Color(0XFFF6F6F6),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.r),
                topRight: Radius.circular(12.r),
              ),
            ),
            child: Row(
              children: [
                Text(
                  'Question ${index + 1}',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Inter',
                    color: const Color(0XFF036666),
                  ),
                ),
                const Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(
                      color: Colors.black.withOpacity(0.2),
                    ),
                  ),
                  child: Icon(
                    Icons.image_outlined,
                    color: Colors.black.withOpacity(0.7),
                    size: 14.sp,
                  ),
                ),
                SizedBox(width: 10.w),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(
                      color: Colors.black.withOpacity(0.2),
                    ),
                  ),
                  child: Icon(
                    Icons.copy_outlined,
                    color: Colors.black.withOpacity(0.7),
                    size: 14.sp,
                  ),
                ),
                SizedBox(width: 10.w),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(
                      color: Colors.black.withOpacity(0.2),
                    ),
                  ),
                  child: Icon(
                    CupertinoIcons.trash,
                    color: Colors.black.withOpacity(0.7),
                    size: 14.sp,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 22.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 220.w,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Type your question here',
                          hintStyle: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Inter',
                            color: Colors.black.withOpacity(0.4),
                          ),
                          border: null,
                          focusedBorder: null,
                          focusColor: null,
                          enabledBorder: null,
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    if (true)
                      Image.asset(
                        'assets/images/error.png',
                        width: 70.w,
                        height: 70.h,
                      )
                  ],
                ),
                SizedBox(height: 10.h),
                ListView.separated(
                  itemCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 10.h);
                  },
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            RadioMenuButton(
                              value: 'value',
                              groupValue: 'groupValue',
                              onChanged: (value) {},
                              child: Text(
                                'Option ${index + 1}',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Inter',
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            const Spacer(),
                            Icon(
                              Icons.image_outlined,
                              color: Colors.black.withOpacity(0.7),
                              size: 20.sp,
                            ),
                            SizedBox(width: 10.w),
                            Icon(
                              CupertinoIcons.xmark,
                              color: Colors.black.withOpacity(0.7),
                              size: 20.sp,
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        Padding(
                          padding: EdgeInsets.only(left: 32.w),
                          child: Image.asset(
                            'assets/images/error.png',
                            width: 70.w,
                            height: 70.h,
                          ),
                        ),
                      ],
                    );
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Add Option',
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Inter',
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 6.h,
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            const Color(0XFF036666),
                            const Color(0XFF14DEDE).withOpacity(0.8),
                          ],
                        ),
                      ),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 20.h),
            decoration: BoxDecoration(
              color: const Color(0XFFF6F6F6),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12.r),
                bottomRight: Radius.circular(12.r),
              ),
            ),
            child: Row(
              children: [
                DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    isExpanded: true,
                    hint: Row(
                      children: [
                        Icon(
                          Icons.check_circle,
                          size: 12.sp,
                          color: const Color(0XFF036666),
                        ),
                        SizedBox(width: 4.w),
                        Expanded(
                          child: Text(
                            '2 Points',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.black.withOpacity(0.8),
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
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
                      height: 35.h,
                      width: 115.w,
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(
                          color: Colors.black.withOpacity(0.2),
                        ),
                        color: Colors.white,
                      ),
                    ),
                    iconStyleData: IconStyleData(
                      icon: Icon(
                        Icons.arrow_drop_down_outlined,
                        size: 18.sp,
                      ),
                      iconEnabledColor: const Color(0XFF036666),
                      iconDisabledColor: const Color(0XFF036666),
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
                SizedBox(width: 5.w),
                DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    isExpanded: true,
                    hint: Row(
                      children: [
                        Icon(
                          Icons.radio_button_checked_outlined,
                          size: 12.sp,
                          color: const Color(0XFF036666),
                        ),
                        SizedBox(width: 4.w),
                        Expanded(
                          child: Text(
                            'Multiple Choice',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.black.withOpacity(0.8),
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    items: items
                        .map((String item) => DropdownMenuItem<String>(
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
                            ))
                        .toList(),
                    value: selectedValue,
                    onChanged: (value) {
                      // setState(() {
                      //   selectedValue = value;
                      // });
                    },
                    buttonStyleData: ButtonStyleData(
                      height: 35.h,
                      width: 140.w,
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(
                          color: Colors.black.withOpacity(0.2),
                        ),
                        color: Colors.white,
                      ),
                    ),
                    iconStyleData: IconStyleData(
                      icon: Icon(
                        Icons.arrow_drop_down_outlined,
                        size: 18.sp,
                      ),
                      iconEnabledColor: const Color(0XFF036666),
                      iconDisabledColor: const Color(0XFF036666),
                    ),
                    dropdownStyleData: DropdownStyleData(
                      maxHeight: 200.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14.r),
                        color: Colors.white,
                      ),
                      offset: const Offset(-20, 0),
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
                const Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 8.h,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0XFF036666),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Text(
                    'Done',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Inter',
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
