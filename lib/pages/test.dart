//Widget _panel(BuildContext context) {
//  final bloc = Provider.of(context);
//
//  return Column(
//    children: <Widget>[
//      SizedBox(
//        height: 12.0,
//      ),
//      Row(
//        mainAxisAlignment: MainAxisAlignment.center,
//        children: <Widget>[
//          Container(
//            width: 30,
//            height: 5,
//            decoration: BoxDecoration(
//                color: Colors.grey[300],
//                borderRadius: BorderRadius.all(Radius.circular(12.0))),
//          ),
//        ],
//      ),
//      SizedBox(
//        height: 18.0,
//      ),
//      Row(
//        mainAxisAlignment: MainAxisAlignment.center,
//        children: <Widget>[
//          Text(
//            "Añadir Recordatorio",
//            style: TextStyle(
//              fontWeight: FontWeight.normal,
//              fontSize: 24.0,
//            ),
//          ),
//        ],
//      ),
//      SizedBox(
//        height: 12.0,
//      ),
//      Theme(
//        data: ThemeData(
//          primaryColor: kPrimaryColor,
//        ),
//        child: Padding(
//          padding: const EdgeInsets.symmetric(horizontal: 16.0),
//          child: Column(
//            children: <Widget>[
//              TextFormField(
//                maxLength: 24,
//                textCapitalization: TextCapitalization.sentences,
//                onChanged: (String val) =>
//                    setState(() => _inputSubject = val),
//                validator: (value) {
//                  if (value.isEmpty) {
//                    return "Escribir el título del recordatorio.";
//                  }
//                  return null;
//                },
//                initialValue: _inputSubject,
//                style: TextStyle(
//                  color: kPrimaryColor,
//                  fontSize: 18.0,
//                ),
//                decoration: InputDecoration(
//                  helperText: 'Escribir el nombre del recordatorio.',
//                  helperStyle:
//                  TextStyle(fontSize: 10.0, color: kPrimaryColor),
//                  errorStyle: TextStyle(fontSize: 9.0, color: kPrimaryColor),
//                  labelText: 'Recordatorio',
//                  labelStyle: TextStyle(
//                      color: kPrimaryColor,
//                      fontSize: 12,
//                      fontWeight: FontWeight.w500),
//                  hintText: 'Título',
//                  hintStyle: TextStyle(color: kPrimaryColor, fontSize: 20),
//                  contentPadding:
//                  EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
//                ),
//              ),
//            ],
//          ),
//        ),
//      ),
//      SizedBox(
//        height: 12.0,
//      ),
//      RaisedButton(
//        onPressed: () {
//          final reminder = ReminderModel(
//            date: convertDateTimeyMd(DateTime.now()).toString(),
//            subject: _inputSubject,
//            description: '',
//            time: time(DateTime.now()),
//          );
//          bloc.insertEvent(reminder);
////            eventBloc.addRemainder(remainder);
//          setState(() {
//            _inputSubject = '';
//          });
//          closePanel();
//        },
//        child: const Text(
//          'CREAR',
//          style: TextStyle(fontSize: 16.0),
//        ),
//        textColor: kLightColor,
//        color: kPrimaryColor,
//        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 45.0),
//        shape: RoundedRectangleBorder(
//          borderRadius: BorderRadius.circular(20.0),
//        ),
//      ),
//    ],
//  );
//}

//  Widget _buildTasksList(BuildContext context) {
//    final bloc = Provider.of(context);
//
//    return Padding(
//      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15.0),
//      child: Column(
//        crossAxisAlignment: CrossAxisAlignment.start,
//        children: <Widget>[
//          Row(
//            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//            children: <Widget>[
//              Text(
//                'Hoy',
//                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0),
//              ),
//              GestureDetector(
//                onTap: openPanel,
//                child: Icon(_iconPanel),
//              )
//            ],
//          ),
//          SizedBox(
//            height: 15.0,
//          ),
//          Container(
//            color: Color.fromRGBO(69, 39, 160, 0.1),
//            child: Row(
//              children: <Widget>[
//                Expanded(
//                  flex: 1,
//                  child: Container(
//                    child: Column(
//                      mainAxisAlignment: MainAxisAlignment.start,
//                      mainAxisSize: MainAxisSize.max,
//                      children: <Widget>[
//                        Column(
//                          children: <Widget>[
//                            Text(
//                              'Oct',
//                              style: TextStyle(
//                                  fontSize: 15.0, color: Colors.white),
//                            ),
//                            Text(
//                              '23',
//                              style: TextStyle(
//                                  fontSize: 20.0,
//                                  fontWeight: FontWeight.w700,
//                                  color: Colors.white),
//                            ),
//                          ],
//                        ),
//                      ],
//                    ),
//                  ),
//                ),
//                Expanded(
//                  flex: 3,
//                  child: Container(
//                    color: Color.fromRGBO(142, 115, 221, 0.2),
//                    child: Column(
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      children: <Widget>[
//                        Dismissible(
//                          key: UniqueKey(),
//                          onDismissed: (direction) {},
//                          child: Container(
//                            color: Colors.red,
//                            padding: EdgeInsets.symmetric(
//                                vertical: 8.0, horizontal: 16),
//                            child: Column(
//                              crossAxisAlignment: CrossAxisAlignment.start,
//                              children: <Widget>[
//                                Text('Nombre de la tarea'),
//                                Text('23:00')
//                              ],
//                            ),
//                          ),
//                        ),
//                        Container(
//                          padding: EdgeInsets.symmetric(
//                              vertical: 8.0, horizontal: 16),
//                          child: Column(
//                            crossAxisAlignment: CrossAxisAlignment.start,
//                            children: <Widget>[
//                              Text('Nombre de la tarea'),
//                              Text('23:00')
//                            ],
//                          ),
//                        ),
//                      ],
//                    ),
//                  ),
//                )
//              ],
//            ),
//          ),
//          Container(
//            margin: EdgeInsets.only(bottom: 5.0),
//            decoration: BoxDecoration(
//              color: Color.fromRGBO(142, 115, 221, 1),
//              borderRadius: BorderRadius.circular(10),
//            ),
//            child: Row(
//              children: <Widget>[
//                Container(
//                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
//                  decoration: BoxDecoration(
//                    color: Color.fromRGBO(69, 39, 160, 1),
//                    borderRadius: BorderRadius.circular(10),
//                  ),
//                  child: Column(
//                    children: <Widget>[
//                      Text(
//                        'Oct',
//                        style: TextStyle(fontSize: 15.0, color: Colors.white),
//                      ),
//                      Text(
//                        '23',
//                        style: TextStyle(
//                            fontSize: 20.0,
//                            fontWeight: FontWeight.w700,
//                            color: Colors.white),
//                      ),
//                    ],
//                  ),
//                ),
//                Expanded(
//                  child: Container(
//                    padding:
//                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
//                    child: Column(
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      children: <Widget>[
//                        Text('Nombre de la tarea'),
//                        Text('23:00')
//                      ],
//                    ),
//                  ),
//                )
//              ],
//            ),
//          ),
//          Container(
//            color: Color.fromRGBO(222, 94, 94, 1),
//            child: Row(
//              children: <Widget>[
//                Container(
//                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
//                  color: Color.fromRGBO(198, 40, 40, 1),
//                  child: Column(
//                    children: <Widget>[
//                      Text(
//                        'Oct',
//                        style: TextStyle(fontSize: 15.0, color: Colors.white),
//                      ),
//                      Text(
//                        '23',
//                        style: TextStyle(
//                            fontSize: 20.0,
//                            fontWeight: FontWeight.w700,
//                            color: Colors.white),
//                      ),
//                    ],
//                  ),
//                ),
//                Expanded(
//                  child: Container(
//                    padding:
//                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
//                    child: Column(
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      children: <Widget>[
//                        Text('Nombre de la tarea'),
//                        Text('23:00')
//                      ],
//                    ),
//                  ),
//                )
//              ],
//            ),
//          ),
//          Container(
//            color: Color.fromRGBO(250, 183, 75, 1),
//            child: Row(
//              children: <Widget>[
//                Container(
//                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
//                  color: Color.fromRGBO(249, 168, 37, 1),
//                  child: Column(
//                    children: <Widget>[
//                      Text(
//                        'Oct',
//                        style: TextStyle(fontSize: 15.0, color: Colors.white),
//                      ),
//                      Text(
//                        '23',
//                        style: TextStyle(
//                            fontSize: 20.0,
//                            fontWeight: FontWeight.w700,
//                            color: Colors.white),
//                      ),
//                    ],
//                  ),
//                ),
//                Expanded(
//                  child: Container(
//                    padding:
//                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
//                    child: Column(
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      children: <Widget>[
//                        Text('Nombre de la tarea'),
//                        Text('23:00')
//                      ],
//                    ),
//                  ),
//                )
//              ],
//            ),
//          ),
//          Container(
//            color: Color.fromRGBO(255, 160, 82, 1),
//            child: Row(
//              children: <Widget>[
//                Container(
//                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
//                  color: Color.fromRGBO(239, 108, 0, 1),
//                  child: Column(
//                    children: <Widget>[
//                      Text(
//                        'Oct',
//                        style: TextStyle(fontSize: 15.0, color: Colors.white),
//                      ),
//                      Text(
//                        '23',
//                        style: TextStyle(
//                            fontSize: 20.0,
//                            fontWeight: FontWeight.w700,
//                            color: Colors.white),
//                      ),
//                    ],
//                  ),
//                ),
//                Expanded(
//                  child: Container(
//                    padding:
//                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
//                    child: Column(
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      children: <Widget>[
//                        Text('Nombre de la tarea'),
//                        Text('23:00')
//                      ],
//                    ),
//                  ),
//                )
//              ],
//            ),
//          ),
//          Container(
//            color: Color.fromRGBO(122, 206, 126, 1),
//            child: Row(
//              children: <Widget>[
//                Container(
//                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
//                  color: Color.fromRGBO(46, 125, 50, 1),
//                  child: Column(
//                    children: <Widget>[
//                      Text(
//                        'Oct',
//                        style: TextStyle(fontSize: 15.0, color: Colors.white),
//                      ),
//                      Text(
//                        '23',
//                        style: TextStyle(
//                            fontSize: 20.0,
//                            fontWeight: FontWeight.w700,
//                            color: Colors.white),
//                      ),
//                    ],
//                  ),
//                ),
//                Expanded(
//                  child: Container(
//                    padding:
//                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
//                    child: Column(
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      children: <Widget>[
//                        Text('Nombre de la tarea'),
//                        Text('23:00')
//                      ],
//                    ),
//                  ),
//                )
//              ],
//            ),
//          ),
//          Container(
//            color: Color.fromRGBO(93, 161, 237, 1),
//            child: Row(
//              children: <Widget>[
//                Container(
//                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
//                  color: Color.fromRGBO(21, 101, 192, 1),
//                  child: Column(
//                    children: <Widget>[
//                      Text(
//                        'Oct',
//                        style: TextStyle(fontSize: 15.0, color: Colors.white),
//                      ),
//                      Text(
//                        '23',
//                        style: TextStyle(
//                            fontSize: 20.0,
//                            fontWeight: FontWeight.w700,
//                            color: Colors.white),
//                      ),
//                    ],
//                  ),
//                ),
//                Expanded(
//                  child: Container(
//                    padding:
//                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
//                    child: Column(
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      children: <Widget>[
//                        Text('Nombre de la tarea'),
//                        Text('23:00')
//                      ],
//                    ),
//                  ),
//                )
//              ],
//            ),
//          ),
//          Container(
//            color: Color.fromRGBO(224, 224, 224, 1),
//            child: Row(
//              children: <Widget>[
//                Container(
//                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
//                  color: Color.fromRGBO(175, 175, 175, 1),
//                  child: Column(
//                    children: <Widget>[
//                      Text(
//                        'Oct',
//                        style: TextStyle(fontSize: 15.0, color: Colors.white),
//                      ),
//                      Text(
//                        '23',
//                        style: TextStyle(
//                            fontSize: 20.0,
//                            fontWeight: FontWeight.w700,
//                            color: Colors.white),
//                      ),
//                    ],
//                  ),
//                ),
//                Expanded(
//                  child: Container(
//                    padding:
//                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
//                    child: Column(
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      children: <Widget>[
//                        Text('Nombre de la tarea'),
//                        Text('23:00')
//                      ],
//                    ),
//                  ),
//                )
//              ],
//            ),
//          ),
//        ],
//      ),
//    );
//  }
//}

///
/// StreamBuilder(
//            stream: bloc.eventsStream,
//            builder: (BuildContext context,
//                AsyncSnapshot<List<ReminderModel>> snapshot) {
//              if (snapshot.hasData) {
//                final reminders = snapshot.data;
//                print(reminders);
//
//                return ListView.builder(
//                  itemCount: reminders.length,
//                  itemBuilder: (context, i) {
//                    return ReminderCard(element: reminders[i]);
//                  },
//                );
//              } else {
//                return CircularProgressIndicator();
//              }
//            },
//          ),
