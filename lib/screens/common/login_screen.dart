import 'package:EJI/ad_manager.dart';
import 'package:EJI/repository/cloud_database.dart';
import 'package:EJI/settings/params.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'anounces_tab.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final CloudDatabase c = Get.put(CloudDatabase());

 bool isArabic = false;
  final _loginformKey1 = GlobalKey<FormState>();
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
    //myBanner = buildLargeBannerAd()..load();
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
            'assets/images/ejisplash.jpg',
            fit: BoxFit.fill,
          ),
          Form(
            key: _loginformKey1,
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  color: primaryColor.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(10),
                ),
                width: Get.width - 40,
                height: Get.height / 1.8,
                child: ListView(
                  children: <Widget>[
                    Align(
                        alignment: Alignment.topCenter,
                        child: Text('Sign In', style: TextStyle(fontSize:26,fontWeight: FontWeight.w600,color: fontColor))),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        style: TextStyle(fontSize:26,fontWeight: FontWeight.w600,color: fontColor),
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
                            labelStyle: TextStyle(fontSize:18,fontWeight: FontWeight.w400,color: fontColor),
                            focusColor: accentColor,
                            hintStyle: TextStyle(fontSize:14,fontWeight: FontWeight.w200,color: fontColor),
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
                        style: TextStyle(fontSize:26,fontWeight: FontWeight.w600,color: fontColor),
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
                            labelStyle: TextStyle(fontSize:18,fontWeight: FontWeight.w400,color: fontColor),
                            focusColor: accentColor,
                            hintStyle: TextStyle(fontSize:18,fontWeight: FontWeight.w200,color: fontColor),
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
                     height: 30,
                   ),
                    Container(
                      height: 70,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: new RaisedButton(
                          elevation: 5.0,
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10.0)),
                          color: accentColor,
                          child: new Text('LOGIN',
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
                                Get.to(AnouncesTab()),
                               //  isArabic? Get.updateLocale(Locale('ar')):Get.updateLocale(Locale('en')), 
                              }
                            
                            else if (_loginformKey1.currentState.validate())
                              {
                                if (emailController.text.trim() ==
                                        c.email.value.toString() &&
                                    passController.text.trim() ==
                                        c.password.value.toString())
                                  {
                                    c.setAdmin(false),
                                    Get.to(AnouncesTab()),
                                    //  isArabic? Get.updateLocale(Locale('ar')):Get.updateLocale(Locale('en')), 
                                  }
                                else
                                  {
                                    Get.snackbar('Alert'.tr, 'loginnot'.tr,
                                        snackPosition: SnackPosition.BOTTOM,
                                        backgroundColor: secondaryColor,
                                        colorText: primaryColor)
                                  }
                              },
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

bool isArabic= true;

var languageSwitch= SizedBox(
                      height: 50,
                      child:  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: isArabic? new Text(
                          'عربية'.tr,textAlign: TextAlign.center,
                          style: TextStyle(fontSize:26,fontWeight: FontWeight.w600,color: fontColor),
                        )
                        : new Text(
                          'English'.tr,textAlign: TextAlign.center,
                          style: TextStyle(fontSize:26,fontWeight: FontWeight.w600,color: fontColor),
                        ),
                      ),
                      Switch(
                          value: isArabic,
                          onChanged: (value) {
                            
                              isArabic = value;
                              
                         
                          }),
                    ],
                  ),
                    );