import 'package:flutter/material.dart';
import 'package:reminder/bloc/provider.dart';
import 'package:reminder/utils/date_formater.dart';

class AppBarHome extends StatelessWidget {
  final Function openPanel;
  AppBarHome(this.openPanel);
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);

    return SafeArea(
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            StreamBuilder<DateTime>(
              stream: bloc.focusDateStream,
              builder: (context, snapshot) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      stringMonth(
                          (snapshot.hasData) ? snapshot.data : DateTime.now()),
                      style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      (snapshot.hasData)
                          ? snapshot.data.year.toString()
                          : DateTime.now().year.toString(),
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                );
              },
            ),
            Row(
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    openPanel();
                  },
                  icon: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
                Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
