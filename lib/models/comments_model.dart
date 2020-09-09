class Comments {
  String id;
  int count;
  String subject;
  String commentsDate;
  String commentsText;
  String commentsBy;
  String commentsReply;

  Comments(
      {this.id,
      this.count,
      this.commentsBy,
      this.commentsDate,
      this.commentsReply,
      this.commentsText,
      this.subject});

  Map<String, dynamic> toMap() {
    return {
      'subject': subject,
      'count': count,
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

  Comments.fromMap(Map<String, dynamic> map, String id)
      : id = id,
        subject = map['subject'],
        count = map['count'],
        commentsDate = map['remarkdate'],
        commentsText = map['remark'],
        commentsBy = map['by'],
        commentsReply = map['answer'];
}
