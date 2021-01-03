import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String id;
  String name;
  String email;
  bool isAdmin;

  UserModel({this.id, this.name, this.email,this.isAdmin});

  UserModel.fromDocumentSnapshot({DocumentSnapshot documentSnapshot}) {
    id = documentSnapshot.id;
    name = documentSnapshot["name"];
    email = documentSnapshot["email"];
    isAdmin = documentSnapshot["isAdmin"];
  }
}