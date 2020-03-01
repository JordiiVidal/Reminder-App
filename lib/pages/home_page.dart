import 'package:flutter/material.dart';
import 'package:reminder/bloc/calendar_bloc.dart';
import 'package:reminder/bloc/events_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:reminder/constants/style.dart';
import 'package:reminder/models/reminder_model.dart';
import 'package:reminder/widgets/app_bar_home.dart';
import 'package:reminder/widgets/calendar_home.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PanelController _controller = PanelController();
  final key = new GlobalKey();
  final containerKey = GlobalKey();
  IconData _iconPanel = Icons.keyboard_arrow_up;

  final eventBloc = EventsBloc();

  double _minHeightPanel = 300;

  void openPanel() {
    setState(() {
      if (_controller.isPanelOpen) {
        _controller.open();
        _iconPanel = Icons.keyboard_arrow_down;
      } else {
        _controller.close();
        _iconPanel = Icons.keyboard_arrow_up;
      }
    });
  }

  void closePanel() {
    if (_controller.isPanelOpen) {
      setState(() {
        _controller.close();
      });
    }
  }

  void changePanel(height) {
    double maxHeight = MediaQuery.of(context).size.height;
    double headerHegiht = containerKey.currentContext.size.height;
    print(headerHegiht);
    height = maxHeight - (height + headerHegiht + 50);
    setState(() {
      _minHeightPanel = height;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bloc = new CalendarBloc();
    final eventsBloc = new EventsBloc();
    double height = MediaQuery.of(context).size.height;
    double statusBarHeight = MediaQuery.of(context).padding.top;

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
                  Container(
                    key: containerKey,
                    child: AppBarHome(openPanel),
                  ),
                  Container(
                    key: key,
                    margin: EdgeInsets.only(top: 10.0),
                    child: StreamBuilder<Map<DateTime, List<ReminderModel>>>(
                      stream: eventsBloc.eventsStream,
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Container();
                        }
                        return CalendarHome(snapshot.data, changePanel);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          SlidingUpPanel(
            parallaxEnabled: true,
            parallaxOffset: .5,
            controller: _controller,
            minHeight: _minHeightPanel,
            maxHeight: height - statusBarHeight,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0),
              topRight: Radius.circular(25.0),
            ),
            panelBuilder: (ScrollController sc) => _scrollingList(sc),
          ),
        ],
      ),
    );
  }

  Widget _scrollingList(ScrollController sc) {
    return ListView.builder(
      controller: sc,
      itemCount: 50,
      itemBuilder: (BuildContext context, int i) {
        return Slidable(
          actionPane: SlidableDrawerActionPane(),
          actionExtentRatio: 0.25,
          actions: <Widget>[
            IconSlideAction(
              caption: 'Archive',
              color: Colors.blue,
              icon: Icons.archive,
              onTap: () => print('Archive'),
            ),
            IconSlideAction(
              caption: 'Share',
              color: Colors.indigo,
              icon: Icons.share,
              onTap: () => print('Share'),
            ),
          ],
          secondaryActions: <Widget>[
            IconSlideAction(
              caption: 'More',
              color: Colors.black45,
              icon: Icons.more_horiz,
              onTap: () => print('More'),
            ),
            IconSlideAction(
              caption: 'Delete',
              color: Colors.red,
              icon: Icons.delete,
              onTap: () => print('Delete'),
            ),
          ],
          child: Container(
            color: Colors.white,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.indigoAccent,
                child: Text('$i'),
                foregroundColor: Colors.white,
              ),
              title: Text('Tile n°$i'),
              subtitle: Text('SlidableDrawerDelegate'),
            ),
          ),
        );
      },
    );
  }
}
