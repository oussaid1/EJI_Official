import 'package:EJI/repository/cloud_database.dart';

import 'package:EJI/settings/params.dart';
import 'package:EJI/shared/drawer_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class Staff extends StatelessWidget {
  final CloudDatabase c = Get.put(CloudDatabase());

  Staff staff;

  Widget _buildPresident() {
    return Container(
      width: Get.width - 60,
      decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: secondaryColor, width: 0.5)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          new Text(
            'الرئيس',
            textDirection: TextDirection.rtl,
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.w600, color: orange),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: new Text(
                  'عبد اللطيف أوسعيد',
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: fontColor),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Image.asset(
                  'assets/images/staff/oussaid.png',
                  height: 60,
                  width: 60,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTechnicalStuff() {
    return Container(
      decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: secondaryColor, width: 0.5)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          new Text(
            'الطاقم التقني',
            textDirection: TextDirection.rtl,
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.w600, color: orange),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: new Text(
                      'المدرب',
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: fontColor),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 100),
                    child: new Text(
                      'عبد الله أوسعيد',
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: accentColor),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Image.asset(
                  'assets/images/staff/coach.png',
                  height: 60,
                  width: 60,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: new Text(
                      'مساعد المدرب',
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: fontColor),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 100),
                    child: new Text(
                      'محمد أوسعيد',
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: accentColor),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Image.asset(
                  'assets/images/staff/vicecoach.png',
                  height: 60,
                  width: 60,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: new Text(
                      'المعد البدني',
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: fontColor),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 100),
                    child: new Text(
                      'عبد الرحيم ندحم',
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: accentColor),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Image.asset(
                  'assets/images/ejilogo.png',
                  height: 60,
                  width: 60,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCouncellors() {
    return Container(
      decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: secondaryColor, width: 0.5)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          new Text(
            'المستشارون',
            textDirection: TextDirection.rtl,
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.w600, color: orange),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: new Text(
                      'المستشار القانوني',
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: fontColor),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 100),
                    child: new Text(
                      'الحسن إدسعيد أوبلا',
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: accentColor),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Image.asset(
                  'assets/images/staff/hassan.png',
                  height: 60,
                  width: 60,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: new Text(
                      'المستشار1',
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: fontColor),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 100),
                    child: new Text(
                      'رشيد بن شعيب',
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: accentColor),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Image.asset(
                  'assets/images/staff/rasheed.png',
                  height: 60,
                  width: 60,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: new Text(
                      'المستشار 2',
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: fontColor),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 100),
                    child: new Text(
                      'لحسن إدسعيد أوبلا',
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: accentColor),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Image.asset(
                  'assets/images/staff/larsen.png',
                  height: 60,
                  width: 60,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: new Text(
                      'المستشار 3',
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: fontColor),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 100),
                    child: new Text(
                      'لحسن فقير',
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: accentColor),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Image.asset(
                  'assets/images/staff/lahssenfakir.png',
                  height: 60,
                  width: 60,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDirectory() {
    return Container(
      decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: secondaryColor, width: 0.5)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          new Text(
            'الطاقم الإداري',
            textDirection: TextDirection.rtl,
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.w600, color: orange),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: new Text(
                      'المدير التنفيذي',
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: fontColor),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 100),
                    child: new Text(
                      'الحسين ايت داود',
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: accentColor),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Image.asset(
                  'assets/images/staff/dawd.png',
                  height: 60,
                  width: 60,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: new Text(
                      'مسير الشؤون المالية',
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: fontColor),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 100),
                    child: new Text(
                      '  إبراهيم أيت شعيب',
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: accentColor),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Image.asset(
                  'assets/images/staff/brahimaitchaib.png',
                  height: 60,
                  width: 60,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: new Text(
                      'الكاتب و المنسق',
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: fontColor),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 100),
                    child: new Text(
                      'عبد الله فقير',
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: accentColor),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Image.asset(
                  'assets/images/staff/fakirabdellah.png',
                  height: 60,
                  width: 60,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: new Text(
                      'نائب الكاتب و المنسق ',
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: fontColor),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 100),
                    child: new Text(
                      'إبراهيم اعباش',
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: accentColor),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Image.asset(
                  'assets/images/staff/aabache.png',
                  height: 60,
                  width: 60,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('2019-2021',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w100,
                    color: fontColor)),
            Text('EJI Staff'.tr,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: fontColor)),
          ],
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          new Image.asset(
            'assets/images/login.png',
            fit: BoxFit.fill,
          ),
          Center(
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildPresident(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _buildDirectory(),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _buildTechnicalStuff(),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _buildCouncellors(),
                ),
                SizedBox(
                  height: 60,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
