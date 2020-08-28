class AhdathModel {
  String id;
  String creationDate;
  String title;
  String description;
  String dueDate;
  String status;
  String status0;
  bool isDone;
  String responsible;

  AhdathModel(
      {this.id,
      this.title,
      this.description,
      this.dueDate,
      this.status,
      this.status0,
      this.creationDate,
      this.responsible,
      this.isDone});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'creationDate': creationDate,
      'description': description,
      'dueDate': dueDate,
      'status': status,
      'status0': status0,
      'responsible': responsible,
      'isDone': isDone,
    };
  }

  AhdathModel.fromMap(Map<String, dynamic> map, String idno)
      : id = idno,
        title = map['title'],
        creationDate = map['creationDate'],
        description = map['description'],
        dueDate = map['dueDate'],
        status = map['status'],
        status0 = map['status0'],
        responsible = map['responsible'],
        isDone = map['isDome'];
}
