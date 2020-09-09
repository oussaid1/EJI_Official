class Player {
  String id;
  int count;
  String profileImage;
  String regNum;
  String playerName;
  String dateOfBirth;
  String placeOfBirth;
  String email;
  String phone;
  String regDate;
  String scoreDate;
  String position;
  String positionPlayed;
  int seasons;
  int trainingScore;
  int desciplineScore;
  int positionMaster;
  int availability;
  int oVR;
  bool rateable;

  get getoVR {
    return trainingScore + desciplineScore + positionMaster + availability;
  }

  Player.dummy(String pos) {
    this.id = '111111';
    this.playerName = 'Player X';
    this.dateOfBirth = '02-02-1990';
    this.profileImage = 'assets/images/ejilogo.png';
    this.email = 'player.X@gmail.com';
    this.phone = '0611111111';
    this.position = pos;
    this.regNum = '123456789';
    this.regDate = '02-02-2020';
    this.seasons = 2;
    this.placeOfBirth = 'Idawlstane';
    this.desciplineScore = 4;
    this.positionMaster = 4;
    this.availability = 4;
    this.oVR = 12;
    this.trainingScore = 4;
    this.rateable = true;
  }
  Player({
    this.id,
    this.count,
    this.playerName,
    this.dateOfBirth,
    this.profileImage,
    this.email,
    this.phone,
    this.position,
    this.regNum,
    this.regDate,
    this.seasons,
    this.placeOfBirth,
    this.desciplineScore,
    this.positionMaster,
    this.availability,
    this.oVR,
    this.trainingScore,
    this.rateable,
  }) {
    this.oVR = trainingScore + desciplineScore + positionMaster + availability;
  }
  Player.stats({
    this.id,
    this.count,
    this.playerName,
    this.regNum,
    this.scoreDate,
    this.positionPlayed,
    this.seasons,
    this.desciplineScore,
    this.positionMaster,
    this.availability,
    this.oVR,
    this.trainingScore,
  }) {
    this.oVR = trainingScore + desciplineScore + positionMaster + availability;
  }
  Map<String, dynamic> toMapStats() {
    return {
      'regnum': regNum,
      'count': count,
      'playername': playerName,
      'scoreDate': scoreDate,
      'positionPlayed': positionPlayed,
      'seasons': seasons,
      'desciplineScore': desciplineScore,
      'positionMaster': positionMaster,
      'availability': availability,
      'oVR': oVR,
      'trainingScore': trainingScore,
    };
  }

  Player.fromMapStats(Map<String, dynamic> map, String id)
      : id = id,
        playerName = map['playername'],
        count = map['count'],
        positionPlayed = map['positionPlayed'],
        regNum = map['regnum'],
        scoreDate = map['scoreDate'],
        seasons = map['seasons'],
        trainingScore = map['trainingScore'],
        oVR = map['oVR'],
        availability = map['availability'],
        positionMaster = map['positionMaster'],
        desciplineScore = map['desciplineScore'];

  toJson() {
    return {
      'profileimage': profileImage,
      'regnum': regNum,
      'playername': playerName,
      'dateofbirth': dateOfBirth,
      'placeofbirth': placeOfBirth,
      'email': email,
      'phone': phone,
      'regdate': regDate,
      'position': position,
      'seasons': seasons,
      'desciplineScore': desciplineScore,
      'positionMaster': positionMaster,
      'availability': availability,
      'oVR': oVR,
      'trainingScore': trainingScore,
      'rateable': rateable,
    };
  }

  toMap() {
    return {
      'profileimage': profileImage,
      'count': count,
      'regnum': regNum,
      'playername': playerName,
      'dateofbirth': dateOfBirth,
      'placeofbirth': placeOfBirth,
      'email': email,
      'phone': phone,
      'regdate': regDate,
      'position': position,
      'seasons': seasons,
      'desciplineScore': desciplineScore,
      'positionMaster': positionMaster,
      'availability': availability,
      'oVR': oVR,
      'trainingScore': trainingScore,
      'rateable': rateable,
    };
  }

  Player.fromMap(Map<String, dynamic> map, String id)
      : id = id,
        count = map['count'],
        playerName = map['playername'],
        dateOfBirth = map['dateofbirth'],
        phone = map['phone'],
        position = map['position'],
        regNum = map['regnum'],
        regDate = map['regdate'],
        email = map['email'],
        placeOfBirth = map['placeofbirth'],
        seasons = map['seasons'],
        profileImage = map['profileimage'],
        trainingScore = map['trainingScore'],
        oVR = map['oVR'],
        availability = map['availability'],
        positionMaster = map['positionMaster'],
        desciplineScore = map['desciplineScore'],
        rateable = map['rateable'];
}
