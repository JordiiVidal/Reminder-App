import 'dart:async';
import 'package:rxdart/rxdart.dart';

class CalendarBloc {
  final _focusDateController = BehaviorSubject<DateTime>();
  final _selectDateController = BehaviorSubject<DateTime>();

  CalendarBloc() {
    changeFocusDate(DateTime.now());
    changeSelectDate(DateTime.now());
  }

  // Sink -> Controller
  Function(DateTime) get changeFocusDate => _focusDateController.sink.add;
  Function(DateTime) get changeSelectDate => _selectDateController.sink.add;

  // Controller -> Stream

  Stream<DateTime> get focusDateStream => _focusDateController.stream;
  Stream<DateTime> get selectDateStream => _selectDateController.stream;

  // Value

  DateTime get focusDate => _focusDateController.value;
  DateTime get selectedDate => _selectDateController.value;

  dispose() {
    _focusDateController?.close();
    _selectDateController?.close();
  }
}
