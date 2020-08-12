import 'package:EJI/model/club_archive.dart';
import 'package:EJI/repository/cloud_database.dart';
import 'package:EJI/screens/admin_access/add_picture_archive.dart';
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

    print('download_error, Object does not exist at location.');

    return murl;
  }
  

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        drawer: new AdminDrawer(),
        appBar: new AppBar(
          actions: [
           c.isAdmin.value ? IconButton(icon: Icon(Icons.info,color: secondaryColor,), onPressed: () {
               Get.defaultDialog(
                                title: 'SperAdmin'.tr,
                                content: TextField(
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.lock)),
                                  onChanged: (value) {
                                    if (value.trim().toString() ==
                                        c.presidentialPass.value
                                            .toString()
                                            .trim()) {
                                      Navigator.pop(context);
                                      setState(() {
                                        isOussaid=true;
                                      });
                                     
                                    }
                                  },
                                ),
                              );
            }):
           isOussaid? IconButton(icon: Icon(Icons.add_a_photo,color: accentColor,), onPressed: () {
             
               Get.off(AddPicture());
            
            }): Container(),
          ],
        ),
        body: StreamBuilder(
            stream: c.getClubArcivePictures('ClubPitureArchive'),
            builder: (context, AsyncSnapshot<List<ClubArcive>> snapshot) {
              if (!snapshot.hasData || snapshot.hasError) {
                return Center(
                    child: Icon(
                  Icons.list,
                  size: 100,
                  color: secondaryColor,
                ));
              }
              myList = snapshot.data;

              return ListView.builder(
                  itemCount: myList != null ? myList.length : 0,
                  itemBuilder: (BuildContext context, index) {
                    ClubArcive clubArcive = myList[index];
                    return new Container(
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
                            clubArcive.imageLocation.toString(),
                            fit: BoxFit.fill,
                          )),
                    );
                  });
            }));
  }
}
