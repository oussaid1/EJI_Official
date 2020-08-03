import 'package:EJI/model/player.dart';
import 'package:EJI/settings/params.dart';
import 'package:EJI/shared/drawer_main.dart';
import 'package:flutter/material.dart';

class PlayerDetails extends StatelessWidget {
  final Player player;
   PlayerDetails({Key key, @required this.player});

  

  @override
  Widget build(BuildContext context) {
     if (player == null) {
      return Scaffold(
        backgroundColor: primaryColor,
        drawer: MyDrawer(),
        appBar: AppBar(),
        body: Center(child: CircularProgressIndicator()),
      );
    }
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(),
      backgroundColor: primaryColor,
      body: Stack(
        children: <Widget>[
          Center(
            child: Card(
              elevation: 20,
              color: primaryColorShade,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Container(
                color: primaryColorShade,
                width: MediaQuery.of(context).size.width - 40,
                height: 540,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(40),
                      ),
                      child: Container(
                        color: primaryColorShade,
                        width: 140,
                        height: 140,
                        child: Image.network(
                          'https://i.ibb.co/NrB4QGK/logo.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              flex: 1,
                              child: Text(
                                'Player Name :',
                                style: subtext1,
                              )),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8, right: 4),
                              child: Text(
                                '${player.playerName.toString()}',
                                style: maintext2,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              child: Text(
                            'Date & Place of Birth :',
                            style: subtext1,
                          )),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 4, right: 4),
                              child: Text(
                                '${player.dateOfBirth.toString()}/ ${player.playerName.toString()} ',
                                style: maintext2,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              flex: 1,
                              child: Text(
                                'Email  :',
                                style: subtext1,
                              )),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8, right: 4),
                              child: Text(
                                '${player.email.toString()}',
                                style: maintext2,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              flex: 1,
                              child: Text(
                                'Phone Number :',
                                style: subtext1,
                              )),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8, right: 4),
                              child: Text(
                                '${player.phone.toString()}',
                                style: maintext2,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              flex: 1,
                              child: Text(
                                'Position  :',
                                style: subtext1,
                              )),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8, right: 4),
                              child: Text(
                                '${player.position.toString()}',
                                style: maintext2,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Player Scores :',
                              style: subtext1,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8, right: 4),
                                  child: Container(
                                    width: 160,
                                    height: 40,
                                    color: primaryColor,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        Expanded(
                                          child: Row(
                                            children: <Widget>[
                                              IconButton(
                                                icon: Icon(
                                                  Icons.thumb_down,
                                                  color: accentColor,
                                                ),
                                                onPressed: () {},
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        4, 4, 2, 2),
                                                child: new Text(
                                                  '43',
                                                  textAlign: TextAlign.center,
                                                  style: maintext2,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          children: <Widget>[
                                            new Text(
                                              '65',
                                              textAlign: TextAlign.center,
                                              style: maintext3,
                                            ),
                                            IconButton(
                                                icon: Icon(
                                                  Icons.thumb_up,
                                                  color: secondaryColor,
                                                ),
                                                onPressed: () {}),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ]),
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
