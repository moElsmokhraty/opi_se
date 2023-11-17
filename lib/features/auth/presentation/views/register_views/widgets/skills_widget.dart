import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:opi_se/core/functions/validate_text.dart';
import 'package:opi_se/core/utils/styling/styles.dart';

class SkillsWidget extends StatefulWidget {
  const SkillsWidget({super.key});

  @override
  SkillsWidgetState createState() => SkillsWidgetState();
}

class SkillsWidgetState extends State<SkillsWidget> {
  final TextEditingController _skillController = TextEditingController();
  final List<String> _skills = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[400]!),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSkillsList(),
          SizedBox(height: 20.h),
          TextFormField(
            controller: _skillController,
            validator: (value) {
              if (_skills.contains(value)) {
                return 'Skill already added';
              } else {
                return validateText('Skill', value!);
              }
            },
            decoration: InputDecoration(
              labelText: 'Enter Skill',
              suffixIcon: IconButton(
                icon: Icon(Icons.add_outlined, size: 21.sp),
                onPressed: () {
                  _addSkill();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillsList() {
    return Wrap(
      spacing: 8.w,
      runSpacing: 8.h,
      children: _skills.map((skill) {
        return Chip(
          backgroundColor: const Color(0xFFF6F6F6),
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(16.r),
          ),
          label: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
            child: Text(
              skill,
              style: AppStyles.textStyle24.copyWith(fontSize: 14.sp),
            ),
          ),
          deleteIcon: Icon(
            Icons.close,
            size: 16.sp,
            color: const Color(0xff036666),
          ),
          deleteButtonTooltipMessage: 'Remove Skill',
          onDeleted: () {
            _removeSkill(skill);
          },
        );
      }).toList(),
    );
  }

  void _addSkill() {
    String newSkill = _skillController.text.trim();
    if (newSkill.isNotEmpty) {
      setState(() {
        _skills.add(newSkill);
        _skillController.clear();
      });
    }
  }

  void _removeSkill(String skill) {
    setState(() {
      _skills.remove(skill);
    });
  }
}
