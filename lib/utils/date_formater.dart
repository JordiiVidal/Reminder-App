import 'package:intl/intl.dart';

final List<String> _days = [
  'Lunes',
  'Martes',
  'Miercoles',
  'Jueves',
  'Viernes',
  'Sabado',
  'Domingo'
];
final List<String> _months = [
  'Enero',
  'Febrero',
  'Marzo',
  'Abril',
  'Mayo',
  'Junio',
  'Julio',
  'Agosto',
  'Setiembre',
  'Octubre',
  'Noviembre',
  'Diciembre'
];

DateTime convertDateTimeyMd(DateTime dateTime) {
  var date = dateTime;
  var formatter = DateFormat('yyyy-MM-dd');
  String formatted = formatter.format(date);

  return DateTime.parse(formatted);
}

String getMonth(index) {
  return _months[index];
}

String getDay(index) {
  return _days[index];
}

String time(DateTime dateTime) {
  var hour = dateTime.hour;
  var minute = (dateTime.minute < 10) ? '0${dateTime.minute}' : dateTime.minute;
  return '$hour : $minute';
}

String stringDate(DateTime dateTime) {
  return "${_days[dateTime.weekday - 1]}, ${dateTime.day} de ${_months[dateTime.month - 1]}";
}

String stringDateString(stringDate) {
  var parsedDate = DateTime.parse(stringDate);

  return '${_days[parsedDate.weekday - 1]}, ${parsedDate.day} de ${_months[parsedDate.month - 1]} del ${parsedDate.year}';
}

String stringMonth(DateTime dateTime) {
  return "${_months[dateTime.month - 1]}";
}
