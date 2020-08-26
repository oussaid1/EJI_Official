import 'package:EJI/models/ahdath_events.dart';
import 'package:EJI/repository/cloud_database.dart';
import 'package:EJI/settings/params.dart';
import 'package:flutter/material.dart';
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
      backgroundColor: secondaryColor,
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
              _events.clear();
              for (var i = 0; i < ahdathSnapshot.data.length; i++) {
                _events.insert(
                    0,
                    TimelineEventDisplay(
                        child: TimelineEventCard(
                          title: Text(
                            "${listano[i].title}",
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                          content: Column(
                            children: [
                              Text(
                                "${listano[i].description}",
                                maxLines: 10,
                              ),
                              Text(
                                "${listano[i].status}",
                                style: TextStyle(
                                    color: Colors.red[300], fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                        indicator: Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: primaryColor),
                        )));
              }
              return ListView(
                children: [
                  TimelineTheme(
                      data: TimelineThemeData(lineColor: Colors.grey[600]),
                      child: Timeline(
                        indicatorSize: 20,
                        events: _events,
                      )),
                ],
              );
            }
          }),
    );
  }
}
