class Expenses {
  String id;
  String budget;
  String spendings;

  Expenses({
    this.id,
    this.budget,
    this.spendings,
  });
  Map<String, dynamic> toMap() {
    return {
      'Incomes': budget,
      'Spendings': spendings,
    };
  }

  Expenses.fromMap(Map<String, dynamic> map, String id)
      : id = id,
        budget = map['Incomes'],
        spendings = map['Spendings'];
}
