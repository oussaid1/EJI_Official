class ClubIncome {
  String id;
  String givenBy;
  String givenFor;
  String givenOnDate;
  int givenAmount;

  ClubIncome(
      {this.id,
      this.givenAmount,
      this.givenBy,
      this.givenFor,
      this.givenOnDate});

  Map<String, dynamic> toMap() {
    return {
      'givenBy': givenBy,
      'givenFor': givenFor,
      'givenDate': givenOnDate,
      'givenAmount': givenAmount,
    };
  }

  ClubIncome.fromMap(Map<String, dynamic> map, String id)
      : id = id,
        givenBy = map['givenBy'],
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
  String spentOn;
  String spentBy;
  String spentOnDate;
  int spentAmount;

  ClubSpendings(
      {this.id,
      this.spentAmount,
      this.spentBy,
      this.spentOn,
      this.spentOnDate});
  Map<String, dynamic> toMap() {
    return {
      'spentOn': spentOn,
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
        spentOn = map['spentOn'],
        spentBy = map['spentBy'],
        spentOnDate = map['spentOnDate'],
        spentAmount = map['spentAmount'];
}
