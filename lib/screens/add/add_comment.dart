import 'package:EJI/models/communication/comments_model.dart';
import 'package:EJI/repository/cloud_database.dart';
import 'package:EJI/settings/params.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class AddComment extends StatefulWidget {
  AddComment({Key key}) : super(key: key);

  @override
  _AddCommentState createState() => _AddCommentState();
}

class _AddCommentState extends State<AddComment> {
  final TextEditingController subjectControler = TextEditingController();

  final TextEditingController textCommentControler = TextEditingController();

  final TextEditingController byCommentControler = TextEditingController();

  DateTime nowDate = new DateTime.now();

  final DateFormat mformatter = DateFormat('yyyy-MM-dd');

  final GlobalKey<FormState> _commentformKey = GlobalKey<FormState>();

  final CloudDatabase cv = Get.put(CloudDatabase());

  _saveToCloud() {
    Comments comment = new Comments(

      subject: subjectControler.text.toString(),
      commentsDate: mformatter.format(nowDate),
      commentsText: textCommentControler.text.toString(),
      commentsBy: byCommentControler.text.toString(),
    );

    cv.addComment(comment);
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
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w400, color: fontColor),
          validator: (text) {
            if (text.isEmpty) {
              return ('insertComment'.tr);
            }
            return null;
          },
          controller: textCommentControler,
          autofocus: true,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: ('insertComment'.tr),
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

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _commentformKey,
      child: Column(
        children: [
          _buildSubject(),
          SizedBox(
            height: 6,
          ),
          _buildCommentText(),
          SizedBox(
            height: 6,
          ),
          _buildBy(),
          SizedBox(
            height: 6,
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
                  side: BorderSide(color: primaryColor)),
              color: secondaryColor,
              child: Text('Send',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: fontColor)),
              onPressed: () {
                if (_commentformKey.currentState.validate()) {
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
          ),
        ],
      ),
    );
  }

  _flushAll() {
    subjectControler.clear();
    textCommentControler.clear();
    byCommentControler.clear();
  }
}
