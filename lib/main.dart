import 'package:EJI/bindings/store_bindings.dart';
import 'package:EJI/translations/translations.dart';
import 'package:flutter/material.dart';
import 'package:EJI/screens/common/splash.dart';
import 'package:EJI/settings/params.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      color: primaryColor,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          accentColor: accentColor,
          fontFamily: 'Almarai',
          appBarTheme: AppBarTheme(
              color: primaryColor,
              iconTheme: IconThemeData(color: secondaryColor)),
          iconTheme: IconThemeData(color: accentColor),
          primaryColor: primaryColor,
          cardColor: secondaryColor),
      translations: MyTranslations(),
      locale: Locale('ar'),
      home: SplashPage(),
      initialRoute: '/splash',
      initialBinding: StoreBindings(),
      getPages: [
        GetPage(name: '/splash', page: () => new SplashPage()),
      ],
    );
  }
}
