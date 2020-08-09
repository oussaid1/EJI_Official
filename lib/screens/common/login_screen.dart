import 'package:EJI/model/club_expenses.dart';
import 'package:EJI/repository/cloud_database.dart';
import 'package:EJI/screens/common/team_home.dart';
import 'package:EJI/settings/params.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
  }

  final CloudDatabase c = Get.put(CloudDatabase());

  final _loginformKey1 = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();

  int ab = 12;

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
               
                height: Get.height/2,
                child: ListView(
                  children: <Widget>[
                    Align(
                        alignment: Alignment.topCenter,
                        child: Text('Sign In', style: maintext5)),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        style: maintext3b,
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
                            floatingLabelBehavior:FloatingLabelBehavior.always,
                            labelStyle: subtext5x,
                            focusColor: accentColor2,
                            hintStyle: hinttext,
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
                                  color: accentColor2,
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
                        style: maintext3b,
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
                            floatingLabelBehavior:FloatingLabelBehavior.always,
                            labelStyle: subtext5x,
                            focusColor: accentColor2,
                            hintStyle: hinttext,
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
                                  color: accentColor2,
                                  style: BorderStyle.solid,
                                  width: 1),
                            ),
                            contentPadding: EdgeInsets.only(left: 2)),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                     
                      height: 70,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: new RaisedButton(
                          elevation: 5.0,
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10.0)),
                          color: accentColor3,
                          child: new Text('LOGIN',
                              style: new TextStyle(
                                  fontFamily: 'RobotoSlab',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30.0,
                                  color: primaryColor)),
                          onPressed: () => {
                            if (emailController.text.trim() ==
                                    c.adminEmail.value.toString() &&
                                passController.text.trim() ==
                                    c.adminPassword.value.toString())
                              {
                                c.setAdmin(true),
                                Get.to(TeamHomePage()),
                              }
                            else if (_loginformKey1.currentState.validate())
                              {
                                if (emailController.text.trim() ==
                                        c.email.value.toString() &&
                                    passController.text.trim() ==
                                        c.password.value.toString())
                                  {
                                    c.setAdmin(false),
                                    Get.to(TeamHomePage()),
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
