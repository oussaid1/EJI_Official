import 'package:EJI/models/training_day.dart';
import 'package:EJI/repository/cloud_database.dart';
import 'package:EJI/controllers/variables_controler.dart';
import 'package:EJI/settings/params.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;

class AddTraining extends StatefulWidget {
  @override
  _AddTrainingState createState() => _AddTrainingState();
}

class _AddTrainingState extends State<AddTraining> {
  final VariablesControler varController = Get.put(VariablesControler());
  final CloudDatabase db = Get.put(CloudDatabase());
  final intl.DateFormat mformatter = intl.DateFormat('yyyy-MM-dd');
  final GlobalKey<FormState> trainingformKey = GlobalKey();
  final TextEditingController responsibleControler = TextEditingController();
  final TextEditingController dateControler = TextEditingController();

  final DateTime nowDate = DateTime.now();
  String selectedDate;
  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: nowDate, // Refer step 1
      firstDate: DateTime(1980),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != nowDate) {
      setState(() {
        dateControler.text = mformatter.format(picked);
      });
    }
  }

  _addTraining() {
    TrainingDay trainingDay = new TrainingDay(
      attendees: varController.attendees.value,
      count: 1,
      duration: varController.duration.value,
      responsible: responsibleControler.text.trim(),
      trainingDate: dateControler.text,
    );
   db.addTraining(trainingDay);
  }

  Widget _buildTrainingDate() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: primaryColor,
      ),
      width: 300,
      height: 50,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8),
        child: TextFormField(
          textAlign: TextAlign.center,
          textAlignVertical: TextAlignVertical.center,
          textDirection: TextDirection.rtl,
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w400, color: fontColor),
          validator: (text) {
            if (text.isEmpty) {
              return ('اختر التاريخ');
            }
            return null;
          },
          readOnly: true,
          controller: dateControler,
          decoration: InputDecoration(
              suffixIcon: IconButton(
                  icon: Icon(
                    Icons.calendar_today,
                    color: accentColor,
                  ),
                  onPressed: () {
                    _selectDate(context);
                  }),
              border: InputBorder.none,
              hintText: ('اظف التاريخ'),
              focusColor: secondaryColor,
              hintStyle: TextStyle(
                  fontSize: 14, fontWeight: FontWeight.w100, color: fontColor),
              contentPadding: EdgeInsets.all(8)),
        ),
      ),
    );
  }

  Widget _buildTrResponsible() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: primaryColor,
      ),
      width: 300,
      height: 50,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8),
        child: TextFormField(
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w400, color: fontColor),
          validator: (text) {
            if (text.isEmpty) {
              return ('اظف المسؤول');
            }
            return null;
          },
          controller: responsibleControler,
          autofocus: true,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: ('اظف المسؤول'),
              focusColor: secondaryColor,
              hintStyle: TextStyle(
                  fontSize: 14, fontWeight: FontWeight.w200, color: fontColor),
              contentPadding: EdgeInsets.only(left: 2)),
        ),
      ),
    );
  }

  Widget _buildTDuration() {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: primaryColor,
        ),
        width: 300,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                icon: Icon(
                  FontAwesomeIcons.minus,
                  size: 20,
                  color: secondaryColor,
                ),
                onPressed: () {
                  if (varController.duration.value > 0)
                    varController.duration.value =
                        varController.duration.value - 5;
                }),
            Obx(
              () => Text('${varController.duration.value}',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: whitefontColor)),
            ),
            IconButton(
                icon: Icon(
                  FontAwesomeIcons.plus,
                  size: 20,
                  color: secondaryColor,
                ),
                onPressed: () => varController.duration.value =
                    varController.duration.value + 5),
            Container(
              width: 140,
              child: Text('مدة الحصة بالدقائق',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w200,
                      color: secondaryColor)),
            ),
          ],
        ));
  }

  Widget _buildTAttendees() {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: primaryColor,
        ),
        width: 300,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                icon: Icon(
                  FontAwesomeIcons.minus,
                  size: 20,
                  color: secondaryColor,
                ),
                onPressed: () {
                  if (varController.attendees.value > 0)
                    varController.attendees.value--;
                }),
            Obx(
              () => Text('${varController.attendees.value}',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: whitefontColor)),
            ),
            IconButton(
                icon: Icon(
                  FontAwesomeIcons.plus,
                  size: 20,
                  color: secondaryColor,
                ),
                onPressed: () => varController.attendees.value++),
            Container(
              width: 140,
              child: Text('           عدد الحضور',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w200,
                      color: secondaryColor)),
            ),
          ],
        ));
  }

  _flashAll() {
    dateControler.clear();
    responsibleControler.clear();
    varController.duration.value = 0;
    varController.attendees.value = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: trainingformKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: _buildTrainingDate(),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: _buildTrResponsible(),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: _buildTAttendees(),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: _buildTDuration(),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RaisedButton(
                  color: secondaryColor,
                  child: Text(
                    'Cancel',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              RaisedButton(
                  color: accentColor,
                  child: Text(
                    'Save',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    if (trainingformKey.currentState.validate()) {
                      _addTraining();
                      _flashAll();
                    }
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
