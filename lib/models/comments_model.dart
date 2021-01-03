import 'package:cloud_firestore/cloud_firestore.dart';

class Comments {
  String id;
  String subject;
  String commentsDate;
  String commentsText;
  String commentsBy;
  String commentsReply;

  Comments(
      {this.id,
      this.commentsBy,
      this.commentsDate,
      this.commentsReply,
      this.commentsText,
      this.subject});

  Map<String, dynamic> toMap() {
    return {
      'subject': subject,
      'remarkdate': commentsDate,
      'remark': commentsText,
      'by': commentsBy,
      'answer': commentsReply,
    };
  }
  Map<String, dynamic> toMapone() {
    return {
      'answer': commentsReply,
    };
  }

  Comments.fromMap(DocumentSnapshot map, String id)
      : id = id,
        subject = map['subject'],
        commentsDate = map['remarkdate'],
        commentsText = map['remark'],
        commentsBy = map['by'],
        commentsReply = map['answer'];
}
