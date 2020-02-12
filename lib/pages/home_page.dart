import 'package:flutter/material.dart';
import 'package:reminder/bloc/events_bloc.dart';
import 'package:reminder/bloc/provider.dart';
import 'package:reminder/constants/style.dart';
import 'package:reminder/models/reminder_model.dart';
import 'package:reminder/utils/date_formater.dart';
import 'package:reminder/widgets/app_bar_home.dart';
import 'package:reminder/widgets/calendar_home.dart';
import 'package:reminder/widgets/remainder_card.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PanelController _controller = PanelController();
  final eventBloc = EventsBloc();

  String _inputSubject = '';

  void openPanel() {
    if (_controller.isPanelClosed()) {
      setState(() {
        _controller.open();
      });
    }
  }

  void closePanel() {
    if (_controller.isPanelOpen()) {
      setState(() {
        _controller.close();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: Container(
              padding: EdgeInsets.only(left: 12.0, right: 12.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  AppBarHome(openPanel),
                  Container(
                    margin: EdgeInsets.only(top: 10.0),
                    child: _buildTableCalendar(),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Recordatorios',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 21.0),
                    ),
                  ),
                  Expanded(
                    child: _buildTasksList(context),
                  )
                ],
              ),
            ),
          ),
          SlidingUpPanel(
            parallaxEnabled: true,
            parallaxOffset: .5,
            controller: _controller,
            minHeight: 40,
            maxHeight: size.height * 0.65,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18.0),
                topRight: Radius.circular(18.0)),
            panel: _panel(context),
          ),
        ],
      ),
    );
  }

  Widget _panel(BuildContext context) {
    final bloc = Provider.of(context);

    return Column(
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
                    errorStyle: TextStyle(fontSize: 9.0, color: kPrimaryColor),
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
            closePanel();
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
    );
  }

  Widget _buildTasksList(BuildContext context) {
    final bloc = Provider.of(context);

    return StreamBuilder(
      stream: bloc.eventsStream,
      builder:
          (BuildContext context, AsyncSnapshot<List<ReminderModel>> snapshot) {
        if (snapshot.hasData) {
          final reminders = snapshot.data;
          print(reminders);

          return ListView.builder(
            itemCount: reminders.length,
            itemBuilder: (context, i) {
              return ReminderCard(element: reminders[i]);
            },
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  Widget _buildTableCalendar() {
    final eventsBloc = new EventsBloc();

    return StreamBuilder<Map<DateTime, List<ReminderModel>>>(
      stream: eventsBloc.eventsStream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Container();
        }
        return CalendarHome(snapshot.data);
      },
    );
  }
}
