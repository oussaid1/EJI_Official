import 'package:EJI/screens/common/info_screen.dart';
import 'package:EJI/translations/translations.dart';
import 'package:flutter/material.dart';
import 'package:EJI/screens/common/login_screen.dart';
import 'package:EJI/screens/common/splash.dart';
import 'package:EJI/settings/params.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(GetMaterialApp(
      color: primaryColor,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(accentColor: accentColor, primaryColor: primaryColor),
      translations: MyTranslations(),
      locale: Locale('en'),
      initialRoute: '/SplashScreen',
      routes: {
        '/SplashScreen': (context) => SplashPage(),
        '/LoginScreen': (context) => LoginScreen(),
        '/InfoScreen': (context) => InfoScreen(),
      },
      home: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EJI',
      theme: ThemeData(
        // Define the default brightness and colors.

        primaryColor: primaryColor,
        accentColor: accentColor,
        appBarTheme: AppBarTheme(
          color: primaryColor,
        ),
        // Define the default font family.

        // Define the default TextTheme. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
      ),
    );
  }
}
