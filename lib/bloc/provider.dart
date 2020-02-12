import 'package:flutter/material.dart';
import 'package:reminder/bloc/calendar_bloc.dart';

class Provider extends InheritedWidget {
  final _calendarBloc = CalendarBloc();

  static Provider _instance;

  factory Provider({Key key, Widget child}) {
    //factory se utiliza para saber si se necesita crear una nueva instancia de la clase reutilizar la existente
    if (_instance == null) {
      _instance = new Provider._internal(
        key: key,
        child: child,
      ); //constructor privado para que solo se pueda inicializar desde dentro e la propia clase

    }

    return _instance;
  }

  Provider._internal({Key key, Widget child}) : super(key: key, child: child);

  @override //notificar a los child
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static CalendarBloc of(BuildContext context) {
    //context = arbol de widgets
    return context
        .dependOnInheritedWidgetOfExactType<Provider>()
        ._calendarBloc; //devuleve la instancia del login bloc
  }
}
