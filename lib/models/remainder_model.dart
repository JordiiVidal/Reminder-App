class RemainderModel {
  int id;
  String date;
  String subject;
  String description;
  String time;

  RemainderModel({
    this.id,
    this.date,
    this.subject,
    this.description,
    this.time,
  });

  factory RemainderModel.fromJson(Map<String, dynamic> json) => RemainderModel(
        id: json["id"],
        date: json["date"],
        subject: json["subject"],
        description: json["description"],
        time: json["time"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date": date,
        "subject": subject,
        "description": description,
        "time": time,
      };
}
