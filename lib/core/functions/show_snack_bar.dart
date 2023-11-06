import '../utils/styling/styles.dart';
import 'package:flutter/material.dart';

void showCustomSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        content,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.start,
        style: AppStyles.textStyle16.copyWith(fontWeight: FontWeight.w500),
      ),
      backgroundColor: const Color(0xff036666),
      duration: const Duration(milliseconds: 2000),
    ),
  );
}
