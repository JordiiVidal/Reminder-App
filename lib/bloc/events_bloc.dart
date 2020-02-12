import 'dart:async';

import 'package:reminder/models/reminder_model.dart';
import 'package:reminder/providers/db_provider.dart';

class EventsBloc {
  static final EventsBloc _singleton = new EventsBloc._internal();

  factory EventsBloc() {
    return _singleton;
  }

  EventsBloc._internal() {
    getCalendar();
  }

  final _eventsController =
      StreamController<Map<DateTime, List<ReminderModel>>>.broadcast();

  Stream<Map<DateTime, List<ReminderModel>>> get eventsStream =>
      _eventsController.stream;

  dispose() {
    _eventsController?.close();
  }

  refreshData() {
    getCalendar();
  }

  getCalendar() async {
    _eventsController.sink.add(await DBProvider.dbProvider.getCalendar());
  }

  addRemainder(ReminderModel remainder) async {
    await DBProvider.dbProvider.insertReminder(remainder);
    getCalendar();
  }

  deleteRemainder(int id) async {
    await DBProvider.dbProvider.deleteReminder(id);
    getCalendar();
  }
}
