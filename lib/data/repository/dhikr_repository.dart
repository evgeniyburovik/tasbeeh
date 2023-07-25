import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import '../models/dhikr_model.dart';

class DhikrRepository {
  final uuid = const Uuid();
  List<Dhikr> dhikrs = [];

  List<Dhikr> addDhikr(
    String title,
    int count,
  ) {
    final dhikr = Dhikr(
        id: const Uuid().v4(),
        count: count.toString(),
        title: title,
        date: DateFormat('dd.MM.yyyy').format(DateTime.now()));

    dhikrs.add(dhikr);
    return dhikrs;
  }

  List<Dhikr> updateDhikrState(String title, String id) {
    for (Dhikr element in dhikrs) {
      if (element.id == id) {
        element.title = title;
      }
    }
    return dhikrs;
  }

  List<Dhikr> removeDhikr(String id) {
    dhikrs.removeWhere((element) => element.id == id);
    return dhikrs;
  }
}
