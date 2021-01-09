import 'package:EJI/controllers/auth/auth_controler.dart';
import 'package:EJI/repository/cloud_database.dart';
import 'package:EJI/screens/login/root.dart';
import 'package:EJI/screens/login/sign_up.dart';
import 'package:EJI/settings/params.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progress_dialog/progress_dialog.dart';

class SignInScreen extends GetWidget<AuthController> {


  final  db = CloudDatabase();
  final _loginFormKey2 = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();





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

          Column(
            children: [
              SizedBox(height: 50),
              Align(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  'assets/images/ejilogo.png',
                  height: 80,
                  width: 80,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(height: 20),
              Form(
                key: _loginFormKey2,
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: primaryColor.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: Get.width - 40,
                    height: 360,
                    child: ListView(
                      children: <Widget>[

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
                              }
                              return null;
                            },
                            controller: _passController,
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
                                child: new Text('Sign in',
                                    style: new TextStyle(
                                        fontFamily: 'RobotoCondensed',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 26.0,
                                        color: primaryColor)),
                                onPressed: (){
                                 if (_loginFormKey2.currentState
                                      .validate()) {
                                     controller.login(
                                      _emailController.text.trim(),
                                      _passController.text.trim(),
                                    );
                                  }
                                 Get.to(Root());
                                 print(controller.user.email);
                                }),
                          ),
                        ),
                        Container(
                            width: Get.width - 40,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 18.0),
                                  child: FlatButton(
                                    onPressed: () {
                                      Get.to(SignupPage());
                                    },
                                    child: new Text('ليس لديك حساب سجل الان ',
                                        style: new TextStyle(
                                            fontFamily: 'RobotoCondensed',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 18.0,
                                            color: accentColor)),
                                  ),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 10,
            left: Get.width / 2.5,
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
        ],
      ),
    );
  }


  void showDialogue(BuildContext context) async {
    ProgressDialog pr = ProgressDialog(context);
    pr = ProgressDialog(context,
        type: ProgressDialogType.Normal, isDismissible: false, showLogs: false);
    pr.style(
        message: 'Downloading file...',
        borderRadius: 10.0,
        backgroundColor: Colors.white,
        progressWidget: CircularProgressIndicator(),
        elevation: 10.0,
        insetAnimCurve: Curves.easeInOut,
        progress: 0.0,
        maxProgress: 100.0,
        progressTextStyle: TextStyle(
            color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
        messageTextStyle: TextStyle(
            color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600));

    pr.show().then((value) =>
        controller.isSignedIn.value ? pr.hide() : pr.update(message: 'taking long'));
  }
}
