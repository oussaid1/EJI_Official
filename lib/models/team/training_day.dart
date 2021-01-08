import 'package:cloud_firestore/cloud_firestore.dart';

class TrainingDay {
  String id;
  int count;
  String trainingDate;
  String responsible;
  int attendees;
  int duration;
  int countTraining;
// List<TrainingDay> trainingDays = <TrainingDay>[];

  TrainingDay(
      {this.id,
      this.attendees,
      this.responsible,
      this.count,
      this.duration,
      this.trainingDate});

  toMap() {
    return {
      'attendees': attendees,
      'trainingDate': trainingDate,
      'responsible': responsible,
      'duration': duration,
      'count': count,
    };
  }



  TrainingDay.fromMap(DocumentSnapshot map, String id)
      : id = id,
        attendees = map['attendees'],
        trainingDate = map['trainingDate'],
        count = map['count'],
        duration = map['duration'],
        responsible = map['responsible'];
}
