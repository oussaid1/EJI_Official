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
  RxDouble clubBudget = 0.0.obs;
  RxBool isAdmin = false.obs;
  RxBool isSuperAdmin = true.obs;
  RxBool isComplete = true.obs;
  RxString sperAdminPass = '1234'.obs;
  var email = '1234'.obs;
  var password = '1234'.obs;
  var adminEmail = '112233'.obs;
  var adminPassword = '112233'.obs;

  @override
  void onInit() {
    GetStorage mBox = GetStorage();
    mBox.write('adminkey', false);
  }

  setAdmin(bool adminkey) {
    GetStorage mBox = GetStorage();
    mBox
        .write('adminkey', adminkey)
        .then((value) => isAdmin.value = mBox.read('adminkey'));
  }
void queryValues() {
  double total=0;
   _db.collection('myCollection')
        .snapshots()
        .listen((snapshot) {
      double tempTotal = snapshot.documents.fold(0, (tot, doc) => tot + doc.data['amount']);
     total = tempTotal;
     
    });
  }
  void getClubIncomesAndSpendings() {
    List<ClubIncome> mList = List<ClubIncome>();

    _db
        .collection('ClubIncome'.trim())
        .snapshots()
        .map(
          (snapshot) => snapshot.documents
              .map(
                (doc) => ClubIncome.fromMap(doc.data, doc.documentID),
              )
              .toList(),
        
        );

    print('heeello'+ClubIncome.getIncome(mList).toString());
  }

  static Future<dynamic> loadFromStorage(String image) async {
    return await FirebaseStorage.instance.ref().child(image).getDownloadURL();
  }

  Stream<List<Player>> getPlayerz(String collectionName) {
    Stream<List<Player>> pList =
        _db.collection(collectionName.toString()).snapshots().map(
              (snapshot) => snapshot.documents
                  .map(
                    (doc) => Player.fromMap(doc.data, doc.documentID),
                  )
                  .toList(),
            );

    return pList;
  }

  Stream<List<MatchDay>> getMatchDays(String collectionName) {
    Stream<List<MatchDay>> pLista =
        _db.collection(collectionName.toString()).snapshots().map(
              (snapshot) => snapshot.documents
                  .map(
                    (doc) => MatchDay.fromMap(doc.data, doc.documentID),
                  )
                  .toList(),
            );

    return pLista;
  }

  Stream<List<Comments>> getComments(String collectionName) {
    Stream<List<Comments>> pLista =
        _db.collection(collectionName.toString()).snapshots().map(
              (snapshot) => snapshot.documents
                  .map(
                    (doc) => Comments.fromMap(doc.data, doc.documentID),
                  )
                  .toList(),
            );
    return pLista;
  }

  Stream<List<Staff>> getStaff(String staff) {
    Stream<List<Staff>> pLista =
        _db.collection(staff.toString()).snapshots().map(
              (snapshot) => snapshot.documents
                  .map(
                    (doc) => Staff.fromMap(doc.data, doc.documentID),
                  )
                  .toList(),
            );

    return pLista;
  }

  Stream<List<ClubIncome>> getClubIncomes(String a) {
    Stream<List<ClubIncome>> pLista =
        _db.collection(a.toString()).snapshots().map(
              (snapshot) => snapshot.documents
                  .map(
                    (doc) => ClubIncome.fromMap(doc.data, doc.documentID),
                  )
                  .toList(),
            );
    return pLista;
  }

  Stream<List<ClubSpendings>> getClubSpendings(String a) {
    Stream<List<ClubSpendings>> pLista =
        _db.collection(a.toString().trim()).snapshots().map(
              (snapshot) => snapshot.documents
                  .map(
                    (doc) => ClubSpendings.fromMap(doc.data, doc.documentID),
                  )
                  .toList(),
            );
    return pLista;
  }

  Firestore _db = Firestore.instance;
  Future<void> addSpendings(ClubSpendings clubSpendings) {
    return _db.collection('ClubSpendings').add(clubSpendings.toMap());
  }

  Future<void> addPlayers(Player player) {
    return _db.collection('players').add(player.toMap());
  }

  Future<void> addIncome(ClubIncome clubIncome) {
    return _db.collection('ClubIncome').add(clubIncome.toMap());
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

  Future<void> deleteObject(String collection, String id) {
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

  Future<void> updateSpendings(ClubSpendings clubSpendings) {
    return _db
        .collection('ClubSpendings')
        .document(clubSpendings.id.toString())
        .updateData(clubSpendings.toMap());
  }

  Future<void> updateIncome(ClubIncome clubIncome) {
    return _db
        .collection('ClubIncome')
        .document(clubIncome.id.toString())
        .updateData(clubIncome.toMap());
  }

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
}
