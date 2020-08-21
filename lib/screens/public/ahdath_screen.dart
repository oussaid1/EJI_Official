import 'package:EJI/model/ahdath_events.dart';
import 'package:EJI/repository/cloud_database.dart';
import 'package:EJI/settings/params.dart';
import 'package:flutter/material.dart';
import 'package:flutter_timeline/defaults.dart';
import 'package:flutter_timeline/event_item.dart';
import 'package:flutter_timeline/timeline.dart';
import 'package:flutter_timeline/timeline_theme.dart';
import 'package:flutter_timeline/timeline_theme_data.dart';
import 'package:get/get.dart';

class AhdathScreen extends StatefulWidget {
  const AhdathScreen({
    Key key,
  }) : super(key: key);

  @override
  _AhdathState createState() => _AhdathState();
}

class _AhdathState extends State<AhdathScreen> {
  CloudDatabase c = Get.put(CloudDatabase());
  List<AhdathModel> listano;
  AhdathModel ahdathModel;
  List<TimelineEventDisplay> _events = [];
 

  void addAhdaths() {
    AhdathModel a = new AhdathModel(
      title: 'Hi Am hre ',
      description: 'this is looking oo',
      dueDate: '02-08-2020',
      isDone: true,
      responsible: 'Prsident',
      status: 'in Progress',
    );
    c.addAhdath(a);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            addAhdaths();
           
          });
        },
        child: Icon(Icons.add),
      ), // This
      appBar: AppBar(),
      body: StreamBuilder(
          stream: c.getAhdath(),
          builder: (context, AsyncSnapshot<List<AhdathModel>> ahdathSnapshot) {
            if (ahdathSnapshot.hasError || !ahdathSnapshot.hasData) {
              return Center(
                  child: Container(
                child: Icon(
                  Icons.clear_all,
                  size: 50,
                ),
              ));
            } else {
              listano = ahdathSnapshot.data;
              for (var i = 0; i < ahdathSnapshot.data.length; i++) {
                _events.insert(
                    0,
                    TimelineEventDisplay(
                        child: TimelineEventCard(
                          title: Text("${listano[i].title}"),
                          content: Text("${listano[i].description}"),
                        ),
                        indicator: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: accentColor),
                            child: IconButton(
                                icon: Icon(
                                  Icons.calendar_today,
                                  color: Colors.black,
                                ),
                                onPressed: null))));
              }
              return ListView(
                children: [
                  TimelineTheme(
                      data: TimelineThemeData(lineColor: accentColor),
                      child: Timeline(
                        indicatorSize: 54,
                        events: _events,
                      )),
                ],
              );
            }
          }),
    );
  }
}
