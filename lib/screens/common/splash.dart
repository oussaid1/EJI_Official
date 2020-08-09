import 'dart:async';

import 'package:EJI/screens/common/login_screen.dart';
import 'package:EJI/settings/params.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(Duration(seconds: 4), () {
      Get.to(LoginScreen());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: InkWell(
        onTap: () => Navigator.push(
          context,
          new MaterialPageRoute(builder: (context) => LoginScreen()),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image.asset(
              'assets/images/ejisplash.jpg',
              fit: BoxFit.fill,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
              FlatButton(
                onPressed: () {
                  Get.updateLocale(Locale('ar'));
                },
                child: Text(
                  'Arabic',
                  style: TextStyle(color: accentColor, fontSize: 18),
                ),
              ),
              FlatButton(
                onPressed: () {
                  Get.updateLocale(Locale('en'));
                },
                child: Text(
                  'English',
                  style: TextStyle(color: accentColor, fontSize: 18),
                ),
              ),
            ]),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    'Dev-Bourheem \n Copyright\n 2021',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: secondaryColor,
                      fontWeight: FontWeight.w200,
                      fontSize: 12,
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
