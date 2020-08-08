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

  Comments.fromMap(Map<String, dynamic> map, String id)
      : id = id,
        subject = map['subject'],
        commentsDate = map['remarkdate'],
        commentsText = map['remark'],
        commentsBy = map['by'],
        commentsReply = map['answer']
       ;
}
