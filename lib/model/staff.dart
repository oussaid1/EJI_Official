


class Staff {
  
  String id;
  String presedent;
  String chefExc;
  String coach;
  String coachAssistant;
  String medicalAssistant;
  String trainerPHY;
  String coordinator1;
  String coordinator2;
  String financeDir;
  String counceler1;
  String counceler2;
  String counceler3;
 
 

  Staff(
      {this.id,
      this.presedent,
      this.chefExc,
      this.coach,
      this.coachAssistant,
      this.trainerPHY,
      this.medicalAssistant,
      this.coordinator1,
      this.coordinator2,
      this.financeDir,
      this.counceler1,
      this.counceler2,
      this.counceler3,
      
      });
  Map<String, dynamic> toMap() {
    return {
      'president': presedent,
      'chefExec': chefExc,
      'coach': coach,
      'assistantCoach': coachAssistant,
      'medicalAssistant': medicalAssistant,
      'trainerPhy': trainerPHY,
      'coordinator1': coordinator1,
      'coordinator2': coordinator2,
      'financeDirector': financeDir,
      'councelor1': counceler1,
      'councelor2': counceler2,
      'councellor3': counceler3,
    };
  }
  Staff.fromMap(Map<String, dynamic> map, String id)
      : id = id,
        presedent = map['president'],
        chefExc = map['chefExec'],
        coach = map['coach'],
        coachAssistant = map['assistantCoach'],
        medicalAssistant = map['medicalAssistant'],
        trainerPHY = map['trainerPhy'],
        coordinator1 = map['coordinator1'],
        coordinator2 = map['coordinator2'],
        financeDir = map['financeDirector'],
        counceler1 = map['councelor1'],
        counceler2 = map['councelor2'],
        counceler3 = map['councellor3'];
       
       
}
