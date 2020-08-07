class MatchDay {
  String id;
  String matchdayDate;
  String matchdayType;
  String matchdayReferee;
  String matchdayHome;
  String matchdayAway;
  String matchdayHomeScore;
  String matchdayAwayScore;
  String matchdayHomeRedC;
  String matchdayAwayRedC;
  String matchdayHomeYellC;
  String matchdayAwayYellC;

  MatchDay({
    this.id,
    this.matchdayDate,
    this.matchdayType,
    this.matchdayReferee,
    this.matchdayHome,
    this.matchdayAway,
    this.matchdayHomeScore,
    this.matchdayAwayScore,
    this.matchdayHomeRedC,
    this.matchdayAwayRedC,
    this.matchdayHomeYellC,
    this.matchdayAwayYellC,
  });
  Map<String, dynamic> toMap() {
    return {
      'matchdaydate': matchdayDate,
      'matchdaytype': matchdayType,
      'matchdayreferee': matchdayReferee,
      'matchdayhome': matchdayHome,
      'matchdayaway': matchdayAway,
      'matchdayhomescore': matchdayHomeScore,
      'matchdayawayscore': matchdayAwayScore,
      'matchdayhomeredc': matchdayHomeRedC,
      'matchdayawayredc': matchdayAwayRedC,
      'matchdayhomeyellc': matchdayHomeYellC,
      'matchdayawayyellc': matchdayAwayYellC,
    };
  }

  MatchDay.fromMap(Map<String, dynamic> map, String id)
      : id = id,
        matchdayDate = map['matchdaydate'],
        matchdayType = map['matchdaytype'],
        matchdayReferee = map['matchdayreferee'],
        matchdayHome = map['matchdayhome'],
        matchdayAway = map['matchdayaway'],
        matchdayHomeScore = map['matchdayhomescore'],
        matchdayAwayScore = map['matchdayawayscore'],
        matchdayHomeRedC = map['matchdayhomeredc'],
        matchdayAwayRedC = map['matchdayawayredc'],
        matchdayHomeYellC = map['matchdayhomeyellc'],
        matchdayAwayYellC = map['matchdayawayyellc'];
}
