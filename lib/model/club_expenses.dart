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
      'givenOnDate': givenOnDate,
      'givenAmount': givenAmount,
    };
  }

  ClubIncome.fromMap(Map<String, dynamic> map, String id)
      : id = id,
        givenBy = map['budget'],
        givenFor = map['spendings'],
        givenOnDate = map['spendings'],
        givenAmount = map['spendings'];
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

  static List<ClubSpendings> getSpendings(List<ClubSpendings> spendings) {
    List<ClubSpendings> loo = new List<ClubSpendings>();

    for (var i = 0; i < spendings.length; i++) {
      loo.add(
        ClubSpendings(
            spentOn: 'Shirts',
            spentBy: 'Jamal',
            spentOnDate: '02-02-2020',
            spentAmount: 34255),
      );
    }

    return loo;
  }

  ClubSpendings.fromMap(Map<String, dynamic> map, String id)
      : id = id,
        spentOn = map['spentOn'],
        spentBy = map['spentBy'],
        spentOnDate = map['spentOnDate'],
        spentAmount = map['spentAmount'];
}
