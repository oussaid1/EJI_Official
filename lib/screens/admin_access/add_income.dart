import 'package:EJI/model/club_expenses.dart';
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

    cv.addIncome(clubIncome);
  }

  _updateInCloud() {
   ClubIncome clubIncome = new ClubIncome(
     id: _id,
        givenFor: givenForControler.text.toString().trim(),
        givenBy: givenByControler.text.trim().toString(),
        givenOnDate: givenOnDateController.text,
        givenAmount: int.parse(givenAmountControler.text.trim()));

    cv.updateIncome(clubIncome);
  }

  Widget _buildSpentOn() {
    return SizedBox(
      width: 300,
      child: TextFormField(
        style: subtext3xx,
        textAlign: TextAlign.center,
        validator: (text) {
          if (text.isEmpty) {
            return ('insertSpenton'.tr);
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
            labelStyle: subtext5x,
            focusColor: accentColor2,
            hintStyle: hinttext,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                  color: accentColor, style: BorderStyle.solid, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                  color: accentColor2, style: BorderStyle.solid, width: 1),
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
        style: subtext3xx,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          fillColor: primaryColor,
          filled: true,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle: subtext5x,
          focusColor: accentColor2,
          hintStyle: hinttext,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
                color: accentColor, style: BorderStyle.solid, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
                color: accentColor2, style: BorderStyle.solid, width: 1),
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
        style: subtext3xx,
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
            labelStyle: subtext5x,
            focusColor: accentColor2,
            hintStyle: hinttext,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                  color: accentColor, style: BorderStyle.solid, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                  color: accentColor2, style: BorderStyle.solid, width: 1),
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
        style: subtext3xx,
        validator: (text) {
          if (text.isEmpty) {
            return ('insertGivenAmountInMad'.tr);
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
            hintText: ('insertGivenAmountInMad'.tr),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            labelStyle: subtext5x,
            focusColor: accentColor2,
            hintStyle: hinttext,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                  color: accentColor, style: BorderStyle.solid, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                  color: accentColor2, style: BorderStyle.solid, width: 1),
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
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
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
                            color: secondaryColor2,
                            child: Text('Update'.tr, style: maintext4b),
                            onPressed: () {
                              if (_commentformKey.currentState.validate()) {
                                Get.defaultDialog(
                                  title: 'SperAdmin'.tr,
                                  content: TextField(
                                    decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.lock)),
                                    onChanged: (value) {
                                      if (value.trim().toString() ==
                                          cv.sperAdminPass.value
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
                            color: secondaryColor2,
                            child: Text('Delete'.tr, style: maintext4b),
                            onPressed: () {
                              Get.defaultDialog(
                                title: 'SperAdmin'.tr,
                                content: TextField(
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.lock)),
                                  onChanged: (value) {
                                    if (value.trim().toString() ==
                                        cv.sperAdminPass.value
                                            .toString()
                                            .trim()) {
                                      Navigator.pop(context);
                                      cv.deleteObject('ClubSpendings',
                                          widget.clubIncome.id);
                                      _flushAll();
                                    }
                                  },
                                ),
                              );
                              /* if (cv.isSuperAdmin.value == true) {
                       
                          Get.snackbar('Succsess'.tr, 'deleted'.tr,
                              snackPosition: SnackPosition.BOTTOM);
                        } else {
                           cv.deleteObject('ClubSpendings', widget.clubSpendings.id);
                          Get.snackbar('Error'.tr, 'notDeleted'.tr,
                              snackPosition: SnackPosition.BOTTOM);
                        }*/
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
