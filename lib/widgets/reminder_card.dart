import 'package:flutter/material.dart';

import 'package:reminder/constants/style.dart';
import 'package:reminder/models/reminder_model.dart';

class ReminderCard extends StatelessWidget {
  const ReminderCard({
    Key key,
    @required ReminderModel element,
  })  : _element = element,
        super(key: key);

  final ReminderModel _element;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.endToStart,
      key: UniqueKey(),
      onDismissed: (direction) {
        ///bloc.deleteRemainder(_element.id);
      },
      background: Container(
        color: Color(0xffd78989),
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              'Eliminar',
              style: TextStyle(
                color: kLightColor,
              ),
            ),
            Icon(
              Icons.delete,
              color: kLightColor,
            ),
          ],
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey[500], width: 0.2),
          ),
        ),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
              child: Text(
                _element.time,
                style: TextStyle(fontSize: 14.0, color: Colors.black87),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Column(
                children: <Widget>[
                  Text(
                    _element.subject,
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black45),
                  ),
                  SizedBox(
                    height: 3.0,
                  ),
                  Text(
                    _element.description,
                    style: TextStyle(fontSize: 12.0, color: Colors.black87),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
