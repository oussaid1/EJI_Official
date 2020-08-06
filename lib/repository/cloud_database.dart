import 'package:EJI/model/player.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CloudDatabase extends GetxController {
  RxBool isAdmin = false.obs;
  RxBool isComplete = true.obs;
  var email = '1234'.obs;
  var password = '1234'.obs;
  var adminEmail = 'admin'.obs;
  var adminPassword = 'admin'.obs;

  @override
  void onInit() {
    GetStorage mBox = GetStorage();
    mBox
        .write('adminkey', false)
        .then((value) => isAdmin.value = mBox.read('adminkey'));
  }

   setAdmin(bool adminkey) 
  {
     GetStorage mBox = GetStorage();
    mBox
        .write('adminkey', adminkey)
        .then((value) => isAdmin.value = mBox.read('adminkey'));
  } 

  static Future<dynamic> loadFromStorage(String image) async {
    return await FirebaseStorage.instance.ref().child(image).getDownloadURL();
  }

  Future<Stream<List<Player>>> getPlayers() async {
    Future<Stream<List<Player>>> pList = Future.delayed(
        const Duration(milliseconds: 300),
        () => _db.collection('players').snapshots().map(
              (snapshot) => snapshot.documents
                  .map(
                    (doc) => Player.fromMap(doc.data, doc.documentID),
                  )
                  .toList(),
            ));

    return pList;
  }

  Stream<List<Player>> getPlayerz() {
    Stream<List<Player>> pList = _db.collection('players').snapshots().map(
          (snapshot) => snapshot.documents
              .map(
                (doc) => Player.fromMap(doc.data, doc.documentID),
              )
              .toList(),
        );

    return pList;
  }

  Future<List<Player>> getDocs() async {
    List<Player> pList = List<Player>();
    QuerySnapshot querySnapshot =
        await Firestore.instance.collection("players").getDocuments();
    for (int i = 0; i < querySnapshot.documents.length; i++) {
      var a = querySnapshot.documents[i];
      pList.add(
        new Player(
            id: '01',
            playerName: 'Mohamed',
            dateOfBirth: '02-01-2000',
            profileImage: 'assets/images/profilepic',
            email: 'mohamed.ouabdche@gmail.com',
            phone: '0623489736',
            position: 'defence',
            regNum: 349539,
            regDate: '02-08-2020'),
      );
      print(a.documentID);
    }
    getPlayers();
    return pList;
  }

  Firestore _db = Firestore.instance;
  Future<void> addPlayers(Player player) {
    return _db.collection('players').add(player.toMap());
  }

  Future<void> deletePlayer(String id) {
    return _db.collection('players').document(id).delete();
  }

  Future<void> updatePlayer(Player player) {
    return _db
        .collection('players')
        .document(player.id.toString())
        .updateData(player.toMap());
  }

   Future<String> getProfileImage(
      BuildContext context, String image) async {
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
}
