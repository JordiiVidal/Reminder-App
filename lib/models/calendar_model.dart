import 'package:reminder/models/reminder_model.dart';

class CalendarModel {
  List<ReminderModel> events;

  CalendarModel({
    this.events,
  });

  Map<DateTime, List<ReminderModel>> getEvents() {
    Map<DateTime, List<ReminderModel>> calendar = {};

    events.forEach((e) {
      final _dateTime = DateTime.parse(e.date);
      if (calendar.containsKey(_dateTime)) {
        calendar[_dateTime].add(e);
      } else {
        List<ReminderModel> list = new List();
        list.add(e);
        calendar[_dateTime] = list;
      }
    });

    return calendar;
  }
}
