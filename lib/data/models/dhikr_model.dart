class Dhikr {
  final String id;
  final String count;
  final String date;
  String title;

  Dhikr({
    required this.id,
    required this.count,
    required this.title,
    required this.date,
  });

  Dhikr.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        id = json['id'],
        date = json['date'],
        count = json['count'];

  Map<String, dynamic> toJson() => {
        'title': title,
        'id': id,
        'date': date,
        'count': count,
      };
}
