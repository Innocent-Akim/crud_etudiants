import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travail/screen/screen_login.dart';

import 'app/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.blue.shade400,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness:
            Platform.isAndroid ? Brightness.dark : Brightness.light,
        systemNavigationBarColor: Colors.grey[150],
        systemNavigationBarDividerColor: Colors.grey,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData.dark().copyWith(
      //   scaffoldBackgroundColor: bgColor,
      //   textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
      //       .apply(bodyColor: Colors.white),
      //   canvasColor: secondaryColor,
      // ),
      home: ScreenLogin(),
    );
  }
}
