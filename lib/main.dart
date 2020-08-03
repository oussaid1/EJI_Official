import 'package:EJI/bloc/mainbloc_bloc.dart';
import 'package:EJI/screens/info_screen.dart';
import 'package:flutter/material.dart';
import 'package:EJI/screens/home_screen.dart';
import 'package:EJI/screens/list_screen.dart';
import 'package:EJI/screens/login_screen.dart';
import 'package:EJI/screens/splash.dart';
import 'package:EJI/settings/params.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'screens/player_details.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider<MainblocBloc>(
      create: (BuildContext context) => MainblocBloc(),
    ),
  ], child: MyApp()));
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
        // Define the default font family.
       

        // Define the default TextTheme. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
      
        
      ),
      initialRoute: '/SplashScreen',
      routes: {
        '/SplashScreen': (context) => SplashPage(),
        '/LoginScreen': (context) => LoginScreen(),
        '/HomeScreen': (context) => HomePage(),
        '/ListScreen': (context) => PlayerList(),
        '/PlayerDetails': (context) => PlayerDetails(),
        '/InfoScreen': (context) => InfoScreen(),
      },
    );
  }
}
