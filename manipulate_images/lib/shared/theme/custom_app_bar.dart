import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manipulate_images/shared/theme/texts_component.dart';
import 'package:manipulate_images/shared/theme/app_colors.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: WaveClipperTwo(),
          child: Container(
            height: 250.h,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.center,
                end: Alignment.bottomCenter,
                colors: AppColors.gradientAppBar,
              ),
            ),
          ),
        ),
        Positioned(
            top: 16.h,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 8).r,
              height: 56.h,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.backgroundColor,
                  ),
                  TextsComponents.bigText('My profile',
                      fontSize: 20, color: AppColors.backgroundColor),
                  const Icon(
                    Icons.share,
                    color: AppColors.backgroundColor,
                  ),
                ],
              ),
            )),
      ],
    );
  }
}
