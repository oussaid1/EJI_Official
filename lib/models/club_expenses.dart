class ClubIncome {
  String id;
  int count;
  String givenBy;
  String givenFor;
  String givenOnDate;
  int givenAmount;

  ClubIncome(
      {this.id,
      this.count,
      this.givenAmount,
      this.givenBy,
      this.givenFor,
      this.givenOnDate});

  Map<String, dynamic> toMap() {
    return {
      'givenBy': givenBy,
      'count': count,
      'givenFor': givenFor,
      'givenDate': givenOnDate,
      'givenAmount': givenAmount,
    };
  }

  ClubIncome.fromMap(Map<String, dynamic> map, String id)
      : id = id,
        givenBy = map['givenBy'],
        count = map['count'],
        givenFor = map['givenFor'],
        givenOnDate = map['givenDate'],
        givenAmount = map['givenAmount'];

  static double getIncome(List<ClubIncome> income) {
    double sum = 0;
    for (var i = 0; i < income.length; i++) {
      sum += income[i].givenAmount;
    }

    return sum;
  }
}

class ClubSpendings {
  String id;
  int count;
  String spentOn;
  String spentBy;
  String spentOnDate;
  int spentAmount;

  ClubSpendings(
      {this.id,
      this.count,
      this.spentAmount,
      this.spentBy,
      this.spentOn,
      this.spentOnDate});
  Map<String, dynamic> toMap() {
    return {
      'spentOn': spentOn,
      'count': count,
      'spentBy': spentBy,
      'spentOnDate': spentOnDate,
      'spentAmount': spentAmount,
    };
  }

  static double getSpendings(List<ClubSpendings> spendings) {
    double sum = 0;
    for (var i = 0; i < spendings.length; i++) {
      sum += spendings[i].spentAmount;
    }

    return sum;
  }

  ClubSpendings.fromMap(Map<String, dynamic> map, String id)
      : id = id,
        count = map['count'],
        spentOn = map['spentOn'],
        spentBy = map['spentBy'],
        spentOnDate = map['spentOnDate'],
        spentAmount = map['spentAmount'];
}

/*
class IncomeSpendings {
  String id;
  double income;
  double spendings;
  String date;
 
  IncomeSpendings(
      {this.id,
      this.income,
      this.spendings,
      this.date
    });
  Map<String, dynamic> toMap() {
    return {
      'income': income,
      'spendings': spendings,
     
      
    };
  }

 static double getIcomes(List<IncomeSpendings> spendings) {
    double sum = 0;
    for (var i = 0; i < spendings.length; i++) {
      sum += spendings[i].income;
    }

    return sum;
  }
 static double getSpendings(List<IncomeSpendings> spendings) {
    double sum = 0;
    for (var i = 0; i < spendings.length; i++) {
      sum += spendings[i].spendings;
    }

    return sum;
  }

  IncomeSpendings.fromMap(Map<String, dynamic> map, String id)
      : id = id,
        income = map['income'],
        spendings = map['spendings'];
       
}
*/
