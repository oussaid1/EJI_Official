import 'package:EJI/models/ahdath_events.dart';
import 'package:EJI/repository/cloud_database.dart';
import 'package:EJI/controllers/variables_controler.dart';
import 'package:EJI/screens/admin_access/add_ahdath.dart';
import 'package:EJI/settings/params.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeline_tile/timeline_tile.dart';

class AhdathScreen extends StatefulWidget {
  const AhdathScreen({
    Key key,
  }) : super(key: key);

  @override
  _AhdathState createState() => _AhdathState();
}

class _AhdathState extends State<AhdathScreen> {
  final varController = Get.put(VariablesControler());
  final db = Get.put(CloudDatabase());
  List<AhdathModel> listano;
  AhdathModel ahdathModel;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: varController.isAdmin.value
            ? FloatingActionButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  20.0)), //this right here
                          child: AddAhdath(),
                        );
                      });
                },
                child: Icon(Icons.add),
              )
            : new Container(), // This
        appBar: AppBar(),
        body: StreamBuilder(
            stream: db.getAhdath(),
            builder:
                (context, AsyncSnapshot<List<AhdathModel>> ahdathSnapshot) {
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

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                      itemCount: listano != null ? listano.length : 0,
                      itemBuilder: (BuildContext context, index) {
                        AhdathModel ahdathModel = listano[index];
                        return TimelineTile(
                          isLast: false,
                          indicatorStyle: IndicatorStyle(
                              width: 50,
                              color: primaryColor,
                              iconStyle: IconStyle(
                                  iconData: Icons.calendar_today,
                                  fontSize: 20,
                                  color: accentColor)),
                          afterLineStyle: const LineStyle(
                            color: primaryColor,
                          ),
                          beforeLineStyle: const LineStyle(
                            color: primaryColor,
                          ),
                          hasIndicator: true,
                          lineXY: 0.64,
                          alignment: TimelineAlign.manual,
                          startChild: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 6, 4, 2),
                            child: new Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  border: Border.all(color: orange)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                      "${ahdathModel.title}",
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(
                                          height:
                                              1.2, // the height between text, default is null
                                          letterSpacing: 1.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 22),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                      "${ahdathModel.description}",
                                      textDirection: TextDirection.rtl,
                                      textAlign: TextAlign.justify,
                                      maxLines: 10,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          endChild: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                new Text(
                                  "${ahdathModel.dueDate}",
                                  maxLines: 10,
                                  style: TextStyle(
                                      color: primaryColor, fontSize: 14),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Text(
                                        "${ahdathModel.status0}",
                                        textDirection: TextDirection.rtl,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.red[300],
                                            fontSize: 14),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Text(
                                        "${ahdathModel.status}",
                                        textDirection: TextDirection.rtl,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: accentColor, fontSize: 14),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                );
              }
            }));
  }
}
