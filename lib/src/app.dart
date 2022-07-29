import 'package:flutter/material.dart';
import 'package:masterclass_menu/src/app_routes.dart';
import 'package:masterclass_menu/src/exercicios/tinder/tinder_page.dart';
import 'package:masterclass_menu/src/splash/splash_page.dart';

import 'home/home_page.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false;
  switchDarkMode() {
    isDarkMode = !isDarkMode;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: isDarkMode ? themeDark : themeLight,
      routes: {
        AppRoutes.SPLASH: (context) => const SplashScreen(),
        AppRoutes.HOME: (context) => HomePage(switchDarkMode),
        AppRoutes.TINDER: (context) => const TinderPage(),
      },
    );
  }

  final themeLight = ThemeData(
    colorScheme: const ColorScheme.light(
      background: Color(0xffD6DFE4),
      primary: Color(0Xff055AA3),
      secondary: Color(0xffEDF4F8),
      tertiary: Color(0xff51565A),
      surface: Color(0xff172026),
    ),
    textTheme: textThemeLight,
  );

  final themeDark = ThemeData(
    cardColor: const Color(0xff172026),
    colorScheme: const ColorScheme.dark(
      background: Color(0xff121517),
      primary: Color(0Xff055AA3),
      secondary: Color(0xff172026),
      tertiary: Color(0xff51565A),
      surface: Color(0xffEDF4F8),
    ),
    textTheme: textThemeDark,
  );
}

const textThemeLight = TextTheme(
  headline1: TextStyle(
    fontFamily: 'Poppins',
    fontSize: 20,
    color: Color(0xff172026),
  ),
  headline2: TextStyle(
    fontFamily: 'Poppins',
    fontSize: 16,
  ),
  bodyText1: TextStyle(
    fontFamily: 'Mountserrat',
    fontSize: 14,
  ),
  bodyText2: TextStyle(
    fontFamily: 'Mountserrat',
    fontSize: 12,
  ),
);



const textThemeDark = TextTheme(
  headline1: TextStyle(
    fontFamily: 'Poppins',
    fontSize: 20,
  ),
  headline2: TextStyle(
    fontFamily: 'Poppins',
    fontSize: 16,
    color: Color(0xffEDF4F8),
  ),
  bodyText1: TextStyle(
    fontFamily: 'Mountserrat',
    fontSize: 14,
  ),
  bodyText2: TextStyle(
    fontFamily: 'Mountserrat',
    fontSize: 12,
    color: Color(0xff51565A),
  ),
);
