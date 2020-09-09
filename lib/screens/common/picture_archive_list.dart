import 'package:EJI/models/club_archive.dart';
import 'package:EJI/repository/cloud_database.dart';
import 'package:EJI/settings/params.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
  List<ClubArcive> myList;
  bool isOussaid = false;

  Future<String> getProfileImage(BuildContext context, String image) async {
    String murl;

    await FirebaseStorage.instance
        .ref()
        .child(image)
        .getDownloadURL()
        .then((downloadUrl) {
      murl = downloadUrl.toString();
    });

    return murl;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: c.getClubArcivePictures('ClubPitureArchive'),
        builder: (context, AsyncSnapshot<List<ClubArcive>> snapshot) {
          if (!snapshot.hasData || snapshot.hasError) {
            return Container(
              width: Get.width - 2,
              child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  child: Image.asset('assets/images/c.jpg', fit: BoxFit.fill)),
            );
          }
          myList = snapshot.data;

          return CarouselSlider.builder(
              options: CarouselOptions(
                autoPlay: true,
                viewportFraction: 1,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
              ),
              itemCount: myList != null ? myList.length : 0,
              itemBuilder: (BuildContext context, index) {
                ClubArcive clubArcive = myList[index];
                return new Container(
                  width: Get.width - 2,
                  height: 300,
                  color: secondaryColor.withOpacity(0.8),
                  child: CachedNetworkImage(
                      useOldImageOnUrlChange: true,
                      imageUrl: clubArcive.imageLocation.toString(),
                      fit: BoxFit.fill,
                      placeholder: (context, url) =>
                          Image.asset('assets/images/c.jpg', fit: BoxFit.fill)),
                );
              });
        });
  }
}
