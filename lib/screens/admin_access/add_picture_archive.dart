import 'package:EJI/models/club_archive.dart';
import 'package:EJI/repository/cloud_database.dart';
import 'package:EJI/settings/params.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class AddPicture extends StatefulWidget {
  AddPicture({Key key, this.clubArcive}) : super(key: key);
  final ClubArcive clubArcive;
  @override
  _AddPictureState createState() => _AddPictureState();
}

class _AddPictureState extends State<AddPicture> {
  final TextEditingController imageLocationControler = TextEditingController();
  final TextEditingController imageByControler = TextEditingController();

  final TextEditingController imageYearControler = TextEditingController();
  final DateFormat mformatter = DateFormat('yyyy-MM-dd');
  final GlobalKey<FormState> _commentformKey = GlobalKey();

  String _id;
  int _thumbsUp = 0;
  int _thumbsDown = 0;
  String _spentOnDate;

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
        _spentOnDate = formatter.format(picked).toString();
        imageYearControler.text = _spentOnDate;
      });
    }
  }

  _saveToCloud() {
    ClubArcive clubArcive = new ClubArcive(
      imageLocation: imageLocationControler.text.toString().trim(),
      takenBy: imageByControler.text.trim().toString(),
      season: imageYearControler.text,
      thumbsUp: _thumbsUp,
      thumbsDown: _thumbsDown,
    );
    cv.addArchivePictures(clubArcive);
  }

  _updateInCloud() {
    ClubArcive clubArcive = new ClubArcive(
      id: _id,
      imageLocation: imageLocationControler.text.toString().trim(),
      takenBy: imageByControler.text.trim().toString(),
      season: imageYearControler.text,
      thumbsUp: _thumbsUp,
      thumbsDown: _thumbsDown,
    );
    cv.updateArchivePiture(clubArcive);
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
            return ('insertImageLocation'.tr);
          }
          return null;
        },
        controller: imageLocationControler,
        autofocus: true,
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.shopping_cart,
              color: secondaryColor,
            ),
            hintText: ('insertImageLocation'.tr),
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
        controller: imageYearControler,
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
          hintText: 'DateTaken'.tr,
        ),
        validator: (value) {
          if (value.length == 0) {
            return 'selectDateTaken'.tr;
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
            return ('insertTakenBy'.tr);
          }
          return null;
        },
        controller: imageByControler,
        autofocus: true,
        decoration: InputDecoration(
            hintText: ('insertTakenBy'.tr),
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

  @override
  void initState() {
    if (widget.clubArcive != null) {
      _id = widget.clubArcive.id;
      imageLocationControler.text = widget.clubArcive.imageLocation;
      imageByControler.text = widget.clubArcive.takenBy;
      imageYearControler.text = widget.clubArcive.season;
      _thumbsUp = widget.clubArcive.thumbsUp;
      _thumbsDown = widget.clubArcive.thumbsUp;
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
            _buildSpentOnDate(context),
            SizedBox(
              height: 20,
            ),
            widget.clubArcive == null
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
                                        cv.sperAdminPass.value
                                            .toString()
                                            .trim()) {
                                      Navigator.pop(context);
                                      cv.deleteObject('ClubPitureArchive',
                                          widget.clubArcive.id);
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
    imageYearControler.clear();
    imageByControler.clear();
    imageLocationControler.clear();
  }
}
