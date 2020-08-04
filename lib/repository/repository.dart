import 'package:EJI/model/player.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class PlayerRepo {
  static List<Player> pList = List<Player>();

  addPlayer(Player player) {
    pList.add(new Player(
      id: player.id,
      playerName: player.playerName,
      dateOfBirth: player.dateOfBirth,
      profileImage: player.profileImage,
      email: player.email,
      phone: player.phone,
      position: player.position,
      regNum: player.regNum,
      regDate: player.regDate,
    ));
  }

  static Future<List<Player>> d() async {
    List<Player> pList = List<Player>();
    pList = [
      new Player(
          id: '03',
          playerName: 'Jamal',
          dateOfBirth: '02-01-2000',
          profileImage: 'assets/images/profilepic',
          email: 'mohamed.ouabdche@gmail.com',
          phone: '0623489736',
          position: 'defence',
          regNum: 23342,
          regDate: '02-08-2020'),
      new Player(
          id: '04',
          playerName: 'Adam',
          dateOfBirth: '02-01-2000',
          profileImage: 'assets/images/profilepic',
          email: 'mohamed.ouabdche@gmail.com',
          phone: '0623489736',
          position: 'defence',
          regNum: 756758,
          regDate: '02-08-2020'),
    ];
    return await Future.delayed(
      const Duration(milliseconds: 300),
      () => pList,
    );
  }
}

class FirestoreService {
  static final FirestoreService _firestoreService =
      FirestoreService._internal();
  Firestore _db = Firestore.instance;

  FirestoreService._internal();

  factory FirestoreService() {
    return _firestoreService;
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
  Stream<List<Player>> getPlayerz()  {
   Stream<List<Player>> pList =_db.collection('players').snapshots().map(
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
}

class FireStorageService extends ChangeNotifier {
  FireStorageService._();
  FireStorageService();

  static Future<dynamic> loadFromStorage(
      BuildContext context, String image) async {
    return await FirebaseStorage.instance.ref().child(image).getDownloadURL();
  }
}