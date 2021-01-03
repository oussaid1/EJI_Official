import 'package:EJI/models/ahdath_events.dart';
import 'package:EJI/models/anounce.dart';
import 'package:EJI/models/club_archive.dart';
import 'package:EJI/models/club_expenses.dart';
import 'package:EJI/models/comments_model.dart';
import 'package:EJI/models/matchday.dart';
import 'package:EJI/models/player.dart';

import 'package:EJI/models/staff.dart';
import 'package:EJI/models/user.dart';
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
  var adminEmail = 'E20J19I'.obs;
  var adminPassword = 'E20J19I'.obs;
  final _firestore = FirebaseFirestore.instance;
  setBudget(double d) => clubBudget.value = d;
 
  Future<bool> createNewUser(UserModel user) async {
    try {
      await _firestore.collection("users").doc(user.id).set({
        "name": user.name,
        "email": user.email,
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<UserModel> getUser(String uid) async {
    try {
      DocumentSnapshot _doc =
      await _firestore.collection("users").doc(uid).get();
      return UserModel.fromDocumentSnapshot(documentSnapshot: _doc);
    } catch (e) {
      print(e);
      rethrow;
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
   return _firestore
        .collection('Ahdath')
        .orderBy('creationDate', descending: true)
        .snapshots()

        .map((QuerySnapshot query) {
      List<AhdathModel> retVal = List();
      query.docs.forEach((element) {
        retVal.add(AhdathModel.fromMap(element,element.id));
      });
      return retVal;
    });
  }

  Stream<List<Player>> getPlayers(String collection) {
    return _firestore
        .collection(collection.trim().toString())
        .orderBy('oVR', descending: true)
        .snapshots()
        .map((QuerySnapshot query) {
      List<Player> retVal = List();
      query.docs.forEach((element) {
        retVal.add(Player.fromMap(element,element.id));
      });
      return retVal;
    });
  }

  Stream<List<Player>> getPlayerStats() {
    return _firestore.collection('statisticPlayer').snapshots()
        .map((QuerySnapshot query) {
      List<Player> retVal = List();
      query.docs.forEach((element) {
        retVal.add(Player.fromMap(element,element.id));
      });
      return retVal;
    });
  }

  Stream<List<Player>> getGK() {
    return  _firestore
        .collection('players')
        .where('position', isEqualTo: 'GK')
        .orderBy('oVR', descending: true)
        .limit(1)
        .snapshots()
        .map((QuerySnapshot query) {
      List<Player> retVal = List();
      query.docs.forEach((element) {
        retVal.add(Player.fromMap(element,element.id));
      });
      return retVal;
    });
  }

  Stream<List<Player>> get11Pla() {
    return
    _firestore
        .collection('players')
        .where('position', isEqualTo: 'GK')
        .orderBy('oVR', descending: true)
        .limit(1)
        .snapshots()
        .map((QuerySnapshot query) {
      List<Player> retVal = List();
      query.docs.forEach((element) {
        retVal.add(Player.fromMap(element,element.id));
      });
      return retVal;
    });
  }

  Stream<List<Anounce>> getAnounces(String collectionName) {
   return  _firestore
        .collection(collectionName.toString())
        .orderBy(
          'anounceDate',
        )
        .snapshots()
        .map((QuerySnapshot query) {
      List<Anounce> retVal = List();
      query.docs.forEach((element) {
        retVal.add(Anounce.fromMap(element,element.id));
      });
      return retVal;
    });
  }

  Stream<List<ClubArcive>> getClubArcivePictures(String clubArcive) {
    return
        _firestore.collection(clubArcive.toString().trim()).snapshots().map((QuerySnapshot query) {
          List<ClubArcive> retVal = List();
          query.docs.forEach((element) {
            retVal.add(ClubArcive.fromMap(element,element.id));
          });
          return retVal;
        });
  }

  Stream<List<MatchDay>> getMatchDays(String collectionName) {
    return _firestore
        .collection(collectionName.toString())
        .orderBy('matchdaydate', descending: true)
        .snapshots()
        .map((QuerySnapshot query) {
      List<MatchDay> retVal = List();
      query.docs.forEach((element) {
        retVal.add(MatchDay.fromMap(element,element.id));
      });
      return retVal;
    });
  }

  Stream<List<Comments>> getComments(String collectionName) {
  return _firestore
        .collection(collectionName.toString())
        .orderBy('remarkdate', descending: true)
        .snapshots()
        .map((QuerySnapshot query) {
      List<Comments> retVal = List();
      query.docs.forEach((element) {
        retVal.add(Comments.fromMap(element,element.id));
      });
      return retVal;
    });
  }

  Stream<List<Staff>> getStaff(String staff) {
   return
        _firestore.collection(staff.toString()).snapshots()
                  .map((QuerySnapshot query) {
                List<Staff> retVal = List();
                query.docs.forEach((element) {
                  retVal.add(Staff.fromMap(element,element.id));
                });
                return retVal;
              });
  }

  Stream<List<ClubIncome>> getClubIncomes() {
    return
    _firestore
        .collection('ClubIncome')
        .orderBy('givenDate', descending: true)
        .snapshots()
        .map((QuerySnapshot query) {
      List<ClubIncome> retVal = List();
      query.docs.forEach((element) {
        retVal.add(ClubIncome.fromMap(element,element.id));
      });
      return retVal;
    });
  }

  Stream<List<ClubSpendings>> getClubSpendings() {
    return  _firestore
        .collection('incomeSpendings')
        .orderBy('spentOnDate', descending: true)
        .snapshots()
        .map((QuerySnapshot query) {
      List<ClubSpendings> retVal = List();
      query.docs.forEach((element) {
        retVal.add(ClubSpendings.fromMap(element,element.id));
      });
      return retVal;
    });
  }

  Future<void> addSpendings(ClubSpendings clubSpendings) {
    return _firestore.collection('ClubSpendings').add(clubSpendings.toMap());
  }

  Future<void> addPlayers(Player player) {
    return _firestore.collection('players').add(player.toMap());
  }

  Future<void> addPlayerScores(String collection, Player player) {
    return _firestore
        .collection(collection.trim().toString())
        .add(player.toMapStats());
  }

  Future<void> addArchivePictures(ClubArcive clubArcive) {
    return _firestore.collection('ClubPitureArchive').add(clubArcive.toMap());
  }

  Future<void> addPlayer(String collection, Player player) {
    return _firestore.collection(collection.trim().toString()).add(player.toMap());
  }

  Future<void> addIncome(ClubIncome clubIncome) {
    return _firestore.collection('ClubIncome').add(clubIncome.toMap());
  }

  Future<void> addAnounce(Anounce anounce, String anouncecolection) {
    return _firestore
        .collection(anouncecolection.toString().trim())
        .add(anounce.toMap());
  }

  Future<void> addMatch(MatchDay matchDay) {
    return _firestore.collection('matchday').add(matchDay.toMap());
  }

  Future<void> addComment(Comments comments) {
    return _firestore.collection('remarks').add(comments.toMap());
  }

  Future<void> addAhdath(AhdathModel ahdathModel) {
    return _firestore.collection('Ahdath').add(ahdathModel.toMap());
  }

  Future<void> deletePlayer(String id) {
    return _firestore.collection('players').doc(id).delete();
  }

  Future<void> deleteObject(String collection, String id) {
    return _firestore.collection(collection.toString().trim()).doc(id).delete();
  }

  Future<void> updatePlayer(String collection, Player player) {
    return _firestore
        .collection(collection.trim().toString())
        .doc(player.id.toString())
        .update(player.toMap());
  }

  Future<void> updateAnounce(Anounce anounce) {
    return _firestore
        .collection('anounces')
        .doc(anounce.id.toString())
        .update(anounce.toMap());
  }

  Future<void> addReply(Comments comments) {
    return _firestore
        .collection('remarks')
        .doc(comments.id.toString())
        .update(comments.toMapone());
  }

  Future<void> updateMatch(MatchDay matchDay) {
    return _firestore
        .collection('matchday')
        .doc(matchDay.id.toString())
        .update(matchDay.toMap());
  }

  Future<void> updateSpendings(ClubSpendings clubSpendings) {
    return _firestore
        .collection('ClubSpendings')
        .doc(clubSpendings.id.toString())
        .update(clubSpendings.toMap());
  }

  Future<void> updateIncome(ClubIncome clubIncome) {
    return _firestore
        .collection('ClubIncome')
        .doc(clubIncome.id.toString())
        .update(clubIncome.toMap());
  }

  Future<void> updateArchivePiture(ClubArcive clubArcive) {
    return _firestore
        .collection('ClubPitureArchive')
        .doc(clubArcive.id.toString())
        .update(clubArcive.toMap());
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
