
import 'dart:async';

import 'package:EJI/screens/common/login_screen.dart';
import 'package:EJI/settings/params.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
     Timer(Duration(seconds: 4), () {
      Navigator.pushNamed(context, '/LoginPage');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: InkWell(
        onTap: () => Navigator.push(context, new MaterialPageRoute(
  builder: (context) =>
      LoginScreen()),
  ),
        child: Stack(fit: StackFit.expand,
          children: <Widget>[
            
            Image.asset('assets/images/ejisplash.jpg',fit:BoxFit.fill,),
            
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
