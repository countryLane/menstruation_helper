import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';

class FirstTab extends StatefulWidget {
  FirstTab({Key key}) : super(key: key);

   _currentState 

  @override
  _FirstTabState createState() => new _FirstTabState();
}

class _FirstTabState extends State<FirstTab> with TickerProviderStateMixin {
  static Widget _eventIcon = Container(
    margin: EdgeInsets.fromLTRB(0, 39, 0, 0),
    color: Colors.blue,
  );

  EventList<Event> _markedDateMap = new EventList<Event>();

  @override
  void initState() {
    super.initState();
    _markedDateMap.add(
        new DateTime(2019, 4, 17),
        new Event(
          date: new DateTime(2019, 4, 17),
          icon: _eventIcon,
        ));
    _markedDateMap.add(
        new DateTime(2019, 4, 18),
        new Event(
          date: new DateTime(2019, 4, 18),
          icon: _eventIcon,
        ));
  }

  BottomSheet _getBottomSheet(BuildContext context) {
    return BottomSheet(
      builder: (BuildContext context) {
        return Container(
            height: 90,
            padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: Center(
                child: Text('coming',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.green[400],
                    ))));
      },
      animationController:
          AnimationController(vsync: this, lowerBound: 0.0, upperBound: 1.0),
      enableDrag: false,
      onClosing: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    CalendarCarousel _calendar = CalendarCarousel<Event>(
        onDayPressed: (DateTime date, List<Event> events) {
          showModalBottomSheet(context: this.context, builder: _getBottomSheet);
        },
        weekendTextStyle: TextStyle(color: Colors.blue),
        headerTextStyle: TextStyle(color: Colors.black87),
        weekFormat: false,
        height: 450,
        selectedDateTime: null,
        iconColor: Colors.black87,
        prevDaysTextStyle: TextStyle(color: Colors.grey),
        todayButtonColor: Colors.pink[200],
        markedDatesMap: _markedDateMap,
        markedDateShowIcon: true,
        markedDateIconBuilder: (event) {
          return event.icon;
        });

    return new Scaffold(
        backgroundColor: Colors.white,
        body: new Container(
            child: new Center(
                child: new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
              _calendar,
            ]))));
  }
}
