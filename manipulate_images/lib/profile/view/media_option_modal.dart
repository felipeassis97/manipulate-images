import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:manipulate_images/profile/controller/profile_controller.dart';
import 'package:manipulate_images/shared/theme/texts_component.dart';
import 'package:manipulate_images/shared/utils/app_images.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

class MediaOptionModal {
  final profileController = ProfileController();
  show(context) => showMaterialModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      builder: (context) => SizedBox(
            height: 180.h,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: TextsComponents.mediumText('Select source'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () async {
                        await Provider.of<ProfileController>(context,
                                listen: false)
                            .getCameraImage();
                        Navigator.pop(context);
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 16)
                                .r,
                            child: SvgPicture.asset(
                              AppImages.cameraIcon,
                              height: 40.h,
                              width: 40.w,
                            ),
                          ),
                          TextsComponents.mediumText('Camera'),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        await Provider.of<ProfileController>(context,
                                listen: false)
                            .getGalleryImage();
                        Navigator.pop(context);
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 16)
                                .r,
                            child: SvgPicture.asset(
                              AppImages.galleryIcon,
                              height: 40.h,
                              width: 40.w,
                            ),
                          ),
                          TextsComponents.mediumText('Gallery'),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ));
}
