import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:reminder/bloc/events_bloc.dart';
import 'package:reminder/bloc/provider.dart';
import 'package:reminder/constants/style.dart';
import 'package:reminder/utils/date_formater.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarHome extends StatefulWidget {
  final events;

  CalendarHome(this.events);
  @override
  _CalendarHomeState createState() => _CalendarHomeState();
}

class _CalendarHomeState extends State<CalendarHome>
    with TickerProviderStateMixin {
  final eventBloc = EventsBloc();
  List _selectedEvents;
  AnimationController _animationController;
  CalendarController _calendarController;
  String _currentDate;
  DateTime dateTimeSelected;
  DateTime focusDate;

  @override
  void initState() {
    super.initState();
    final _selectedDay = convertDateTimeyMd(DateTime.now());
    dateTimeSelected = convertDateTimeyMd(_selectedDay);
    focusDate = DateTime.now();
    _currentDate = stringDate(_selectedDay);

    _selectedEvents = widget.events[dateTimeSelected] ?? [];

    _calendarController = CalendarController();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _calendarController.dispose();
    super.dispose();
  }

  void _onDaySelected(DateTime day, List events) {
    final bloc = Provider.of(context);

    setState(() {
      dateTimeSelected = convertDateTimeyMd(day);
      _currentDate = stringDate(day);
      _selectedEvents = widget.events[dateTimeSelected] ?? [];
      bloc.changeSelectDate(day);
    });
  }

  void _onVisibleDaysChanged(
      DateTime first, DateTime last, CalendarFormat format) {
    final bloc = Provider.of(context);
    bloc.changeFocusDate(_calendarController.focusedDay);
  }

  void _loadEvents() {
    setState(() {
      _selectedEvents = widget.events[dateTimeSelected] ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    _loadEvents();
    return _calendar();
  }

  Widget _calendar() {
    return TableCalendar(
      availableGestures: AvailableGestures.horizontalSwipe,
      locale: 'es_ES',
      calendarController: _calendarController,
      events: widget.events,
      startingDayOfWeek: StartingDayOfWeek.monday,
      calendarStyle: CalendarStyle(
        renderDaysOfWeek: true,
        renderSelectedFirst: true,
        contentPadding: EdgeInsets.all(3.0),
        todayStyle: TextStyle(
            fontSize: 11.0, fontWeight: FontWeight.w300, color: Colors.black45),
        selectedStyle: TextStyle(
            fontSize: 15.0, fontWeight: FontWeight.w500, color: kPrimaryColor),
        weekendStyle: TextStyle(
            fontSize: 13.0, fontWeight: FontWeight.w400, color: kLightColor),
        weekdayStyle: TextStyle(
            fontSize: 13.0, fontWeight: FontWeight.w400, color: kLightColor),
        selectedColor: Colors.white,
        todayColor: Color.fromRGBO(136, 215, 202, 0.3),
        markersColor: Colors.deepOrange,
        markersMaxAmount: 3,
        outsideDaysVisible: true,
        outsideStyle: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w300,
          color: Color(0xff3c3e42),
        ),
        outsideWeekendStyle: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w300,
          color: Color(0xff3c3e42),
        ),
      ),
      daysOfWeekStyle: DaysOfWeekStyle(
        weekdayStyle: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 11.0,
            color: kLightColor,
            letterSpacing: 0.5),
        weekendStyle: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 11.0,
            color: kLightColor,
            letterSpacing: 0.5),
        dowTextBuilder: (date, locale) =>
            DateFormat.E(locale).format(date).toUpperCase().substring(0, 3),
      ),
      headerVisible: false,
      onDaySelected: _onDaySelected,
      onVisibleDaysChanged: _onVisibleDaysChanged,
    );
  }
}
