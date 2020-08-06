import 'package:EJI/repository/cloud_database.dart';
import 'package:EJI/screens/common/home_screen.dart';
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
          Center(
            child: Container(
              width: 380,
              height: 600,
              child: Card(
                elevation: 8,
                color: primaryColor.withOpacity(0.7),
                child: ListView(
                  children: <Widget>[
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: new Image(
                          image: new AssetImage('assets/images/logo.png'),
                          width: 140,
                          height: 140,
                          fit: BoxFit.scaleDown,
                          alignment: Alignment.center,
                        ),
                      ),
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        color: primaryColorShade.withOpacity(0.2),
                      ),
                      width: 140,
                      height: 140,
                      alignment: Alignment.center,
                    ),
                    Container(
                      child: Form(
                        key: _loginformKey1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8.0, left: 4, right: 4, bottom: 2),
                                  child: Text(
                                    'Email',
                                    style: subtext2,
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: primaryColorShade,
                                    border: Border.all(color: secondaryColor),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6.0)),
                                  ),
                                  width: 340,
                                  height: 50,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.email,
                                          size: 28,
                                          color: primaryColor,
                                        ),
                                      ),
                                      Expanded(
                                        child: TextFormField(
                                          style: subtext3,
                                          validator: (text) {
                                            if (text.isEmpty) {
                                              return 'emailempty'.tr;
                                            }
                                            return null;
                                          },
                                          controller: emailController,
                                          autofocus: true,
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'emailempty.tr',
                                              focusColor: secondaryColor,
                                              hintStyle: hinttext,
                                              contentPadding:
                                                  EdgeInsets.only(left: 2)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8.0, left: 4, right: 4, bottom: 2),
                                  child: Text(
                                    'Password',
                                    style: subtext2,
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: primaryColorShade,
                                    border: Border.all(color: secondaryColor),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6.0)),
                                  ),
                                  width: 340,
                                  height: 50,
                                  child: Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.lock,
                                          size: 28,
                                          color: primaryColor,
                                        ),
                                      ),
                                      Expanded(
                                        child: TextFormField(
                                          style: subtext3,
                                          obscureText: true,
                                          controller: passController,
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'passempty'.tr;
                                            } else
                                              return null;
                                          },
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'passempty'.tr,
                                              hintStyle: hinttext,
                                              contentPadding:
                                                  EdgeInsets.all(4)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              width: 340,
                              height: 50,
                              child: new RaisedButton(
                                elevation: 5.0,
                                shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(6.0)),
                                color: secondaryColor,
                                child: new Text('LOGIN',
                                    style: new TextStyle(
                                        fontFamily: 'RobotoSlab',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30.0,
                                        color: primaryColor)),
                                onPressed: () => {
                                  if (emailController.text ==
                                          c.adminEmail.value.toString() &&
                                      passController.text ==
                                          c.adminPassword.value.toString())
                                    {
                                      c.setAdmin(true),
                                      Get.to(HomePage()),
                                    }
                                  else if (_loginformKey1.currentState
                                      .validate())
                                    {
                                      if (emailController.text ==
                                              c.email.value.toString() &&
                                          passController.text ==
                                              c.password.value.toString())
                                        {
                                          Get.to(HomePage()),
                                        }
                                      else
                                        {
                                          Get.snackbar(c.email.value.toString(),
                                              'loginnot'.tr,
                                              snackPosition:
                                                  SnackPosition.BOTTOM,
                                              backgroundColor: secondaryColor,
                                              colorText: primaryColor)
                                        }
                                    },
                                },
                              ),
                            ),
                          ],
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
