import 'package:EJI/model/club_expenses.dart';
import 'package:EJI/model/comments_model.dart';
import 'package:EJI/model/matchday.dart';
import 'package:EJI/model/player.dart';
import 'package:EJI/model/staff.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CloudDatabase extends GetxController {
  RxDouble clubBudget=0.0.obs;
  RxBool isAdmin = false.obs;
  RxBool isComplete = true.obs;
  var email = '1234'.obs;
  var password = '1234'.obs;
  var adminEmail = 'rootEJI'.obs;
  var adminPassword = 'EJIroot'.obs;
    setbudget(double lbudget)=> clubBudget.value = lbudget;
  @override
  void onInit() {
    GetStorage mBox = GetStorage();
    mBox
        .write('adminkey', false)
       ;
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

 

  Stream<List<Player>> getPlayerz(String collectionName) {
    Stream<List<Player>> pList = _db.collection(collectionName.toString()).snapshots().map(
          (snapshot) => snapshot.documents
              .map(
                (doc) => Player.fromMap(doc.data, doc.documentID),
              )
              .toList(),
        );

    return pList;
  }
  Stream<List<MatchDay>> getMatchDays(String collectionName) {
    Stream<List<MatchDay>> pLista = _db.collection(collectionName.toString()).snapshots().map(
          (snapshot) => snapshot.documents
              .map(
                (doc) => MatchDay.fromMap(doc.data, doc.documentID),
              )
              .toList(),
        );

    return pLista;
  }
  Stream<List<Comments>> getComments(String collectionName) {
   
    Stream<List<Comments>> pLista = _db.collection(collectionName.toString()).snapshots().map(
          (snapshot) => snapshot.documents
              .map(
                (doc) => Comments.fromMap(doc.data, doc.documentID),
              )
              .toList(),
        );

    return pLista;
  }
  Stream<List<Staff>> getStaff(String staff) {
   
    Stream<List<Staff>> pLista = _db.collection(staff.toString()).snapshots().map(
          (snapshot) => snapshot.documents
              .map(
                (doc) => Staff.fromMap(doc.data, doc.documentID),
              )
              .toList(),
        );

    return pLista;
  }
  
  Stream<List<Expenses>> getExpenses(String expenses) {
   
    Stream<List<Expenses>> pLista = _db.collection(expenses.toString()).snapshots().map(
          (snapshot) => snapshot.documents
              .map(
                (doc) => Expenses.fromMap(doc.data, doc.documentID),
              )
              .toList(),
        );

    return pLista;
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
   
    return pList;
  }

  Firestore _db = Firestore.instance;
  Future<void> addPlayers(Player player) {
    return _db.collection('players').add(player.toMap());
  }
  Future<void> addMatch(MatchDay matchDay) {
    return _db.collection('matchday').add(matchDay.toMap());
  }
  Future<void> addComment(Comments comments) {
    return _db.collection('remarks').add(comments.toMap());
  }

  Future<void> deletePlayer(String id) {
    return _db.collection('players').document(id).delete();
  }
  Future<void> deleteObject(String collection,String id) {
    return _db.collection(collection.toString()).document(id).delete();
  }

  Future<void> updatePlayer(Player player) {
    return _db
        .collection('players')
        .document(player.id.toString())
        .updateData(player.toMap());
  }
  Future<void> updateMatch(MatchDay matchDay) {
    return _db
        .collection('matchday')
        .document(matchDay.id.toString())
        .updateData(matchDay.toMap());
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
