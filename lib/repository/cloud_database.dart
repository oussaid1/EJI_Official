import 'package:EJI/models/ahdath_events.dart';
import 'package:EJI/models/anounce.dart';
import 'package:EJI/models/club_archive.dart';
import 'package:EJI/models/club_expenses.dart';
import 'package:EJI/models/comments_model.dart';
import 'package:EJI/models/matchday.dart';
import 'package:EJI/models/player.dart';

import 'package:EJI/models/staff.dart';
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
  RxString sperAdminPass = '1243'.obs;
  RxString coachAdminPass = '532'.obs;
  RxString presidentialPass = '12343'.obs;
  var email = 'Idawlstane'.obs;
  var password = 'Idawlstane'.obs;
  var adminEmail = 'E20J19I'.obs;
  var adminPassword = 'E20J19I'.obs;
  Firestore _db = Firestore.instance;
  setBudget(double d) => clubBudget.value = d;
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
/*void queryValues() {
 
   _db.collection('myCollection')
        .snapshots()
        .listen((snapshot) {
      double tempTotal = snapshot.documents.fold(0, (tot, doc) => tot + doc.data['amount']);
     total = tempTotal;
     
    });
  }*/

  static Future<dynamic> loadFromStorage(String image) async {
    return await FirebaseStorage.instance.ref().child(image).getDownloadURL();
  }

  Stream<List<AhdathModel>> getAhdath() {
    Stream<List<AhdathModel>> pList = _db
        .collection('Ahdath')
        .orderBy('creationDate', descending: true)
        .snapshots()
        .map(
          (snapshot) => snapshot.documents
              .map(
                (doc) => AhdathModel.fromMap(doc.data, doc.documentID),
              )
              .toList(),
        );

    return pList;
  }

  Stream<List<Player>> getPlayerz(String collectionName) {
    return _db
        .collection('players')
        .orderBy('oVR', descending: true)
        .snapshots()
        .map(
          (snapshot) => snapshot.documents
              .map(
                (doc) => Player.fromMap(doc.data, doc.documentID),
              )
              .toList(),
        );
  }

  Stream<List<Player>> getGK() {
    Stream<List<Player>> pList = _db
        .collection('players')
        .where('position', isEqualTo: 'GK')
        .orderBy('oVR', descending: true)
        .limit(1)
        .snapshots()
        .map(
          (snapshot) => snapshot.documents
              .map(
                (doc) => Player.fromMap(doc.data, doc.documentID),
              )
              .toList(),
        );

    return pList;
  }

  Stream<List<Player>> get11Pla() {
    Stream<List<Player>> pList = _db
        .collection('players')
        .where('position', isEqualTo: 'GK')
        .orderBy('oVR', descending: true)
        .limit(1)
        .snapshots()
        .map(
          (snapshot) => snapshot.documents
              .map(
                (doc) => Player.fromMap(doc.data, doc.documentID),
              )
              .toList(),
        );

    return pList;
  }

  Stream<List<Anounce>> getAnounces(String collectionName) {
    Stream<List<Anounce>> pList = _db
        .collection(collectionName.toString())
        .orderBy(
          'anounceDate',
        )
        .snapshots()
        .map(
          (snapshot) => snapshot.documents
              .map(
                (doc) => Anounce.fromMap(doc.data, doc.documentID),
              )
              .toList(),
        );

    return pList;
  }

  Stream<List<ClubArcive>> getClubArcivePictures(String clubArcive) {
    Stream<List<ClubArcive>> pLdist =
        _db.collection(clubArcive.toString().trim()).snapshots().map(
              (snapshot) => snapshot.documents
                  .map(
                    (doc) => ClubArcive.fromMap(doc.data, doc.documentID),
                  )
                  .toList(),
            );

    return pLdist;
  }

  Stream<List<JuniorPlayer>> getJuniorPlayers(String collectionName) {
    Stream<List<JuniorPlayer>> pList =
        _db.collection(collectionName.toString()).snapshots().map(
              (snapshot) => snapshot.documents
                  .map(
                    (doc) => JuniorPlayer.fromMap(doc.data, doc.documentID),
                  )
                  .toList(),
            );

    return pList;
  }

/*
bool isAdult2(String birthDateString) {
  String datePattern = "dd-MM-yyyy";

  // Current time - at this moment
  DateTime today = DateTime.now();

  // Parsed date to check
  DateTime birthDate = DateFormat(datePattern).parse(birthDateString);

  // Date to check but moved 18 years ahead
  DateTime adultDate = DateTime(
    birthDate.year + 18,
    birthDate.month,
    birthDate.day,
  );

  return adultDate.isBefore(today);
}



  Stream<List<Player>> getPlayerdz(String collectionName) {
    Stream<List<Player>> pList =
        _db.collection(collectionName.toString()).snapshots().whereEqualTo().map(
              (snapshot) => snapshot.documents
                  .map(
                    (doc) => Player.fromMap(doc.data, doc.documentID),
                  )
                  .toList(),
            );

    return pList;
  }
*/
  Stream<List<MatchDay>> getMatchDays(String collectionName) {
    Stream<List<MatchDay>> pLista = _db
        .collection(collectionName.toString())
        .orderBy('matchdaydate', descending: true)
        .snapshots()
        .map(
          (snapshot) => snapshot.documents
              .map(
                (doc) => MatchDay.fromMap(doc.data, doc.documentID),
              )
              .toList(),
        );

    return pLista;
  }

  Stream<List<Comments>> getComments(String collectionName) {
    Stream<List<Comments>> pLista = _db
        .collection(collectionName.toString())
        .orderBy('remarkdate', descending: true)
        .snapshots()
        .map(
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
    Stream<List<ClubIncome>> pLista = _db
        .collection(a.toString())
        .orderBy('givenDate', descending: true)
        .snapshots()
        .map(
          (snapshot) => snapshot.documents
              .map(
                (doc) => ClubIncome.fromMap(doc.data, doc.documentID),
              )
              .toList(),
        );
    return pLista;
  }

  Stream<List<ClubSpendings>> getClubSpendings(String a) {
    Stream<List<ClubSpendings>> pLista = _db
        .collection(a.toString().trim())
        .orderBy('spentOnDate', descending: true)
        .snapshots()
        .map(
          (snapshot) => snapshot.documents
              .map(
                (doc) => ClubSpendings.fromMap(doc.data, doc.documentID),
              )
              .toList(),
        );
    return pLista;
  }

  Future<void> addSpendings(ClubSpendings clubSpendings) {
    return _db.collection('ClubSpendings').add(clubSpendings.toMap());
  }

  Future<void> addPlayers(Player player) {
    return _db.collection('players').add(player.toMap());
  }

  Future<void> addArchivePictures(ClubArcive clubArcive) {
    return _db.collection('ClubPitureArchive').add(clubArcive.toMap());
  }

  Future<void> addJuniorPlayer(JuniorPlayer juniorPlayer) {
    return _db.collection('Juniors').add(juniorPlayer.toMap());
  }

  Future<void> addIncome(ClubIncome clubIncome) {
    return _db.collection('ClubIncome').add(clubIncome.toMap());
  }

  Future<void> addAnounce(Anounce anounce, String anouncecolection) {
    return _db
        .collection(anouncecolection.toString().trim())
        .add(anounce.toMap());
  }

  Future<void> addMatch(MatchDay matchDay) {
    return _db.collection('matchday').add(matchDay.toMap());
  }

  Future<void> addComment(Comments comments) {
    return _db.collection('remarks').add(comments.toMap());
  }

  Future<void> addAhdath(AhdathModel ahdathModel) {
    return _db.collection('Ahdath').add(ahdathModel.toMap());
  }

  Future<void> deletePlayer(String id) {
    return _db.collection('players').document(id).delete();
  }

  Future<void> deleteObject(String collection, String id) {
    return _db.collection(collection.toString().trim()).document(id).delete();
  }

  Future<void> updatePlayer(Player player) {
    return _db
        .collection('players')
        .document(player.id.toString())
        .updateData(player.toMap());
  }

  Future<void> updateJuniorPlayer(JuniorPlayer player) {
    return _db
        .collection('Juniors')
        .document(player.id.toString())
        .updateData(player.toMap());
  }

  Future<void> updateAnounce(Anounce anounce) {
    return _db
        .collection('anounces')
        .document(anounce.id.toString())
        .updateData(anounce.toMap());
  }

  Future<void> addReply(Comments comments) {
    return _db
        .collection('remarks')
        .document(comments.id.toString())
        .updateData(comments.toMapone());
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

  Future<void> updateArchivePiture(ClubArcive clubArcive) {
    return _db
        .collection('ClubPitureArchive')
        .document(clubArcive.id.toString())
        .updateData(clubArcive.toMap());
  }

  Future<String> getProfileImage(BuildContext context, String image) async {
    String murl;
    try {
      await FirebaseStorage.instance
          .ref()
          .child(image)
          .getDownloadURL()
          .then((downloadUrl) {
        murl = downloadUrl.toString();
      });
    } catch (e) {}
    return murl;
  }
}
