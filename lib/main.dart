import 'package:EJI/screens/info_screen.dart';
import 'package:flutter/material.dart';
import 'package:EJI/screens/login_screen.dart';
import 'package:EJI/screens/splash.dart';
import 'package:EJI/settings/params.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
void main() {
  runApp(GetMaterialApp(
    color: primaryColor,
    debugShowCheckedModeBanner: false,
    theme: ThemeData(accentColor: accentColor,primaryColor: primaryColor),
    
    
    
    
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
        accentColor: accentColor,appBarTheme: AppBarTheme(color: primaryColor,),
        // Define the default font family.

        // Define the default TextTheme. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
      ),
      initialRoute: '/SplashScreen',
      routes: {
        '/SplashScreen': (context) => SplashPage(),
        '/LoginScreen': (context) => LoginScreen(),
        '/InfoScreen': (context) => InfoScreen(),
      },
    );
  }
}
