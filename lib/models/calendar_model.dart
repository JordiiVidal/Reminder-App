
import 'package:reminder/models/remainder_model.dart';

class CalendarModel {
  List<RemainderModel> events;

  CalendarModel({
    this.events,
  });

  Map<DateTime, List<RemainderModel>> getEvents() {
    Map<DateTime, List<RemainderModel>> calendar = {};

    events.forEach((e) {
      final _dateTime = DateTime.parse(e.date);
      if (calendar.containsKey(_dateTime)) {
        calendar[_dateTime].add(e);
      } else {
        List<RemainderModel> list = new List();
        list.add(e);
        calendar[_dateTime] = list;
      }
    });

    return calendar;
  }
}
