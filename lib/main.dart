import 'dart:io';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travail/bloc/sign_in_bloc.dart';
import 'package:travail/screen/screen_login.dart';
import 'bloc/sing_up_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.deepOrange,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness:
            Platform.isAndroid ? Brightness.dark : Brightness.light,
        systemNavigationBarColor: Colors.grey[150],
        systemNavigationBarDividerColor: Colors.grey,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
    return AdaptiveTheme(
      light: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.red,
        accentColor: Colors.amber,
      ),
      dark: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.red,
        accentColor: Colors.amber,
      ),
      initial: AdaptiveThemeMode.light,
      builder: (theme, dartThem) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => SingUpBloc()),
          BlocProvider(create: (context) => SignInBloc()),
        ],
        child: MaterialApp(
          // theme: theme,
          // darkTheme: dartThem,
          debugShowCheckedModeBanner: false,
          // theme: ThemeData.dark().copyWith(
          //   scaffoldBackgroundColor: bgColor,
          //   textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
          //       .apply(bodyColor: Colors.white),
          //   canvasColor: secondaryColor,
          // ),
          home: ScreenLogin(),
        ),
      ),
    );
  }
}
