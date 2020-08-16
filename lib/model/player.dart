class Player {
  String id;
  String profileImage;
  int regNum;
  String playerName;
  String dateOfBirth;
  String placeOfBirth;
  String email;
  String phone;
  String regDate;
  String position;
  int seasons;
  int trainingScore;
  int desciplineScore;
  int positionMaster;
  int availability;
  int oVR;

  getScore() {
    return trainingScore + desciplineScore + positionMaster + availability;
  }

  Player({
    this.id,
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
  }) {
    this.oVR = trainingScore + desciplineScore + positionMaster + availability;
  }
  Map<String, dynamic> toMap() {
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
    };
  }

  Player.fromMap(Map<String, dynamic> map, String id)
      : id = id,
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
        desciplineScore = map['desciplineScore'];
}

class JuniorPlayer {
  String id;
  String profileImage;
  int regNum;
  String playerName;
  String dateOfBirth;
  String placeOfBirth;
  String email;
  String phone;
  String regDate;
  String position;
  int seasons;
  int trainingScore;
  int desciplineScore;
  int positionMaster;
  int availability;
  int oVR;
  JuniorPlayer({
    this.id,
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
  });

  Map<String, dynamic> toMap() {
    return {
      'profileImage': profileImage,
      'regNum': regNum,
      'playerName': playerName,
      'dateOfBirth': dateOfBirth,
      'placeOfBirth': placeOfBirth,
      'email': email,
      'phone': phone,
      'regDate': regDate,
      'position': position,
      'seasons': seasons,
      'desciplineScore': desciplineScore,
      'positionMaster': positionMaster,
      'availability': availability,
      'oVR': oVR,
      'trainingScore': trainingScore,
    };
  }

  JuniorPlayer.fromMap(Map<String, dynamic> map, String id)
      : id = id,
        playerName = map['playerName'],
        dateOfBirth = map['dateOfBirth'],
        phone = map['phone'],
        position = map['position'],
        regNum = map['regNum'],
        regDate = map['regDate'],
        email = map['email'],
        placeOfBirth = map['placeOfBirth'],
        seasons = map['seasons'],
        profileImage = map['profileImage'],
        trainingScore = map['trainingScore'],
        oVR = map['oVR'],
        availability = map['availability'],
        positionMaster = map['positionMaster'],
        desciplineScore = map['desciplineScore'];
}
