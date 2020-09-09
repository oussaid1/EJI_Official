class Anounce {
  String id;
  String subject;
  int count;
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
      this.count,
      this.subject});
  Map<String, dynamic> toMap() {
    return {
      'subject': subject,
      'count': count,
      'anounceDate': anounceDate,
      'anounceText': anounceText,
      'anounceBy': anounceBy,
      'anounceDuration': anounceDuration,
    };
  }

  Anounce.fromMap(Map<String, dynamic> map, String id)
      : id = id,
        subject = map['subject'],
        count = map['count'],
        anounceDate = map['anounceDate'],
        anounceText = map['anounceText'],
        anounceBy = map['anounceBy'],
        anounceDuration = map['anounceDuration'];
}
