import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pesu/utils/view/widget.dart';

class CalendarDashboard extends StatefulWidget {
  const CalendarDashboard({Key? key}) : super(key: key);

  @override
  State<CalendarDashboard> createState() => _CalendarDashboardState();
}

class _CalendarDashboardState extends State<CalendarDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: sideNavAppBar("Calendar of Event"),
      body: Container(
        child: Center(
          child: Text("Data of events nor available",
          style: TextStyle(
            fontSize: 16
          ),
          ),
        ),
      ),
    );
  }
}
