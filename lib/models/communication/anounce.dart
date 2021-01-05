import 'package:cloud_firestore/cloud_firestore.dart';

class Anounce {
  String id;
  String subject;
  String anounceDate;
  String anounceText;
  String anounceBy;
  String anounceDuration;

  Anounce(
      {this.id,
      this.anounceBy,
      this.anounceDate,
      this.anounceDuration,
      this.anounceText,
      this.subject});
  Map<String, dynamic> toMap() {
    return {
      'subject': subject,
      'anounceDate': anounceDate,
      'anounceText': anounceText,
      'anounceBy': anounceBy,
      'anounceDuration': anounceDuration,
      
    };
  }

  Anounce.fromMap(DocumentSnapshot map, String id)
      : id = id,
        subject = map['subject'],
        anounceDate = map['anounceDate'],
        anounceText = map['anounceText'],
        anounceBy = map['anounceBy'],
        anounceDuration = map['anounceDuration']
       ;
}
