class AhdathModel {
  String id;
  String title;
  String description;
  String dueDate;
  String status;
  bool isDone;
  String responsible;

  AhdathModel(
      {this.id,
      this.title,
      this.description,
      this.dueDate,
      this.status,
      this.responsible,
      this.isDone});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'dueDate': dueDate,
      'status': status,
      'responsible': responsible,
      'isDone': isDone,
    };
  }

  AhdathModel.fromMap(Map<String, dynamic> map, String idno)
      : id = idno,
        title = map['title'],
        description = map['description'],
        dueDate = map['dueDate'],
        status = map['status'],
        responsible = map['responsible'],
        isDone = map['isDome'];
}
