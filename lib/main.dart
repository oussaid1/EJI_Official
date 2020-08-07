import 'package:EJI/screens/common/team_home.dart';
import 'package:EJI/translations/translations.dart';
import 'package:flutter/material.dart';
import 'package:EJI/screens/common/splash.dart';
import 'package:EJI/settings/params.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async{
 await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
    color: primaryColor,
    debugShowCheckedModeBanner: false,
    theme: ThemeData(accentColor: accentColor,primaryColor: primaryColor),
    translations: MyTranslations(),
     locale:Locale('en'),
 initialRoute: '/SplashScreen',
      getPages: [
        //Simple GetPage
        GetPage(name: '/SplashScreen', page: () => SplashPage()),
        // GetPage with custom transitions and bindings
        GetPage(
          name: '/home',
          page: () => TeamHomePage(),
        ),
      ],
    home: MaterialApp(
      
    ));
  }
}
