import 'package:EJI/controllers/variables/variables_controler.dart';
import 'package:EJI/models/finance/club_expenses.dart';
import 'package:EJI/repository/cloud_database.dart';
import 'package:EJI/settings/params.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class AddIncome extends StatefulWidget {
  AddIncome({Key key, this.clubIncome}) : super(key: key);
  final ClubIncome clubIncome;
  @override
  _AddSpendingsState createState() => _AddSpendingsState();
}

class _AddSpendingsState extends State<AddIncome> {
  final TextEditingController givenForControler = TextEditingController();
  final TextEditingController givenAmountControler = TextEditingController();
  final TextEditingController givenByControler = TextEditingController();
  final TextEditingController givenOnDateController = TextEditingController();
  final DateFormat mformatter = DateFormat('yyyy-MM-dd');
  final GlobalKey<FormState> _commentformKey = GlobalKey();

  String _id;

  String _givenOnDate;

  final CloudDatabase db = (CloudDatabase());
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
        _givenOnDate = formatter.format(picked).toString();
        givenOnDateController.text = _givenOnDate;
      });
    }
  }

  _saveToCloud() {
    ClubIncome clubIncome = new ClubIncome(
        givenFor: givenForControler.text.toString().trim(),
        givenBy: givenByControler.text.trim().toString(),
        givenOnDate: givenOnDateController.text,
        givenAmount: int.parse(givenAmountControler.text.trim()));

    db.addIncome(clubIncome);
  }

  _updateInCloud() {
    ClubIncome clubIncome = new ClubIncome(
        id: _id,
        givenFor: givenForControler.text.toString().trim(),
        givenBy: givenByControler.text.trim().toString(),
        givenOnDate: givenOnDateController.text,
        givenAmount: int.parse(givenAmountControler.text.trim()));

    db.updateIncome(clubIncome);
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
            return ('insertGivenFor'.tr);
          }
          return null;
        },
        controller: givenForControler,
        autofocus: true,
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.shopping_cart,
              color: secondaryColor,
            ),
            hintText: ('insertGivenFor'.tr),
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
        controller: givenOnDateController,
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
          hintText: 'DateGiven'.tr,
        ),
        validator: (value) {
          if (value.length == 0) {
            return 'selectDateGivenOn'.tr;
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
        controller: givenByControler,
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
            return ('insertGivenAmount'.tr);
          }

          return null;
        },
        controller: givenAmountControler,
        autofocus: true,
        decoration: InputDecoration(
            fillColor: primaryColor,
            filled: true,
            prefixIcon: Icon(
              Icons.monetization_on,
              color: secondaryColor,
            ),
            hintText: ('insertGivenAmount'.tr),
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
    if (widget.clubIncome != null) {
      _id = widget.clubIncome.id;
      givenForControler.text = widget.clubIncome.givenFor;
      givenOnDateController.text = widget.clubIncome.givenOnDate;
      givenAmountControler.text = widget.clubIncome.givenAmount.toString();
      givenByControler.text = widget.clubIncome.givenBy;
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
            widget.clubIncome == null
                ? Container(
                    width: 300,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      color: secondaryColor,
                      child: Text('Save'.tr,
                          style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w600,
                              color: primaryColor)),
                      onPressed: () {
                        if (_commentformKey.currentState.validate()) {
                          _saveToCloud();
                          _flushAll();
                          Get.snackbar('Succsess'.tr, 'Saved'.tr,
                              snackPosition: SnackPosition.BOTTOM);
                        } else
                          Get.snackbar('Error'.tr, 'notsaved'.tr,
                              snackPosition: SnackPosition.BOTTOM);
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
                                  title: 'SuperAdmin'.tr,
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
                                      db.deleteObject(
                                          'ClubIncome', widget.clubIncome.id);
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
    givenForControler.clear();
    givenOnDateController.clear();
    givenAmountControler.clear();
    givenByControler.clear();
  }
}
