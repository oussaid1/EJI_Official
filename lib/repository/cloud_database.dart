import 'package:EJI/models/ahdath_events.dart';
import 'package:EJI/models/anounce.dart';
import 'package:EJI/models/club_archive.dart';
import 'package:EJI/models/club_expenses.dart';
import 'package:EJI/models/comments_model.dart';
import 'package:EJI/models/matchday.dart';
import 'package:EJI/models/player.dart';
import 'package:EJI/models/staff.dart';
import 'package:EJI/models/training_day.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get_storage/get_storage.dart';

class CloudDatabase extends GetxController {
  RxInt attendees = 0.obs;
  RxInt duration = 0.obs;
  RxInt countSeniors = 0.obs;
  RxInt countJuniors = 0.obs;
  RxInt countCadets = 0.obs;
  RxDouble clubBudget = 0.0.obs;
  RxDouble clubIncome = 0.0.obs;
  RxDouble clubSpendings = 0.0.obs;
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

    if (mBox.hasData('adminkey')) {
      isAdmin.value = mBox.read('adminkey');
    }
  }

  setAdmin(bool adminkey) {
    isAdmin.value = adminkey;
    GetStorage mBox = GetStorage();
    mBox
        .write('adminkey', adminkey)
        .then((value) => isAdmin.value = mBox.read('adminkey'));
  }

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

  Stream<List<Player>> getPlayers(String collection) {
    Stream<List<Player>> pList = _db
        .collection(collection.trim().toString())
        .orderBy('oVR', descending: true)
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

  Stream<List<Player>> getPlayerStats() {
    return _db.collection('statisticPlayer').snapshots().map(
          (snapshot) => snapshot.documents
              .map(
                (doc) => Player.fromMapStats(doc.data, doc.documentID),
              )
              .toList(),
        );
  }

  Stream<List<MatchDay>> getMatchStatusHome(String winlosdraw) {
    return _db
        .collection('matchday')
        .where('winStatusHome', isEqualTo: winlosdraw.trim())
        .snapshots()
        .map(
          (snapshot) => snapshot.documents
              .map(
                (doc) => MatchDay.fromMap(doc.data, doc.documentID),
              )
              .toList(),
        );
  }

  Stream<List<MatchDay>> getMatchStatusAway(String winlosdraw) {
    return _db
        .collection('matchday')
        .where('winStatusAway', isEqualTo: winlosdraw.trim())
        .snapshots()
        .map(
          (snapshot) => snapshot.documents
              .map(
                (doc) => MatchDay.fromMap(doc.data, doc.documentID),
              )
              .toList(),
        );
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

  Stream<List<MatchDay>> getMatchDays() {
    Stream<List<MatchDay>> pLista = _db
        .collection('matchday')
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

  Stream<List<ClubIncome>> getClubIncomes() {
    Stream<List<ClubIncome>> pLista = _db
        .collection('ClubIncome')
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

  Stream<List<TrainingDay>> getTrainingDays() {
    Stream<List<TrainingDay>> pLista = _db
        .collection('TrainingDay')
        .orderBy('trainingDate', descending: true)
        .snapshots()
        .map(
          (snapshot) => snapshot.documents
              .map(
                (doc) => TrainingDay.fromMap(doc.data, doc.documentID),
              )
              .toList(),
        );
    return pLista;
  }

  Stream<List<ClubSpendings>> getClubSpendings() {
    Stream<List<ClubSpendings>> pLista = _db
        .collection('incomeSpendings')
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

  Future<void> adAllToDb(List<Player> j) async {
    for (var i = 0; i < j.length; i++) {
      _db.collection('Senior').add(j[i].toMap());
    }
  }

  Future<void> addSpendings(ClubSpendings clubSpendings) {
    return _db.collection('ClubSpendings').add(clubSpendings.toMap());
  }

  Future<void> addPlayer(Player player, String collection) {
    return _db.collection(collection.trim()).add(player.toMap());
  }

  Future<void> addPlayerScores(String collection, Player player) {
    return _db
        .collection(collection.trim().toString())
        .add(player.toMapStats());
  }

  Future<void> addArchivePictures(ClubArcive clubArcive) {
    return _db.collection('ClubPitureArchive').add(clubArcive.toMap());
  }

  Future<void> addTraining(TrainingDay trainingDay) {
    return _db.collection('TrainingDay').add(trainingDay.toMap());
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

  Future<void> updatePlayer(String collection, Player player) {
    return _db
        .collection(collection.trim())
        .document(player.id)
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
