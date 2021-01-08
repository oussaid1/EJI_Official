import 'package:EJI/controllers/variables/variables_controler.dart';
import 'package:EJI/models/finance/club_expenses.dart';
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

  String _spentOnDate;

  final CloudDatabase cv = Get.put(CloudDatabase());
  final VariablesControler varController = Get.put(VariablesControler());
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
        _spentOnDate = formatter.format(picked).toString();
        spentOnDateController.text = _spentOnDate;
      });
    }
  }

  _saveToCloud() {
    ClubSpendings clubSpendings = new ClubSpendings(
        spentOn: spentOnControler.text.toString().trim(),
        spentBy: spentByControler.text.trim().toString(),
        spentOnDate: spentOnDateController.text,
        spentAmount: int.parse(spentAmountControler.text.trim()));

    cv.addSpendings(clubSpendings);
  }

  _updateInCloud() {
    ClubSpendings clubSpendings = new ClubSpendings(
        id: _id,
        spentOn: spentOnControler.text.toString().trim(),
        spentBy: spentByControler.text.trim().toString(),
        spentOnDate: spentOnDateController.text,
        spentAmount: int.parse(spentAmountControler.text.trim()));

    cv.updateSpendings(clubSpendings);
  }

  Widget _buildSpentOn() {
    return SizedBox(
      width: 300,
      child: TextFormField(
        style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.w400, color: fontColor),
        textAlign: TextAlign.center,
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
              Icons.shopping_cart,
              color: secondaryColor,
            ),
            hintText: ('insertSpenton'.tr),
            fillColor: primaryColor,
            filled: true,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            labelStyle: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w400, color: fontColor),
            focusColor: accentColor,
            hintStyle: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w200, color: fontColor),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                  color: accentColor, style: BorderStyle.solid, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                  color: accentColor, style: BorderStyle.solid, width: 1),
            ),
            contentPadding: EdgeInsets.all(8)),
      ),
    );
  }

  Widget _buildSpentOnDate(BuildContext context) {
    return SizedBox(
      width: 300,
      child: TextFormField(
        readOnly: true,
        controller: spentOnDateController,
        style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.w400, color: fontColor),
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          fillColor: primaryColor,
          filled: true,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w400, color: fontColor),
          focusColor: accentColor,
          hintStyle: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w200, color: fontColor),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
                color: accentColor, style: BorderStyle.solid, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
                color: accentColor, style: BorderStyle.solid, width: 1),
          ),
          contentPadding: EdgeInsets.all(8),
          prefixIcon: IconButton(
            icon: Icon(Icons.calendar_today, color: secondaryColor),
            onPressed: () {
              _selectDate(context);
            },
          ),
          hintText: 'DateSpent'.tr,
        ),
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
    return SizedBox(
      width: 300,
      child: TextFormField(
        style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.w400, color: fontColor),
        textAlign: TextAlign.center,
        validator: (text) {
          if (text.isEmpty) {
            return ('insertYourname'.tr);
          }
          return null;
        },
        controller: spentByControler,
        autofocus: true,
        decoration: InputDecoration(
            hintText: ('insertYourname'.tr),
            prefixIcon: Icon(
              Icons.person_pin,
              color: secondaryColor,
            ),
            fillColor: primaryColor,
            filled: true,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            labelStyle: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w400, color: fontColor),
            focusColor: accentColor,
            hintStyle: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w200, color: fontColor),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                  color: accentColor, style: BorderStyle.solid, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                  color: accentColor, style: BorderStyle.solid, width: 1),
            ),
            contentPadding: EdgeInsets.all(8)),
      ),
    );
  }

  Widget _buildspentAmount() {
    return SizedBox(
      width: 300,
      child: TextFormField(
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.w400, color: fontColor),
        validator: (text) {
          if (text.isEmpty) {
            return ('inserAmountSpentiMad'.tr);
          }

          return null;
        },
        controller: spentAmountControler,
        autofocus: true,
        decoration: InputDecoration(
            fillColor: primaryColor,
            filled: true,
            prefixIcon: Icon(
              Icons.monetization_on,
              color: secondaryColor,
            ),
            hintText: ('inserAmountSpentiMad'.tr),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            labelStyle: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w400, color: fontColor),
            focusColor: accentColor,
            hintStyle: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w200, color: fontColor),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                  color: accentColor, style: BorderStyle.solid, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                  color: accentColor, style: BorderStyle.solid, width: 1),
            ),
            contentPadding: EdgeInsets.all(8)),
      ),
    );
  }

  @override
  void initState() {
    if (widget.clubSpendings != null) {
      _id = widget.clubSpendings.id;
      spentOnControler.text = widget.clubSpendings.spentOn;
      spentOnDateController.text = widget.clubSpendings.spentOnDate;
      spentAmountControler.text = widget.clubSpendings.spentAmount.toString();
      spentByControler.text = widget.clubSpendings.spentBy;
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
              height: 6,
            ),
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
              height: 20,
            ),
            widget.clubSpendings == null
                ? Container(
                    width: 300,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(color: primaryColor)),
                      color: secondaryColor,
                      child: Text('Send'.tr,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: fontColor)),
                      onPressed: () {
                        if (_commentformKey.currentState.validate()) {
                          _saveToCloud();
                          _flushAll();
                          Get.snackbar('Succsess'.tr, 'Saved'.tr,
                              snackPosition: SnackPosition.BOTTOM);
                        } else {
                          Get.snackbar('Error'.tr, 'notsaved'.tr,
                              snackPosition: SnackPosition.BOTTOM);
                        }
                      },
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 140,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                                side: BorderSide(color: primaryColor)),
                            color: secondaryColor,
                            child: Text('Update'.tr,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: fontColor)),
                            onPressed: () {
                              if (_commentformKey.currentState.validate()) {
                                Get.defaultDialog(
                                  title: 'SperAdmin'.tr,
                                  content: TextField(
                                    decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.lock)),
                                    onChanged: (value) {
                                      if (value.trim().toString() ==
                                          varController.sperAdminPass.value
                                              .toString()
                                              .trim()) {
                                        Navigator.pop(context);
                                        _updateInCloud();
                                        _flushAll();
                                      }
                                    },
                                  ),
                                );

                                Get.snackbar('Succsess'.tr, 'Saved'.tr,
                                    snackPosition: SnackPosition.BOTTOM);
                              } else {
                                Get.snackbar('Error'.tr, 'notsaved'.tr,
                                    snackPosition: SnackPosition.BOTTOM);
                              }
                            }),
                      ),
                      Container(
                        width: 140,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                                side: BorderSide(color: primaryColor)),
                            color: secondaryColor,
                            child: Text('Delete'.tr,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: fontColor)),
                            onPressed: () {
                              Get.defaultDialog(
                                title: 'SperAdmin'.tr,
                                content: TextField(
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.lock)),
                                  onChanged: (value) {
                                    if (value.trim().toString() ==
                                        varController.sperAdminPass.value
                                            .toString()
                                            .trim()) {
                                      Navigator.pop(context);
                                      cv.deleteObject('ClubSpendings',
                                          widget.clubSpendings.id);
                                      _flushAll();
                                    }
                                  },
                                ),
                              );
                            }),
                      ),
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
