class ClubArcive {
  String id;
  String imageLocation;
  int thumbsUp;
  int thumbsDown;
  String season;
  String takenBy;

  ClubArcive(
      {this.imageLocation,
      this.takenBy,
      this.season,
      this.id,
      this.thumbsDown,
      this.thumbsUp});

  Map<String, dynamic> toMap() {
    return {
      'imageLocation': imageLocation,
      'season': season,
      'takenBy': takenBy,
      'thumbsUp': thumbsUp,
      'thumbsDown': thumbsDown,
    };
  }

  ClubArcive.fromMap(Map<String, dynamic> map, String id)
      : id = id,
        imageLocation = map['imageLocation'],
        season = map['season'],
        takenBy = map['takenBy'],
        thumbsUp = map['thumbsUp'],
        thumbsDown = map['thumbsDown'];
}
