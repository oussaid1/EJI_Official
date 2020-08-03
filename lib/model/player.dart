class Player {
  String id;
  String playerName;
  String dateOfBirth;
  String phone;
  String position;
  int regNum;
  String regDate;
  String email;
  String profileImage;

  Player(
      {this.id,
      this.playerName,
      this.dateOfBirth,
      this.profileImage,
      this.email,
      this.phone,
      this.position,
      this.regNum,
      this.regDate});
  Map<String, dynamic> toMap() {
    return {
     
      'playername': playerName,
      'dateofbirth': dateOfBirth,
      'phone': phone,
      'position': position,
      'regnum': regNum,
      'regdate': regDate,
      'email': email,
      
    };
  }

  Player.fromMap(Map<String, dynamic> map,String id) :
   id=id,
    playerName = map['playername'],
    dateOfBirth = map['dateofbirth'],
    phone = map['phone'],
    position = map['position'],
    regNum = map['regnum'],
    regDate = map['regdate'],
    email = map['email'];
    
  
}
