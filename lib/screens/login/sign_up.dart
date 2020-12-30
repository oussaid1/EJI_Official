import 'package:EJI/controllers/auth/auth_controler.dart';
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
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final CloudDatabase c = Get.put(CloudDatabase());
  final AuthController dx = Get.put(AuthController());
  final _loginformKey1 = GlobalKey<FormState>();

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
                  color: primaryColor.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(10),
                ),
                width: Get.width - 40,
                height: Get.height / 1.8,
                child: ListView(
                  children: <Widget>[
                    Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          width: 230,
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: fontColor,
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(6),
                                        topLeft: Radius.circular(6))),
                                child: RaisedButton(
                                  elevation: 0,
                                  color: fontColor,
                                  onPressed: () {

                                  },

                                ),
                              ),
                              Container(
                                height: 40,
                                decoration: BoxDecoration(
                                    color: secondaryColor,
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(6),
                                        topRight: Radius.circular(6))),
                                child: RaisedButton(
                                  onPressed: null,
                                  elevation: 0,
                                  color: fontColor,

                                ),
                              ),
                            ],
                          ),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: buildEmailFormField(),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: buildPasswordField(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: buildRePasswordField(),
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
                            if (_loginformKey1.currentState.validate())
                              {
                                _register(),
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

  TextFormField buildEmailFormField() {
    return TextFormField(
      style: TextStyle(
          fontSize: 20, fontWeight: FontWeight.w600, color: fontColor),
      textAlign: TextAlign.center,
      validator: (text) {
        if (text.isEmpty) {
          return ('emailempty'.tr);
        } else if (!GetUtils.isEmail(text)) {
          return ('email not valid'.tr);
        }
        return null;
      },
      controller: _emailController,
      autofocus: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(4.0))),
          hintText: ('emailempty'.tr),
          labelText: 'Email',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w400, color: fontColor),
          focusColor: accentColor,
          hintStyle: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w200, color: fontColor),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
                color: accentColor, style: BorderStyle.solid, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
                color: accentColor, style: BorderStyle.solid, width: 1),
          ),
          contentPadding: EdgeInsets.only(left: 2)),
    );
  }

  TextFormField buildPasswordField() {
    return TextFormField(
      style: TextStyle(
          fontSize: 26, fontWeight: FontWeight.w600, color: fontColor),
      obscureText: true,
      textAlign: TextAlign.center,
      validator: (text) {
        if (text.isEmpty) {
          return ('passempty'.tr);
        } else if (text.trim().length < 4 || text.trim().length > 8) {
          return ('8 حروف'.tr);
        }
        return null;
      },
      controller: _passwordController,
      autofocus: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(4.0))),
          hintText: ('passempty'.tr),
          labelText: 'Password',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w400, color: fontColor),
          focusColor: accentColor,
          hintStyle: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w200, color: fontColor),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
                color: accentColor, style: BorderStyle.solid, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
                color: accentColor, style: BorderStyle.solid, width: 1),
          ),
          contentPadding: EdgeInsets.only(left: 2)),
    );
  }

  TextFormField buildRePasswordField() {
    return TextFormField(
      style: TextStyle(
          fontSize: 26, fontWeight: FontWeight.w600, color: fontColor),
      obscureText: true,
      textAlign: TextAlign.center,
      validator: (text) {
        if (text.isEmpty) {
          return ('passempty'.tr);
        } else if (text.trim().length < 4 || text.trim().length > 8) {
          return ('8 حروف'.tr);
        } else if (text.trim().toString() !=
            _passwordController.text.trim().toString()) {
          return 'غير متطابقان';
        } else
          return null;
      },
      controller: _confirmPasswordController,
      autofocus: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(4.0))),
          hintText: ('passempty'.tr),
          labelText: 'Confirm Password',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w400, color: fontColor),
          focusColor: accentColor,
          hintStyle: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w200, color: fontColor),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
                color: accentColor, style: BorderStyle.solid, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
                color: accentColor, style: BorderStyle.solid, width: 1),
          ),
          contentPadding: EdgeInsets.only(left: 2)),
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
      Get.snackbar('Success', 'registered as ${user.email}');
      Get.to(SignInScreen());
    } else {
      Get.snackbar('Error', 'not registered !');
    }
  }
}
