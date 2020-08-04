import 'package:EJI/screens/home_screen.dart';
import 'package:EJI/settings/params.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final String email = '1234';
  final String password = '1234';

  final _formKey1 = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: ListView(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 340,
              child: Form(
                key: _formKey1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 30,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(180),
                      ),
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: new Image(
                            image: new AssetImage('assets/images/logo.png'),
                            width: 140,
                            height: 140,
                            color: null,
                            fit: BoxFit.scaleDown,
                            alignment: Alignment.center,
                          ),
                        ),
                        color: primaryColorShade,
                        width: 140,
                        height: 140,
                        alignment: Alignment.center,
                      ),
                    ),
                    
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Email',
                            style: subtext3,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: primaryColorShade,
                            borderRadius:
                                BorderRadius.all(Radius.circular(6.0)),
                          ),
                          width: 340,
                          height: 54,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.email,
                                  size: 28,
                                  color: secondaryColor,
                                ),
                              ),
                              Expanded(
                                child: TextFormField(
                                  style: subtext3,
                                  validator: (text) {
                                    if (text.isEmpty) {
                                      return 'Please enter some text';
                                    } else if (text != email) {
                                      return 'email is not correct ';
                                    }
                                    return null;
                                  },
                                  controller: emailController,
                                  autofocus: true,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Enter your email',
                                      focusColor: secondaryColor,
                                      hintStyle: hinttext,
                                      contentPadding: EdgeInsets.only(left: 2)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Password',
                            style: subtext3,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: primaryColorShade,
                            borderRadius:
                                BorderRadius.all(Radius.circular(6.0)),
                          ),
                          width: 340,
                          height: 54,
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.lock,
                                  size: 28,
                                  color: secondaryColor,
                                ),
                              ),
                              Expanded(
                                                              child: TextFormField(
                                  style: subtext3,
                                  obscureText: true,
                                  controller: passController,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter a valid password';
                                    } else if (value != password) {
                                      return 'password is not correct ';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      
                                      border: InputBorder.none,
                                      hintText: 'Enter your  password',
                                      hintStyle: hinttext,
                                      contentPadding: EdgeInsets.all(4)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 200.0),
                          child: Text(
                            'Forgot Password?',
                            style: subtext2,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Container(
                      width: 340,
                      height: 50,
                      child: new RaisedButton(
                        elevation: 5.0,
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        color: secondaryColor,
                        child: new Text('LOGIN',
                            style: new TextStyle(
                                fontFamily: 'RobotoSlab',
                                fontWeight: FontWeight.bold,
                                fontSize: 30.0,
                                color: primaryColor)),
                        onPressed: () => {
                         
                            Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => HomePage()),
              ),
                        },
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
