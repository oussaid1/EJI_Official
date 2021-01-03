import 'package:EJI/repository/cloud_database.dart';
import 'package:EJI/repository/variables_controler.dart';
import 'package:EJI/settings/params.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminValidator extends StatefulWidget {
  AdminValidator({
    Key key,
    @required this.callback,
  });
  final VoidCallback callback;

  @override
  _AdminValidatorState createState() => _AdminValidatorState();
}

class _AdminValidatorState extends State<AdminValidator> {
  final db = Get.put(CloudDatabase());
  final varController = Get.put(VariablesControler());
  final GlobalKey<FormState> validatorformKey = GlobalKey();
  final TextEditingController passControler = TextEditingController();

  bool isValid = false;
  @override
  void initState() {
    passControler.addListener(() {
      if (passControler.text.trim() == varController.superAdminPass.value) {
        widget.callback();

        varController.isValid.value = true;
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    varController.isValid.value = false;

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(6),
      child: Center(
        child: Container(
          width: 300,
          height: 400,
          child: Column(
            children: [
              Container(
                width: 200,
                height: 40,
                decoration: BoxDecoration(),
                child: Form(
                  key: validatorformKey,
                  child: TextFormField(
                    readOnly: true,
                    onChanged: (value) {
                      Get.snackbar('$value', 'Not Verified !');
                      print('object');
                    },
                    maxLines: 1,
                    controller: passControler,
                    obscureText: true,
                    style: TextStyle(
                      fontSize: 44,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 60,
                      height: 60,
                      child: RaisedButton(
                          color: accentColor,
                          onPressed: () {
                            passControler.text = passControler.text + '1';
                          },
                          child: Text(
                            '1',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 60,
                      height: 60,
                      child: RaisedButton(
                          color: accentColor,
                          onPressed: () {
                            passControler.text = passControler.text + '2';
                          },
                          child: Text(
                            '2',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 60,
                      height: 60,
                      child: RaisedButton(
                          color: accentColor,
                          onPressed: () {
                            passControler.text = passControler.text + '3';
                          },
                          child: Text(
                            '3',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          )),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 60,
                      height: 60,
                      child: RaisedButton(
                          color: accentColor,
                          onPressed: () {
                            passControler.text = passControler.text + '4';
                          },
                          child: Text(
                            '4',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 60,
                      height: 60,
                      child: RaisedButton(
                          color: accentColor,
                          onPressed: () {
                            passControler.text = passControler.text + '5';
                          },
                          child: Text(
                            '5',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 60,
                      height: 60,
                      child: RaisedButton(
                          color: accentColor,
                          onPressed: () {
                            passControler.text = passControler.text + '6';
                          },
                          child: Text(
                            '6',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          )),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 60,
                      height: 60,
                      child: RaisedButton(
                          color: accentColor,
                          onPressed: () {
                            passControler.text = passControler.text + '7';
                          },
                          child: Text(
                            '7',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 60,
                      height: 60,
                      child: RaisedButton(
                          color: accentColor,
                          onPressed: () {
                            passControler.text = passControler.text + '8';
                          },
                          child: Text(
                            '8',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 60,
                      height: 60,
                      child: RaisedButton(
                          color: accentColor,
                          onPressed: () {
                            passControler.text = passControler.text + '9';
                          },
                          child: Text(
                            '9',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          )),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        width: 60,
                        height: 60,
                        child: Obx(
                          () => Icon(
                            Icons.check,
                            size: 40,
                            color: varController.isValid.value
                                ? accentColor
                                : Colors.grey,
                          ),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 60,
                      height: 60,
                      child: RaisedButton(
                          color: accentColor,
                          onPressed: () {
                            passControler.text = passControler.text + '0';
                          },
                          child: Text(
                            '0',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 60,
                      height: 60,
                      child: RaisedButton(
                          color: Colors.white,
                          onPressed: () {
                            Navigator.pop(context);
                            passControler.clear();
                          },
                          child: Icon(Icons.backspace)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
