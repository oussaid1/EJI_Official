import 'package:EJI/model/club_expenses.dart';
import 'package:EJI/model/comments_model.dart';
import 'package:EJI/repository/cloud_database.dart';
import 'package:EJI/settings/params.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class AddSpendings extends StatefulWidget {
  AddSpendings({Key key, this.clubSpendings}) : super(key: key);
  final ClubSpendings clubSpendings;
  @override
  _AddSpendingsState createState() => _AddSpendingsState();
}

class _AddSpendingsState extends State<AddSpendings> {
  final TextEditingController spentOnControler = TextEditingController();
  final TextEditingController spentAmountControler = TextEditingController();
  final TextEditingController spentByControler = TextEditingController();
  final TextEditingController spentOnDateController = TextEditingController();
  final DateFormat mformatter = DateFormat('yyyy-MM-dd');
  final GlobalKey<FormState> _commentformKey = GlobalKey();

  String _id;
  String _spentOn;
  String _spentBy;
  String _spentOnDate;
  int _spentAmount;

  final CloudDatabase cv = Get.put(CloudDatabase());
  DateTime selectedDate = new DateTime.now();
  DateTime nowDate = new DateTime.now();
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        _spentOnDate = formatter.format(picked);
        spentOnDateController.text = _spentOnDate;
      });
    }
  }

  _saveToCloud() {
    ClubSpendings clubSpendings = new ClubSpendings(
        spentOn: spentOnControler.text.toString().trim(),
        spentBy: spentByControler.text.trim().toString(),
        spentOnDate: _spentOnDate,
        spentAmount: int.parse(spentAmountControler.text.trim()));

    cv.addSpendings(clubSpendings);
  }
  _updateInCloud() {
    ClubSpendings clubSpendings = new ClubSpendings(
      id: _id,
        spentOn: spentOnControler.text.toString().trim(),
        spentBy: spentByControler.text.trim().toString(),
        spentOnDate: _spentOnDate,
        spentAmount: int.parse(spentAmountControler.text.trim()));

    cv.updateSpendings(clubSpendings);
  }

  Widget _buildSpentOn() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: primaryColor,
      ),
      width: 300,
      height: 50,
      child: TextFormField(
        style: subtext3,
        validator: (text) {
          if (text.isEmpty) {
            return ('insertSpenton'.tr);
          }
          return null;
        },
        controller: spentOnControler,
        autofocus: true,
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.calendar_today,
              color: secondaryColor,
            ),
            border: InputBorder.none,
            hintText: ('insertSpenton'.tr),
            focusColor: secondaryColor,
            hintStyle: hinttext,
            contentPadding: EdgeInsets.all(8)),
      ),
    );
  }

  Widget _buildSpentOnDate(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: primaryColor,
      ),
      width: 300,
      height: 50,
      child: TextFormField(
        readOnly: true,
        controller: spentOnDateController,
        cursorColor: Colors.white,
        style: maintext2,
        decoration: InputDecoration(
            prefixIcon: IconButton(
              icon: Icon(Icons.calendar_today, color: secondaryColor),
              onPressed: () {
                _selectDate(context);
              },
            ),
            hintText: 'DateSpent'.tr,
            hintStyle: hinttext),
        validator: (value) {
          if (value.length == 0) {
            return 'selectDateSpent'.tr;
          } else
            return null;
        },
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
      child: TextFormField(
        style: subtext3,
        validator: (text) {
          if (text.isEmpty) {
            return ('insertYourname'.tr);
          }
          return null;
        },
        controller: spentByControler,
        autofocus: true,
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.calendar_today,
              color: secondaryColor,
            ),
            border: InputBorder.none,
            hintText: ('insertYourname'.tr),
            focusColor: secondaryColor,
            hintStyle: hinttext,
            contentPadding: EdgeInsets.all(8)),
      ),
    );
  }

  Widget _buildspentAmount() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: primaryColor,
      ),
      width: 300,
      height: 50,
      child: TextFormField(
        keyboardType: TextInputType.number,
        style: subtext3,
        validator: (text) {
          if (text.isEmpty) {
            return ('inserAmountSpentiMad'.tr);
          }

          return null;
        },
        controller: spentAmountControler,
        autofocus: true,
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.calendar_today,
              color: secondaryColor,
            ),
            border: InputBorder.none,
            hintText: ('inserAmountSpentiMad'.tr),
            focusColor: secondaryColor,
            hintStyle: hinttext,
            contentPadding: EdgeInsets.all(8)),
      ),
    );
  }

  @override
  void initState() {
    if (widget.clubSpendings != null) {
      _id=widget.clubSpendings.id;
      spentOnControler.text = widget.clubSpendings.spentOn;
      spentOnDateController.text = widget.clubSpendings.spentOn;
      spentAmountControler.text = widget.clubSpendings.spentOn;
      spentByControler.text = widget.clubSpendings.spentOn;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _commentformKey,
        child: ListView(
          children: [
            SizedBox(
              height: 200,
            ),
            Column(
              children: [
                _buildSpentOn(),
                SizedBox(
                  height: 6,
                ),
                _buildBy(),
                SizedBox(
                  height: 6,
                ),
                _buildspentAmount(),
                SizedBox(
                  height: 6,
                ),
                _buildSpentOnDate(context),
                SizedBox(
                  height: 6,
                ),

                widget.clubSpendings==null?
                Container(
                  width: 300,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: primaryColor)),
                    color: secondaryColor2,
                    child: Text('Send'.tr, style: maintext4b),
                    onPressed: () {
                      if (_commentformKey.currentState.validate()) {
                        _saveToCloud();
                        _flushAll();
                        Get.snackbar('Succsess'.tr, 'Saved'.tr,
                            snackPosition: SnackPosition.BOTTOM);
                      }
                      Get.snackbar('Error'.tr, 'notsaved'.tr,
                          snackPosition: SnackPosition.BOTTOM);
                    },
                  ),
                ):Container(
                  width: 300,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: primaryColor)),
                    color: secondaryColor2,
                    child: Text('Update'.tr, style: maintext4b),
                    onPressed: () {
                      if (_commentformKey.currentState.validate()) {
                        _updateInCloud();
                        _flushAll();
                        Get.snackbar('Succsess'.tr, 'Saved'.tr,
                            snackPosition: SnackPosition.BOTTOM);
                      }
                      Get.snackbar('Error'.tr, 'notsaved'.tr,
                          snackPosition: SnackPosition.BOTTOM);
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  _flushAll() {
    spentOnControler.clear();
    spentOnDateController.clear();
    spentAmountControler.clear();
    spentByControler.clear();
  }
}
