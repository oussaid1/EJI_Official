import 'package:EJI/models/training_day.dart';
import 'package:EJI/repository/cloud_database.dart';
import 'package:EJI/settings/params.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrainingList extends StatefulWidget {
  @override
  _TrainingListState createState() => _TrainingListState();
}

class _TrainingListState extends State<TrainingList> {
  CloudDatabase c = Get.put(CloudDatabase());
  List<TrainingDay> trList = List();
  TrainingDay trainingDay = new TrainingDay(
    attendees: 20,
    count: 1,
    duration: 1,
    responsible: 'Nidhemma',
    trainingDate: '09-09-2020',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: c.isAdmin.value
          ? new FloatingActionButton(
              child: new Icon(
                Icons.add,
                size: 30,
              ),
              onPressed: () {
                c.addTraining(trainingDay);
              })
          : new Container(),
      body: Stack(
        fit: StackFit.expand,
        children: [
          new Image.asset('assets/images/login.png', fit: BoxFit.fill),
          StreamBuilder(
              stream: c.getTrainingDays(),
              builder: (context, AsyncSnapshot<List<TrainingDay>> snapshot) {
                if (!snapshot.hasData || snapshot.hasError) {
                  return new Container();
                } else
                  trList = snapshot.data;
                return new ListView.builder(
                    itemCount: trList != null ? trList.length : 0,
                    itemBuilder: (context, index) {
                      TrainingDay trainingDay = trList[index];
                      return Directionality(
                        textDirection: TextDirection.rtl,
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                                color: primaryColor.withOpacity(0.8)),
                            child: ListTile(
                              leading: Icon(Icons.ac_unit),
                              title: Text(
                                'حصة تدريبية ${trainingDay.trainingDate} ',
                                style: TextStyle(
                                    color: fontColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal),
                                textDirection: TextDirection.rtl,
                              ),
                              subtitle: Text(
                                '${trainingDay.responsible}',
                                style: TextStyle(
                                    color: secondaryColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal),
                                textDirection: TextDirection.rtl,
                              ),
                              trailing: Text(
                                '${trainingDay.attendees}',
                                style: TextStyle(
                                    color: fontColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal),
                                textDirection: TextDirection.rtl,
                              ),
                            ),
                          ),
                        ),
                      );
                    });
              }),
        ],
      ),
    );
  }
}
