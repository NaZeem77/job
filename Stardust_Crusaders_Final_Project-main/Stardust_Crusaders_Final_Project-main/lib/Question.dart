class Question {
  String? Type;
  String? Entry;
  DateTime? Date;

  Question();
  Map<String, dynamic> toJson() => {'Type': Type, 'Entry': Entry, 'Date': Date};
  Question.fromSnapshot(snapshot)
    :Type = snapshot.data()['Type'],
     Entry = snapshot.data()['Entry'],
     Date = snapshot.data()['Date'].toDate();
}