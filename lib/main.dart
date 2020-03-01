import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:reminder/pages/home_page.dart';
import 'package:reminder/bloc/provider.dart';

void main() {
  initializeDateFormatting("es_ES", null).then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarDividerColor: Colors.black,
      statusBarColor: Color(0x00000000),
    ));
    return Provider(
        child: MaterialApp(
      title: 'Reminder App',
      initialRoute: 'home',
      debugShowCheckedModeBanner: false,
      routes: {
        'home': (BuildContext context) => HomePage(),
      },
    ));
  }
}
