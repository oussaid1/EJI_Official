import 'package:EJI/models/ahdath_events.dart';
import 'package:EJI/repository/cloud_database.dart';
import 'package:EJI/settings/params.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;

// ignore: must_be_immutable
class AddAhdath extends StatefulWidget {
  AddAhdath({Key key}) : super(key: key);

  @override
  _AddAhdathState createState() => _AddAhdathState();
}

class _AddAhdathState extends State<AddAhdath> {
  final TextEditingController _subjectControler = TextEditingController();
  final TextEditingController textCommentControler = TextEditingController();
  final TextEditingController byCommentControler = TextEditingController();
  final TextEditingController dueDateController = TextEditingController();
  final TextEditingController statusController = TextEditingController();
  final TextEditingController status0Controller = TextEditingController();
  DateTime nowDate = new DateTime.now();
  final intl.DateFormat mformatter = intl.DateFormat('yyyy-MM-dd');
  final GlobalKey<FormState> _commentformKey = GlobalKey<FormState>();
  final CloudDatabase cv = Get.put(CloudDatabase());
  DateTime selectedDate = new DateTime.now();
  bool isDone = false;
  String _status = '', _status0 = '';
  final intl.DateFormat formatter = intl.DateFormat('yyyy-MM-dd');
  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(1980),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        dueDateController.text = formatter.format(picked);
      });
    }
  }

  void _addAhdaths() {
    if (isDone) {
      _status = 'تم إنجازه';
      _status0 = '';
    } else {
      _status0 = 'لم يتم إنجازه بعد';
      _status = '';
    }
    AhdathModel a = new AhdathModel(
      title: _subjectControler.text.toString(),
      creationDate: mformatter.format(nowDate),
      description: textCommentControler.text.toString(),
      dueDate: '27-08-2020',
      isDone: false,
      responsible: byCommentControler.text.toString(),
      status: _status,
      status0: _status0,
    );
    cv.addAhdath(a);
  }

  Widget _buildSubject() {
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
              return ('اظف العنوان'.tr);
            }
            return null;
          },
          controller: _subjectControler,
          autofocus: true,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: ('اظف العنوان'.tr),
              focusColor: secondaryColor,
              hintStyle: TextStyle(
                  fontSize: 14, fontWeight: FontWeight.w200, color: fontColor),
              contentPadding: EdgeInsets.only(left: 2)),
        ),
      ),
    );
  }

  Widget _buildCommentText() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(6)),
        color: primaryColor,
      ),
      width: 300,
      height: 120,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: TextFormField(
          maxLines: 8,
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w400, color: fontColor),
          validator: (text) {
            if (text.isEmpty) {
              return (' وصف البرنامج'.tr);
            }
            return null;
          },
          controller: textCommentControler,
          autofocus: true,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: ('اظف وصف البرنامج'.tr),
              focusColor: secondaryColor,
              hintStyle: TextStyle(
                  fontSize: 14, fontWeight: FontWeight.w200, color: fontColor),
              contentPadding: EdgeInsets.only(left: 2)),
        ),
      ),
    );
  }

  Widget _buildBy() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: primaryColor,
      ),
      width: 300,
      height: 50,
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: TextFormField(
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w400, color: fontColor),
          validator: (text) {
            if (text.isEmpty) {
              return ('insertYourname'.tr);
            }
            return null;
          },
          controller: byCommentControler,
          autofocus: true,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: ('insertYourname'.tr),
              focusColor: secondaryColor,
              hintStyle: TextStyle(
                  fontSize: 14, fontWeight: FontWeight.w200, color: fontColor),
              contentPadding: EdgeInsets.only(left: 2)),
        ),
      ),
    );
  }

  Widget _buildStatus(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: primaryColor,
        ),
        width: 300,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                icon: Icon(Icons.calendar_today),
                onPressed: () {
                  _selectDate(context);
                }),
            Row(
              children: [
                isDone
                    ? new Text(
                        'تم إنجازه',
                        style: TextStyle(fontSize: 16, color: accentColor),
                      )
                    : new Text(
                        'لم يتم إنجازه بعد',
                        style: TextStyle(fontSize: 16, color: orange),
                      ),
                new Switch(
                    inactiveTrackColor: secondaryColor,
                    value: isDone,
                    onChanged: (value) {
                      setState(() {
                        isDone = value;
                      });
                    }),
              ],
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          child: Form(
            key: _commentformKey,
            child: Column(
              children: [
                SizedBox(
                  height: 8,
                ),
                _buildSubject(),
                SizedBox(
                  height: 4,
                ),
                _buildCommentText(),
                SizedBox(
                  height: 4,
                ),
                _buildBy(),
                SizedBox(
                  height: 4,
                ),
                _buildStatus(context),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: 300,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    color: orange,
                    child: Text('Save',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: primaryColor)),
                    onPressed: () {
                      if (_commentformKey.currentState.validate()) {
                        _addAhdaths();
                        _flushAll();
                        Get.snackbar('Succsess'.tr, 'Saved'.tr,
                            snackPosition: SnackPosition.BOTTOM);
                      } else {
                        Get.snackbar('Error'.tr, 'notsaved'.tr,
                            snackPosition: SnackPosition.BOTTOM);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  _flushAll() {
    _subjectControler.clear();
    textCommentControler.clear();
    byCommentControler.clear();
  }
}
