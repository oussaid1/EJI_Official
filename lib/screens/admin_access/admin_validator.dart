import 'package:EJI/settings/params.dart';
import 'package:flutter/material.dart';

class AdminValidator extends StatefulWidget {
  AdminValidator({Key key, this.callback, this.password});
  final VoidCallback callback;
  final String password;
  @override
  _AdminValidatorState createState() => _AdminValidatorState();
}

class _AdminValidatorState extends State<AdminValidator> {
  final GlobalKey<FormState> trainingformKey = GlobalKey();
  final TextEditingController titleControler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      children: [
        Container(
          width: 300,
          height: 460,
          color: secondaryColor,
          child: Column(
            children: [
              Container(
                color: secondaryColor,
                height: 40,
                child: Text(
                  'passss',
                  style: TextStyle(fontSize: 18, backgroundColor: fontColor),
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 60,
                        height: 60,
                        child: RaisedButton(
                            onPressed: () {},
                            child: Text(
                              '1',
                              style: TextStyle(
                                  fontSize: 18,
                                  backgroundColor: fontColor,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 60,
                        height: 60,
                        child: RaisedButton(
                            onPressed: () {},
                            child: Text(
                              '1',
                              style: TextStyle(
                                  fontSize: 18,
                                  backgroundColor: fontColor,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 60,
                        height: 60,
                        child: RaisedButton(
                            onPressed: () {},
                            child: Text(
                              '1',
                              style: TextStyle(
                                  fontSize: 18,
                                  backgroundColor: fontColor,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
