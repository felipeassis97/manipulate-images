import 'dart:io';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:manipulate_images/shared/theme/custom_app_bar.dart';
import 'package:manipulate_images/shared/utils/app_images.dart';

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
    return Scaffold(
        body: Column(
      children: [
        _userImage(),
        _userInformation(),
      ],
    ));
  }

  Widget _userImage() => Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          const CustomAppBar(),
          Padding(
            padding: const EdgeInsets.only(top: 120),
            child: Column(
              children: [
                InkWell(
                  onTap: () async {
                    await getGalleryImage();
                  },
                  child: Badge(
                    badgeColor: const Color(0xFF0061ff),
                    position: BadgePosition.bottomEnd(end: 8, bottom: 4),
                    badgeContent: SvgPicture.asset(
                      AppImages.editProfile,
                      width: 30,
                      height: 30,
                    ),
                    child: selectedImage != null
                        ? Container(
                            width: 160,
                            height: 160,
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
                                  File(selectedImage!.path),
                                ),
                              ),
                            ),
                          )
                        : CircleAvatar(
                            foregroundColor: Colors.white,
                            radius: 80,
                            child: SvgPicture.asset(
                              AppImages.defaultUser,
                            ),
                          ),
                  ),
                )
              ],
            ),
          ),
        ],
      );

  Widget _userArea() => const Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: Text(
          'Flutter Developer',
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0XFF56636B)),
        ),
      );

  Widget _divider() => const Padding(
      padding: EdgeInsets.only(top: 16.0, bottom: 16, left: 8, right: 8),
      child: Divider());

  Widget _userInformation() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _userName(),
          _userArea(),
          _divider(),
          _itemProfile(title: 'Settings', icon: Icons.settings),
          _itemProfile(title: 'Information', icon: Icons.info_outline_rounded),
          const SizedBox(height: 75),
          _itemProfile(title: 'Logout', icon: Icons.logout_rounded, gradient: [
            Colors.red,
            Colors.redAccent,
          ]),
        ],
      );

  Widget _userName() => const Padding(
        padding: EdgeInsets.only(top: 24.0),
        child: Text(
          'Felipe Assis',
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Color(0XFF56636B)),
        ),
      );

  Widget _itemProfile(
          {required String title,
          required IconData icon,
          List<Color>? gradient}) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(4, 8, 8, 8),
              child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 2,
                      blurRadius: 20,
                      offset: const Offset(0, 8), // changes position of shadow
                    ),
                  ],
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: gradient ??
                        [
                          Colors.black,
                          Colors.black54,
                        ],
                  ),
                ),
                child: Icon(
                  icon,
                  color: Colors.white,
                ),
              ),
            ),
            Text(
              title,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0XFF56636B)),
            ),
            const Expanded(
                child: Align(
              alignment: Alignment.centerRight,
              child: Icon(
                Icons.arrow_forward_ios_rounded,
                size: 16,
              ),
            ))
          ],
        ),
      );

  getGalleryImage() async {
    final XFile? temporary =
        await imagePicker.pickImage(source: ImageSource.gallery);

    if (temporary != null) {
      final croppedImage = await cropImage(temporary);

      setState(() {
        selectedImage = XFile(croppedImage.path);
      });
    }
  }

  getCameraImage() async {
    final XFile? temporary =
        await imagePicker.pickImage(source: ImageSource.camera);

    if (temporary != null) {
      final croppedImage = await cropImage(temporary);
      setState(() {
        selectedImage = XFile(croppedImage.path);
      });
    }
  }

  cropImage(XFile image) async {
    return await ImageCropper()
        .cropImage(sourcePath: image.path, aspectRatioPresets: [
      CropAspectRatioPreset.square,
    ]);
  }
}

class Customshape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;
    var path = Path();
    path.lineTo(0, height - 50);
    path.quadraticBezierTo(width / 2, height, width, height - 50);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
