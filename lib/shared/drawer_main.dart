import 'package:EJI/screens/admin_access/add_dialogue.dart';
import 'package:EJI/screens/home_screen.dart';
import 'package:EJI/screens/info_screen.dart';
import 'package:EJI/screens/player_list.dart';
import 'package:EJI/screens/splash.dart';
import 'package:EJI/settings/params.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase/firebase.dart';


class MyDrawer extends StatelessWidget {
  const MyDrawer({Key key}) : super(key: key);
Future<Widget> _getImage(BuildContext context, String image) async {
  Image m;
  await FireStorageService.loadImage(context, image).then((downloadUrl) {
    m = Image.network(
      downloadUrl.toString(),
      fit: BoxFit.scaleDown,
    );
  });

  final ref = FirebaseStorage.instance.ref().child('testimage');
// no need of the file extension, the name will do fine.
var url = await ref.getDownloadURL();
print(url);
return m;
}
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            FutureBuilder(
              future: ,
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                return UserAccountsDrawerHeader(
                  accountName: Text("EJI Idawlstane"),
                  accountEmail: Text("ashishrawat2911@gmail.com"),
                  currentAccountPicture: CircleAvatar(
                      backgroundColor:
                          Theme.of(context).platform == TargetPlatform.iOS
                              ? Colors.blue
                              : Colors.white,
                      child: Image.asset('assets/images/logo.png')),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.email),
              subtitle: Text('information about the player and thier position'),
              title: Text('Field info'),
              onTap: () => Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => HomePage()),
              ),
            ),
            ListTile(
              subtitle: Text(' players list and thier info'),
              leading: Icon(Icons.person),
              title: Text('Player List'),
              onTap: () => Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => PlayerList()),
              ),
            ),
            ListTile(
              subtitle: Text(' players list and thier info'),
              leading: Icon(Icons.person_add),
              title: Text('Player Statistics'),
            ),
            ListTile(
              subtitle: Text(
                ' manage players ',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              trailing: Text(
                'staff only',
                style: TextStyle(fontSize: 14, color: Colors.red),
              ),
              leading: Icon(Icons.settings),
              title: Text('Settings '),
              onTap: () => Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => AddPlayers()),
              ),
            ),
            ListTile(
              subtitle: Text(
                ' Player Rating ',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(
                    Icons.star,
                    color: accentColor,
                  ),
                  Icon(
                    Icons.star,
                    color: accentColor,
                  ),
                  Icon(
                    Icons.star,
                    color: accentColor,
                  ),
                ],
              ),
              leading: Icon(Icons.sentiment_satisfied),
              title: Text('Player Scores '),
              onTap: () => Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => AddPlayers()),
              ),
            ),
            ListTile(
              subtitle: Text(' players list and thier info'),
              leading: Icon(Icons.info),
              title: Text('About EJI'),
              onTap: () => Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => InfoScreen()),
              ),
            ),
            ListTile(
              subtitle: Text(' sign out of the app'),
              leading: Icon(Icons.exit_to_app),
              title: Text('Sign Out '),
              onTap: () => Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => SplashPage()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
