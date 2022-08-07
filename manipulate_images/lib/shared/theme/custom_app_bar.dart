import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: WaveClipperTwo(),
          child: Container(
            height: 250,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.center,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF0061ff),
                  Color(0xFF60efff),
                ],
              ),
            ),
          ),
        ),
        Positioned(
            top: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              height: 56,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                  Text(
                    "Edit profile",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                  Icon(
                    Icons.share,
                    color: Colors.white,
                  ),
                ],
              ),
            )),
      ],
    );

    // SizedBox(
    //   height: 120,
    //   child: ClipPath(
    //     clipper: Customshape(),
    //     child: Stack(
    //       alignment: AlignmentDirectional.center,
    //       children: [
    //         Container(
    //           width: MediaQuery.of(context).size.width,
    //           decoration: BoxDecoration(
    //             //color: Colors.red,
    //             boxShadow: [
    //               BoxShadow(
    //                 color: Colors.grey.withOpacity(0.5),
    //                 spreadRadius: 5,
    //                 blurRadius: 7,
    //                 offset: const Offset(0, 3), // changes position of shadow
    //               ),
    //             ],
    //             gradient: const LinearGradient(
    //               begin: Alignment.center,
    //               end: Alignment.bottomCenter,
    //               colors: [
    //                 Color(0xFF0061ff),
    //                 Color(0xFF60efff),
    //               ],
    //             ),
    //           ),
    //         ),
    //         Positioned(
    //             top: 16,
    //             child: Container(
    //               padding:
    //                   const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    //               height: 56,
    //               width: MediaQuery.of(context).size.width,
    //               child: Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 children: const [
    //                   Icon(
    //                     Icons.arrow_back_ios,
    //                     color: Colors.white,
    //                   ),
    //                   Text(
    //                     "Edit profile",
    //                     style: TextStyle(
    //                         fontSize: 20,
    //                         color: Colors.white,
    //                         fontWeight: FontWeight.w600),
    //                   ),
    //                   Icon(
    //                     Icons.share,
    //                     color: Colors.white,
    //                   ),
    //                 ],
    //               ),
    //             )),
    //       ],
    //     ),
    //   ),
    // );
  }
}
