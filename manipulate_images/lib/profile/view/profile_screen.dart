import 'dart:io';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:manipulate_images/profile/controller/profile_controller.dart';
import 'package:manipulate_images/profile/view/media_option_modal.dart';
import 'package:manipulate_images/shared/theme/texts_component.dart';
import 'package:manipulate_images/shared/theme/app_colors.dart';
import 'package:manipulate_images/shared/theme/custom_app_bar.dart';
import 'package:manipulate_images/shared/utils/app_images.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ImagePicker imagePicker = ImagePicker();
  XFile? selectedImage;

  @override
  Widget build(BuildContext context) {
    final profileController =
        Provider.of<ProfileController>(context, listen: false);
    return Scaffold(
        body: Column(
      children: [
        _userImage(controller: profileController),
        _userInformation(),
      ],
    ));
  }

  Widget _userImage({required ProfileController controller}) => Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          const CustomAppBar(),
          Padding(
            padding: const EdgeInsets.only(top: 120).r,
            child: Column(
              children: [
                InkWell(
                  onTap: () => MediaOptionModal().show(context),
                  child: Badge(
                    badgeColor: AppColors.primaryColor,
                    position: BadgePosition.bottomEnd(end: 8.r, bottom: 4.r),
                    badgeContent: SvgPicture.asset(
                      AppImages.editProfile,
                      width: 30.w,
                      height: 30.h,
                    ),
                    child: StreamBuilder<XFile?>(
                      stream: controller.stream,
                      builder: (ctx, snapshot) {
                        if (!snapshot.hasData) {
                          return CircleAvatar(
                            foregroundColor: AppColors.backgroundColor,
                            radius: 80.r,
                            child: SvgPicture.asset(
                              AppImages.defaultUser,
                            ),
                          );
                        }

                        return Container(
                          width: 160.w,
                          height: 160.h,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: FileImage(
                                File(snapshot.data!.path),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      );

  Widget _userArea() => Padding(
      padding: const EdgeInsets.only(top: 8.0).r,
      child: TextsComponents.smallText('Flutter Developer'));

  Widget _divider() => Padding(
      padding:
          const EdgeInsets.only(top: 16.0, bottom: 16, left: 8, right: 8).r,
      child: const Divider());

  Widget _userInformation() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _userName(),
          _userArea(),
          _divider(),
          _itemProfile(title: 'Settings', icon: Icons.settings),
          _itemProfile(title: 'Information', icon: Icons.info_outline_rounded),
          SizedBox(height: 75.h),
          _itemProfile(
              title: 'Logout',
              icon: Icons.logout_rounded,
              gradient: AppColors.gradientWarning),
        ],
      );

  Widget _userName() => Padding(
        padding: const EdgeInsets.only(top: 24.0).r,
        child: TextsComponents.bigText('Felipe Assis'),
      );

  Widget _itemProfile(
          {required String title,
          required IconData icon,
          List<Color>? gradient}) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4).r,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(4, 8, 8, 8).r,
              child: Container(
                width: 32.w,
                height: 32.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8).r,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.textsColor.withOpacity(0.4),
                      spreadRadius: 2,
                      blurRadius: 20,
                      offset: const Offset(0, 8), // changes position of shadow
                    ),
                  ],
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: gradient ?? AppColors.gradientSecondary),
                ),
                child: Icon(icon, color: AppColors.backgroundColor),
              ),
            ),
            TextsComponents.mediumText(title),
            Expanded(
                child: Align(
              alignment: Alignment.centerRight,
              child: Icon(
                Icons.arrow_forward_ios_rounded,
                size: 16.r,
              ),
            ))
          ],
        ),
      );
}
