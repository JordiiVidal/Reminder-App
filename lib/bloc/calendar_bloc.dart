import 'dart:async';
import 'package:rxdart/rxdart.dart';

import 'package:reminder/models/reminder_model.dart';
import 'package:reminder/providers/db_provider.dart';

class CalendarBloc {
  final _focusDateController = BehaviorSubject<DateTime>();
  final _selectDateController = BehaviorSubject<DateTime>();
  final _remindersController = BehaviorSubject<List<ReminderModel>>();

  final _eventsProvider = DBProvider.dbProvider;

  CalendarBloc() {
    changeFocusDate(DateTime.now());
    changeSelectDate(DateTime.now());
    loadEvents();
  }

  // Sink -> Controller
  Function(DateTime) get changeFocusDate => _focusDateController.sink.add;
  Function(DateTime) get changeSelectDate => _selectDateController.sink.add;

  // Controller -> Stream

  Stream<DateTime> get focusDateStream => _focusDateController.stream;
  Stream<DateTime> get selectDateStream => _selectDateController.stream;
  Stream<List<ReminderModel>> get eventsStream => _remindersController.stream;

  // Value

  DateTime get focusDate => _focusDateController.value;
  DateTime get selectedDate => _selectDateController.value;

  void loadEvents() async {
    final events = await _eventsProvider.getReminders();
    _remindersController.sink.add(events);
  }

  void insertEvent(ReminderModel reminder) async {
    await _eventsProvider.insertReminder(reminder);
    loadEvents();
  }

  void deleteEvent(id) async {
    await _eventsProvider.deleteReminder(id);
  }

  dispose() {
    _focusDateController?.close();
    _selectDateController?.close();
    _remindersController?.close();
  }
}
