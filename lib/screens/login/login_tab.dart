
import 'package:EJI/settings/params.dart';
import 'package:flutter/material.dart';

import 'sign_in.dart';
import 'sign_up.dart';

class LoginTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: primaryColor,

        appBar: AppBar(
          leading: new Container(),
          backgroundColor: Colors.white.withOpacity(0.0),
          elevation: 0,
          bottom: TabBar(
            tabs: [

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Sign in',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: accentColor)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Sign up',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: accentColor)),),

            ],
          ),
        ),
        body: TabBarView(
          children: [
            SignInScreen(),
            SignupPage(),

          ],
        ),
      ),
    );
  }
}
