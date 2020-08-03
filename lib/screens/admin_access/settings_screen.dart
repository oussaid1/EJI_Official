import 'package:EJI/settings/params.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final TextEditingController familyQuota = TextEditingController();
  final TextEditingController economicQuota = TextEditingController();
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController passwordConfirm = TextEditingController();
  final TextEditingController paidAmmount = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: ListView(children: <Widget>[
        Column(
          children: <Widget>[
            new Text(
              'Settings',
              style: maintext2,
            ),
            buildQuota(),
            buildUserCred(),
            buildPay(),
          ],
        )
      ]),
    );
  }

  Container buildQuota() {
    return new Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: primaryColorShade),
      margin: EdgeInsets.fromLTRB(8, 4, 8, 4),
      alignment: Alignment.topCenter,
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 4, left: 4, right: 4),
            child: new Text(
              'Quota',
              style: maintext3,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: new Text(
                  'Setting the limit ammount\n for family mode',
                  style: hinttext,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  width: 200,
                  height: 50,
                  child: new TextFormField(
                    controller: familyQuota,
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    style: subtext2,
                    decoration: InputDecoration(
                        prefixIcon:
                            Icon(Icons.money_off, color: secondaryColor),
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.clear,
                            color: secondaryColor,
                          ),
                          onPressed: () {
                            setState(() {});
                          },
                        ),
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
                        labelText: '\$ 400',
                        labelStyle: hinttext),
                    validator: (value) {
                      if (value.length == 0) {
                        return 'please insert numbers';
                      } else
                        return null;
                    },
                    onSaved: (value) {
                      setState(() {});
                    },
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: new Text(
                  'Setting the limit ammount\n for Economic mode',
                  style: hinttext,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  width: 200,
                  height: 50,
                  child: new TextFormField(
                    controller: economicQuota,
                    style: subtext2,
                    decoration: InputDecoration(
                        prefixIcon:
                            Icon(Icons.money_off, color: secondaryColor),
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.clear,
                            color: secondaryColor,
                          ),
                          onPressed: () {
                            setState(() {});
                          },
                        ),
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
                        labelText: '\$ 800',
                        labelStyle: hinttext),
                    validator: (value) {
                      if (value.length == 0) {
                        return 'insert numbers';
                      } else
                        return null;
                    },
                    onSaved: (value) {
                      setState(() {});
                    },
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: 400,
            child: new RaisedButton(
              elevation: 5.0,
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0)),
              color: accentColor,
              child: new Text(
                'save',
                style: maintext1,
              ),
              onPressed: () => {},
            ),
          ),
        ],
      ),
    );
  }

  Container buildUserCred() {
    return new Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: primaryColorShade),
      margin: EdgeInsets.fromLTRB(8, 4, 8, 4),
      alignment: Alignment.topCenter,
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 4, left: 4, right: 4),
            child: new Text(
              'admin & password',
              style: maintext2,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: new Text(
                  'Setting the Username ',
                  style: hinttext,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  width: 200,
                  height: 50,
                  child: new TextFormField(
                    controller: username,
                    style: subtext2,
                    decoration: InputDecoration(
                        prefixIcon:
                            Icon(Icons.money_off, color: secondaryColor),
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.clear,
                            color: secondaryColor,
                          ),
                          onPressed: () {
                            setState(() {});
                          },
                        ),
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
                        labelText: 'User Name',
                        labelStyle: hinttext),
                    validator: (value) {
                      if (value.length == 0) {
                        return 'insert name';
                      } else
                        return null;
                    },
                    onSaved: (value) {
                      setState(() {});
                    },
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: new Text(
                  'Setting the Password ',
                  style: hinttext,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  width: 200,
                  height: 50,
                  child: new TextFormField(
                    controller: password,
                    style: subtext2,
                    decoration: InputDecoration(
                        prefixIcon:
                            Icon(Icons.money_off, color: secondaryColor),
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.clear,
                            color: secondaryColor,
                          ),
                          onPressed: () {
                            setState(() {});
                          },
                        ),
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
                        labelText: 'Password ',
                        labelStyle: hinttext),
                    validator: (value) {
                      if (value.length == 0) {
                        return 'insert password';
                      } else
                        return null;
                    },
                    onSaved: (value) {
                      setState(() {});
                    },
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: new Text(
                  'Confirm the Password ',
                  style: hinttext,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  width: 200,
                  height: 50,
                  child: new TextFormField(
                    style: subtext2,
                    decoration: InputDecoration(
                        prefixIcon:
                            Icon(Icons.money_off, color: secondaryColor),
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.clear,
                            color: secondaryColor,
                          ),
                          onPressed: () {
                            setState(() {});
                          },
                        ),
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
                              width: 0.5),
                        ),
                        labelText: 'Confirm Pass ',
                        labelStyle: hinttext),
                    validator: (value) {
                      if (value.length == 0) {
                        return 'insert password';
                      } else if (value != password.text) {
                        return 'passwords don\'t match';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      setState(() {});
                    },
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: 300,
            child: new RaisedButton(
              elevation: 5.0,
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0)),
              color: accentColor,
              child: new Text(
                'save',
                style: maintext1,
              ),
              onPressed: () => {},
            ),
          ),
        ],
      ),
    );
  }

  Container buildPay() {
    return new Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: primaryColorShade),
      margin: EdgeInsets.fromLTRB(8, 4, 8, 4),
      alignment: Alignment.topCenter,
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 4, left: 4, right: 4),
            child: new Text(
              'Payment',
              style: maintext2,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: new Text(
                  'Pay the amount of => ',
                  style: hinttext,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  width: 200,
                  height: 50,
                  child: new TextFormField(
                    controller: username,
                    style: subtext2,
                    decoration: InputDecoration(
                        prefixIcon:
                            Icon(Icons.money_off, color: secondaryColor),
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.clear,
                            color: secondaryColor,
                          ),
                          onPressed: () {
                            setState(() {});
                          },
                        ),
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
                        labelText: 'User Name',
                        labelStyle: hinttext),
                    validator: (value) {
                      if (value.length == 0) {
                        return 'insert name';
                      } else
                        return null;
                    },
                    onSaved: (value) {
                      setState(() {});
                    },
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: new Text(
                  'To the Shop Named =>',
                  style: hinttext,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  width: 200,
                  height: 50,
                  child: new TextFormField(
                    controller: password,
                    style: subtext2,
                    decoration: InputDecoration(
                        prefixIcon:
                            Icon(Icons.money_off, color: secondaryColor),
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.clear,
                            color: secondaryColor,
                          ),
                          onPressed: () {
                            setState(() {});
                          },
                        ),
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
                        labelText: 'Password ',
                        labelStyle: hinttext),
                    validator: (value) {
                      if (value.length == 0) {
                        return 'insert password';
                      } else
                        return null;
                    },
                    onSaved: (value) {
                      setState(() {});
                    },
                  ),
                ),
              ),
            ],
          ),
        
          Container(
            width: 400,
            child: new RaisedButton(
              elevation: 5.0,
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0)),
              color: accentColor,
              child: new Text(
                'Pay',
                style: maintext1,
              ),
              onPressed: () => {},
            ),
          ),
        ],
      ),
    );
  }
}
