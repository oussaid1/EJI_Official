import 'package:EJI/models/anounce.dart';
import 'package:EJI/repository/cloud_database.dart';
import 'package:EJI/settings/params.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class AddAnounce extends StatefulWidget {
  AddAnounce({Key key, this.anounce}) : super(key: key);
  final Anounce anounce;

  @override
  _AddAnounceState createState() => _AddAnounceState();
}

class _AddAnounceState extends State<AddAnounce> {
  final TextEditingController subjectControler = TextEditingController();

  final TextEditingController textAnounceControler = TextEditingController();

  final TextEditingController byAnounceControler = TextEditingController();
  final TextEditingController dateControler = TextEditingController();

  DateTime nowDate = new DateTime.now();

  final DateFormat mformatter = DateFormat('yyyy-MM-dd');

  bool isActive = true;

  final GlobalKey<FormState> _anounceformKey = GlobalKey<FormState>();

  final CloudDatabase cv = Get.put(CloudDatabase());

  _saveToCloud() {
    Anounce anounce = new Anounce(
      subject: subjectControler.text.toString(),
      anounceDate: mformatter.format(nowDate),
      anounceText: textAnounceControler.text.toString(),
      anounceBy: byAnounceControler.text.toString(),
      anounceDuration: isActive ? 'Active' : 'Expired',
    );

    cv.addAnounce(anounce, 'anounces');
  }

  _updateInCloud() {
    Anounce anounce = new Anounce(
      id: widget.anounce.id,
      subject: subjectControler.text.toString(),
      anounceDate: widget.anounce.anounceDate,
      anounceText: textAnounceControler.text.toString(),
      anounceBy: byAnounceControler.text.toString(),
      anounceDuration: isActive ? 'Active' : 'Expired',
    );

    cv.updateAnounce(anounce);
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
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w400, color: fontColor),
          validator: (text) {
            if (text.isEmpty) {
              return ('insertSubject'.tr);
            }
            return null;
          },
          controller: subjectControler,
          autofocus: true,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: ('insertSubject'.tr),
              focusColor: secondaryColor,
              hintStyle: TextStyle(
                  fontSize: 14, fontWeight: FontWeight.w200, color: fontColor),
              contentPadding: EdgeInsets.only(left: 2)),
        ),
      ),
    );
  }

  Widget _buildAnounceText() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(6)),
        color: primaryColor,
      ),
      width: 300,
      height: 150,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: TextFormField(
          textAlign: TextAlign.center,
          maxLines: 8,
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w400, color: fontColor),
          validator: (text) {
            if (text.isEmpty) {
              return ('insertAnounce'.tr);
            }
            return null;
          },
          controller: textAnounceControler,
          autofocus: true,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: ('insertAnounce'.tr),
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
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w400, color: fontColor),
          validator: (text) {
            if (text.isEmpty) {
              return ('insertYourname'.tr);
            }
            return null;
          },
          controller: byAnounceControler,
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

  Widget _buildDuration() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: primaryColor,
      ),
      width: 300,
      height: 50,
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: Switch(
          onChanged: (bool value) {
            setState(() {
              isActive = value;
            });
          },
          value: isActive,
        ),
      ),
    );
  }

  @override
  void initState() {
    if (widget.anounce != null) {
      subjectControler.text = widget.anounce.subject;
      textAnounceControler.text = widget.anounce.anounceText;
      byAnounceControler.text = widget.anounce.anounceDate;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _anounceformKey,
      child: Column(
        children: [
          _buildSubject(),
          SizedBox(
            height: 6,
          ),
          _buildAnounceText(),
          SizedBox(
            height: 6,
          ),
          _buildBy(),
          SizedBox(
            height: 6,
          ),
          widget.anounce == null
              ? Container(
                  width: 300,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: primaryColor)),
                    color: secondaryColor,
                    child: Text('Send',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: fontColor)),
                    onPressed: () {
                      if (_anounceformKey.currentState.validate()) {
                        _saveToCloud();
                        _flushAll();
                        Get.snackbar('Succsess'.tr, 'YourComsav'.tr,
                            snackPosition: SnackPosition.BOTTOM);
                      } else {
                        Get.snackbar('Error'.tr, 'notsaved'.tr,
                            snackPosition: SnackPosition.BOTTOM);
                      }
                    },
                  ),
                )
              : Row(
                  children: [
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: primaryColor)),
                      color: secondaryColor,
                      child: Text('Update',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: fontColor)),
                      onPressed: () {
                        if (_anounceformKey.currentState.validate()) {
                          _updateInCloud();
                          _flushAll();
                          Get.snackbar('Succsess'.tr, 'YourComsav'.tr,
                              snackPosition: SnackPosition.BOTTOM);
                        } else {
                          Get.snackbar('Error'.tr, 'notsaved'.tr,
                              snackPosition: SnackPosition.BOTTOM);
                        }
                      },
                    ),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: primaryColor)),
                      color: secondaryColor,
                      child: Text('Delete',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: fontColor)),
                      onPressed: () {
                        if (_anounceformKey.currentState.validate()) {
                          cv.deleteObject('anounces', widget.anounce.id);
                          _flushAll();
                          Get.snackbar('Succsess'.tr, 'YourComsav'.tr,
                              snackPosition: SnackPosition.BOTTOM);
                        } else {
                          Get.snackbar('Error'.tr, 'notsaved'.tr,
                              snackPosition: SnackPosition.BOTTOM);
                        }
                      },
                    ),
                  ],
                )
        ],
      ),
    );
  }

  _flushAll() {
    subjectControler.clear();
    textAnounceControler.clear();
    byAnounceControler.clear();
  }
}
