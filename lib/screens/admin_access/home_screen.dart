import 'dart:math';
import 'dart:ui';

import 'package:EJI/model/club_expenses.dart';
import 'package:EJI/repository/cloud_database.dart';
import 'package:EJI/screens/admin_access/admin_drawer.dart';
import 'package:EJI/settings/params.dart';
import 'package:EJI/shared/drawer_main.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {

 
 
  bool isSwitched = false;
   final CloudDatabase c = Get.put(CloudDatabase());
  bool isEconomicMode;
  double limit = 400;
  GetStorage mBox=GetStorage();
  @override
  void initState() {
//mBox.write('adminkey',false).then((value) => isAdmin= mBox != null ? mBox.read('adminkey') :true);
 
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      backgroundColor: primaryColor,
      drawer:c.isAdmin.value? AdminDrawer():MyDrawer(),
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
               
            },
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height,
                  child: Image.asset(
                    'assets/images/field.png',
                    fit: BoxFit.fill,
                  ),
                ),
                Row(
                  children: [
                    buildPositioned(),
                    buildPositioned(),
                    buildPositioned(),
                  ],
                ),
              ],
            ),
          ),
          Center(
            child: Transform(
                transform: Matrix4.translationValues(2, 2, 3),
                child: CircleAvatar()),
          ),
        ],
      ),
    );
  }

  Container buildPositioned() {
    return Container(
      child: Column(
        children: [
          IconButton(
            color: Colors.red[600],
            icon: Icon(
              Icons.person,
              size: 40,
            ),
            onPressed: () {},
          ),
          new Text('Yajor',style: TextStyle(color: Colors.red, fontSize: 23),),
        ],
      ),
    );
  }
}


class ColorGame extends StatefulWidget {
  ColorGame({Key key}) : super(key: key);

  createState() => ColorGameState();
}

class ColorGameState extends State<ColorGame> {
  /// Map to keep track of score
  final Map<String, bool> score = {};

  /// Choices for game
  final Map choices = {
    '🍏': Colors.green,
    '🍋': Colors.yellow,
    '🍅': Colors.red,
    '🍇': Colors.purple,
    '🥥': Colors.brown,
    '🥕': Colors.orange
  };

  // Random seed to shuffle order of items.
  int seed = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Score ${score.length} / 6'),
          backgroundColor: Colors.pink),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          setState(() {
            score.clear();
            seed++;
          });
        },
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: choices.keys.map((emoji) {
                return Draggable<String>(
                  data: emoji,
                  child: Emoji(emoji: score[emoji] == true ? '✅' : emoji),
                  feedback: Emoji(emoji: emoji),
                  childWhenDragging: Emoji(emoji: '🌱'),
                );
              }).toList()),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
                choices.keys.map((emoji) => _buildDragTarget(emoji)).toList()
                  ..shuffle(Random(seed)),
          )
        ],
      ),
    );
  }

  Widget _buildDragTarget(emoji) {
    return DragTarget<String>(
      builder: (BuildContext context, List<String> incoming, List rejected) {
        if (score[emoji] == true) {
          return Container(
            color: Colors.white,
            child: Text('Correct!'),
            alignment: Alignment.center,
            height: 80,
            width: 200,
          );
        } else {
          return Container(color: choices[emoji], height: 80, width: 200);
        }
      },
      onWillAccept: (data) => data == emoji,
      onAccept: (data) {
        setState(() {
          score[emoji] = true;
          plyr.play('success.mp3');
        });
      },
      onLeave: (data) {},
    );
  }
}

class Emoji extends StatelessWidget {
  Emoji({Key key, this.emoji}) : super(key: key);

  final String emoji;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        alignment: Alignment.center,
        height: 50,
        padding: EdgeInsets.all(10),
        child: Text(
          emoji,
          style: TextStyle(color: Colors.black, fontSize: 50),
        ),
      ),
    );
  }
}

AudioCache plyr = AudioCache();
