import 'package:EJI/repository/cloud_database.dart';
import 'package:EJI/screens/admin_access/admin_drawer.dart';
import 'package:EJI/settings/params.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PicturesArchiveList extends StatefulWidget {
  PicturesArchiveList({
    Key key,
  }) : super(key: key);

  @override
  _PicturesArchiveListState createState() => _PicturesArchiveListState();
}

class _PicturesArchiveListState extends State<PicturesArchiveList> {
  CloudDatabase c = Get.put(CloudDatabase());
  Future<String> getProfileImage(BuildContext context, String image) async {
    String murl;

    await FirebaseStorage.instance
        .ref()
        .child(image)
        .getDownloadURL()
        .then((downloadUrl) {
      murl = downloadUrl.toString();
    });

    print('download_error, Object does not exist at location.');

    return murl;
  }

  

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        drawer: new AdminDrawer(),
        appBar: new AppBar(),
        body: ListView(
          children:<Widget>[

          
          new Container(
            color: primaryColorShade,
            height: 300,
            width: 400,
            child: new Card(
                borderOnForeground: true,
                elevation: 20,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2),
                ),
                child: Image.network(
                    'https://i.ibb.co/V06Xq7b/20190901-193709.jpg',fit: BoxFit.fill,)),
          ),
          new Container(
            color: primaryColorShade,
            height: 300,
            width: 400,
            child: new Card(
                borderOnForeground: true,
                elevation: 20,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2),
                ),
                child: Image.network(
                    'https://i.ibb.co/R0RvyzP/20190901-190839.jpg',fit: BoxFit.fill,)),
          ),
          new Container(
            color: primaryColorShade,
            height: 300,
            width: 400,
            child: new Card(
                borderOnForeground: true,
                elevation: 20,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2),
                ),
                child: Image.network(
                    'https://i.ibb.co/SmWv4TD/20190830-184123.jpg',fit: BoxFit.fill,)),
          ),
          new Container(
            color: primaryColorShade,
            height: 300,
            width: 400,
            child: new Card(
                borderOnForeground: true,
                elevation: 20,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2),
                ),
                child: Image.network(
                    'https://i.ibb.co/HtdM4qG/20190829-183910.jpg',fit: BoxFit.fill,)),
          ),
          new Container(
            color: primaryColorShade,
            height: 300,
            width: 400,
            child: new Card(
                borderOnForeground: true,
                elevation: 20,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2),
                ),
                child: Image.network(
                   'https://i.ibb.co/NZGRRBR/20190829-183627.jpg',fit: BoxFit.fill,)),
          ),
          new Container(
            color: primaryColorShade,
            height: 300,
            width: 400,
            child: new Card(
                borderOnForeground: true,
                elevation: 20,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2),
                ),
                child: Image.network(
                   'https://i.ibb.co/hyTNHDp/IMG-20190824-WA0009.jpg',fit: BoxFit.fill,)),
          ),
          new Container(
            color: primaryColorShade,
            height: 300,
            width: 400,
            child: new Card(
                borderOnForeground: true,
                elevation: 20,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2),
                ),
                child: Image.network(
                   'https://i.ibb.co/3rczSvt/IMG-20190824-WA0007.jpg',fit: BoxFit.fill,)),
          ),
          ]));
  }
}
