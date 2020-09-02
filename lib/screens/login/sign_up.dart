import 'package:EJI/repository/cloud_database.dart';
import 'package:EJI/screens/login/sign_in.dart';
import 'package:EJI/settings/params.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

/// Entrypoint example for registering via Email/Password.
class RegisterPage extends StatefulWidget {
  /// The page title.
  final String title = 'التسجيل';

  @override
  State<StatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final CloudDatabase c = Get.put(CloudDatabase());
  final _loginformKey1 = GlobalKey<FormState>();

  bool _success = false;
  String _userEmail;

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
            top: 50,
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
                          } else if (GetUtils.isEmail(text)) {
                            return ('email not valid'.tr);
                          }
                          return null;
                        },
                        controller: _emailController,
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
                          } else if (text.trim().length < 4 ||
                              text.trim().length > 8) {
                            return ('8 حروف'.tr);
                          }
                          return null;
                        },
                        controller: _passwordController,
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
                          color: fontColor,
                          child: new Text('Submit',
                              style: new TextStyle(
                                  fontFamily: 'RobotoCondensed',
                                  fontWeight: FontWeight.w800,
                                  fontSize: 30.0,
                                  color: primaryColor)),
                          onPressed: () => {
                            if (_emailController.text.trim() ==
                                    c.adminEmail.value.toString() &&
                                _passwordController.text.trim() ==
                                    c.adminPassword.value.toString())
                              {
                                _register(),
                                Get.to(SignInScreen()),
                              }
                            else
                              {
                                _success
                                    ? Get.snackbar(
                                        'Success'.tr, 'Saved as : $_userEmail',
                                        snackPosition: SnackPosition.BOTTOM,
                                        backgroundColor: secondaryColor,
                                        colorText: accentColor)
                                    : Get.snackbar('Alert'.tr, 'loginnot'.tr,
                                        snackPosition: SnackPosition.BOTTOM,
                                        backgroundColor: secondaryColor,
                                        colorText: accentColor),
                              }
                          },
                        ),
                      ),
                    ),
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

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Example code for registration.
  void _register() async {
    final FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    ))
        .user;
    if (user != null) {
      setState(() {
        _success = true;
        _userEmail = user.email;
      });
    } else {
      _success = false;
    }
  }
}
