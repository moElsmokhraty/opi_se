import '../utils/styling/themes.dart';
import '../utils/styling/styles.dart';
import 'package:flutter/material.dart';

void showCustomSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        content,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
        style: AppStyles.textStyle16.copyWith(fontWeight: FontWeight.w500),
      ),
      backgroundColor: Theme.of(context).colorScheme.secondary,
      duration: const Duration(milliseconds: 2000),
    ),
  );
}
