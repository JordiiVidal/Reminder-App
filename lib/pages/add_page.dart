import 'package:flutter/material.dart';
import 'package:reminder/bloc/provider.dart';
import 'package:reminder/constants/style.dart';
import 'package:reminder/models/reminder_model.dart';
import 'package:reminder/utils/date_formater.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key key}) : super(key: key);

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  String _inputSubject = '';
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 12.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 30,
                height: 5,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.all(Radius.circular(12.0))),
              ),
            ],
          ),
          SizedBox(
            height: 18.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Añadir Recordatorio",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 24.0,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12.0,
          ),
          Theme(
            data: ThemeData(
              primaryColor: kPrimaryColor,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    maxLength: 24,
                    textCapitalization: TextCapitalization.sentences,
                    onChanged: (String val) =>
                        setState(() => _inputSubject = val),
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Escribir el título del recordatorio.";
                      }
                      return null;
                    },
                    initialValue: _inputSubject,
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 18.0,
                    ),
                    decoration: InputDecoration(
                      helperText: 'Escribir el nombre del recordatorio.',
                      helperStyle:
                          TextStyle(fontSize: 10.0, color: kPrimaryColor),
                      errorStyle:
                          TextStyle(fontSize: 9.0, color: kPrimaryColor),
                      labelText: 'Recordatorio',
                      labelStyle: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                      hintText: 'Título',
                      hintStyle: TextStyle(color: kPrimaryColor, fontSize: 20),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 12.0,
          ),
          RaisedButton(
            onPressed: () {
              final reminder = ReminderModel(
                date: convertDateTimeyMd(DateTime.now()).toString(),
                subject: _inputSubject,
                description: '',
                time: time(DateTime.now()),
              );
              bloc.insertEvent(reminder);
//            eventBloc.addRemainder(remainder);
              setState(() {
                _inputSubject = '';
              });
            },
            child: const Text(
              'CREAR',
              style: TextStyle(fontSize: 16.0),
            ),
            textColor: kLightColor,
            color: kPrimaryColor,
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 45.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        ],
      ),
    );
  }
}
