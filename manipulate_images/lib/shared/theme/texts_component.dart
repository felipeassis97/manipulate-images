import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manipulate_images/shared/theme/app_colors.dart';

abstract class TextsComponents {
  static Text smallText(String content, {Color color = AppColors.textsColor}) =>
      Text(
        content,
        style: TextStyle(
            fontSize: 14.sp, fontWeight: FontWeight.w400, color: color),
      );

  static Text mediumText(String content,
          {Color color = AppColors.textsColor}) =>
      Text(
        content,
        style: TextStyle(
            fontSize: 16.sp, fontWeight: FontWeight.w500, color: color),
      );

  static Text bigText(String content,
          {Color color = AppColors.textsColor, double fontSize = 24}) =>
      Text(
        content,
        style: TextStyle(
            fontSize: fontSize.sp, fontWeight: FontWeight.w600, color: color),
      );
}
