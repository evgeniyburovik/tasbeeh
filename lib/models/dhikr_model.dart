import 'package:equatable/equatable.dart';

class Dhikr extends Equatable {
  final String id;
  final String count;
  final String date;
  String? title;

  Dhikr({
    required this.id,
    required this.count,
    required this.title,
    required this.date,
  }) {
    title = title ?? '';
  }

  Dhikr copyWith({
    String? id,
    String? count,
    String? title,
    String? date,
  }) {
    return Dhikr(
      count: count ?? this.count,
      title: title ?? this.title,
      date: date ?? this.date,
      id: id ?? this.id,
    );
  }

  @override
  List<Object?> get props => [
        count,
        title,
        date,
        id,
      ];

  static List<Dhikr> dhikrs = [
    Dhikr(
      id: '1',
      count: '234',
      title: 'Какое-то описание но не понимаю какое',
      date: '23/06/2023',
    ),
    Dhikr(
      id: '2',
      count: '23',
      title: 'Какое-то описание но не понимаю какое',
      date: '23/06/2023',
    )
  ];
}
