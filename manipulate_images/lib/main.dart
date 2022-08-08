import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:manipulate_images/profile/controller/profile_controller.dart';
import 'package:manipulate_images/profile/view/profile_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    Provider(create: (_) => ProfileController()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (context) {
      return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            appBarTheme: const AppBarTheme(
              systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarBrightness: Brightness.light,
                  systemNavigationBarIconBrightness: Brightness.light),
            ),
            primarySwatch: Colors.blue,
            backgroundColor: Colors.white,
            textTheme: GoogleFonts.nunitoSansTextTheme()),
        home: const HomePage(),
      );
    });
  }
}
