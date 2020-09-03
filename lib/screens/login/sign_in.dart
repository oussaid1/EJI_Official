import 'package:EJI/ad_manager.dart';
import 'package:EJI/repository/auth/auth_controler.dart';
import 'package:EJI/repository/cloud_database.dart';
import 'package:EJI/screens/common/home_page.dart';
import 'package:EJI/screens/login/sign_up.dart';
import 'package:EJI/settings/params.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final CloudDatabase c = Get.put(CloudDatabase());
  final AuthController dx = Get.put(AuthController());
  final _loginformKey2 = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();

  BannerAd myBanner;

  BannerAd buildBannerAd() {
    return BannerAd(
        adUnitId: AdManager.bannerAdUnitId,
        size: AdSize.banner,
        listener: (MobileAdEvent event) {
          if (event == MobileAdEvent.loaded) {
            myBanner..show();
          }
        });
  }

  BannerAd buildLargeBannerAd() {
    return BannerAd(
        adUnitId: BannerAd.testAdUnitId,
        size: AdSize.largeBanner,
        listener: (MobileAdEvent event) {
          if (event == MobileAdEvent.loaded) {
            myBanner
              ..show(
                  anchorType: AnchorType.top,
                  anchorOffset: MediaQuery.of(context).size.height * 0.15);
          }
        });
  }

  @override
  void initState() {
    super.initState();

    FirebaseAdMob.instance.initialize(appId: AdManager.appId);
    myBanner = buildBannerAd()..load();
  }

  @override
  void dispose() {
    myBanner.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            'assets/images/login.png',
            fit: BoxFit.fill,
          ),
          Positioned(
            top: 20,
            left: Get.width / 2.44,
            child: SizedBox(
              height: 80,
              width: 80,
              child: Image.asset(
                'assets/images/ejilogo.png',
                height: 80,
                width: 80,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Form(
            key: _loginformKey2,
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  color: primaryColor.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(10),
                ),
                width: Get.width - 40,
                height: Get.height / 1.4,
                child: ListView(
                  children: <Widget>[
                    Align(
                        alignment: Alignment.topCenter,
                        child: Text('Sign In',
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w600,
                                color: fontColor))),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: fontColor),
                        textAlign: TextAlign.center,
                        validator: (text) {
                          if (text.isEmpty) {
                            return ('emailempty'.tr);
                          }
                          return null;
                        },
                        controller: emailController,
                        autofocus: true,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(4.0))),
                            hintText: ('emailempty'.tr),
                            labelText: 'Email',
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelStyle: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: fontColor),
                            focusColor: accentColor,
                            hintStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w200,
                                color: fontColor),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: accentColor,
                                  style: BorderStyle.solid,
                                  width: 1),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: accentColor,
                                  style: BorderStyle.solid,
                                  width: 1),
                            ),
                            contentPadding: EdgeInsets.only(left: 2)),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w600,
                            color: fontColor),
                        obscureText: true,
                        textAlign: TextAlign.center,
                        validator: (text) {
                          if (text.isEmpty) {
                            return ('passempty'.tr);
                          }
                          return null;
                        },
                        controller: passController,
                        autofocus: true,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(4.0))),
                            hintText: ('passempty'.tr),
                            labelText: 'Password',
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelStyle: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: fontColor),
                            focusColor: accentColor,
                            hintStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w200,
                                color: fontColor),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: accentColor,
                                  style: BorderStyle.solid,
                                  width: 1),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: accentColor,
                                  style: BorderStyle.solid,
                                  width: 1),
                            ),
                            contentPadding: EdgeInsets.only(left: 2)),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 70,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: new RaisedButton(
                          elevation: 5.0,
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10.0)),
                          color: fontColor,
                          child: new Text('Sign In',
                              style: new TextStyle(
                                  fontFamily: 'RobotoCondensed',
                                  fontWeight: FontWeight.w800,
                                  fontSize: 30.0,
                                  color: primaryColor)),
                          onPressed: () => {
                            if (emailController.text.trim() ==
                                    c.adminEmail.value.toString() &&
                                passController.text.trim() ==
                                    c.adminPassword.value.toString())
                              {
                                c.setAdmin(true),
                                Get.to(HomeCards()),
                              }
                            else if (_loginformKey2.currentState.validate())
                              {
                                dx.signInWithEmailAndPassword(
                                  emailController.text.trim(),
                                  passController.text.trim(),
                                ),
                                c.setAdmin(false),
                                if (dx.authenticated.value == true)
                                  {
                                    Get.to(HomeCards()),
                                  }
                              }
                            else
                              {
                                Get.snackbar('Alert'.tr, 'loginnot'.tr,
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor: secondaryColor,
                                    colorText: primaryColor)
                              }
                          },
                        ),
                      ),
                    ),
                    Container(
                        width: Get.width - 40,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            new Text('او',
                                style: new TextStyle(
                                    fontFamily: 'RobotoCondensed',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20.0,
                                    color: fontColor)),
                            new Text('سجل الدخول بـ',
                                style: new TextStyle(
                                    fontFamily: 'RobotoCondensed',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20.0,
                                    color: fontColor)),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  new IconButton(
                                      icon: Icon(
                                        FontAwesomeIcons.facebook,
                                        size: 50,
                                        color: Colors.blue,
                                      ),
                                      onPressed: () {}),
                                  new IconButton(
                                      icon: Icon(
                                        FontAwesomeIcons.google,
                                        size: 50,
                                        color: fontColor,
                                      ),
                                      onPressed: () {}),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FlatButton(
                                onPressed: () {
                                  Get.to(RegisterPage());
                                },
                                child: new Text('ليس لديك حساب سجل الان ',
                                    style: new TextStyle(
                                        fontFamily: 'RobotoCondensed',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 20.0,
                                        color: fontColor)),
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Text(
                  'Dev-Bourheem \n Copyright\n 2020',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: fontColor,
                    fontWeight: FontWeight.w200,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}