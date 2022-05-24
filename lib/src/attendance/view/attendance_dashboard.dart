import 'package:flutter/material.dart';
import 'package:pesu/utils/view/widget.dart';

class AttendanceDashboard extends StatefulWidget {
  const AttendanceDashboard({Key? key}) : super(key: key);

  @override
  _AttendanceDashboardState createState() => _AttendanceDashboardState();
}

class _AttendanceDashboardState extends State<AttendanceDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: sideNavAppBar("Attendance"),
      drawer: Container(),
    );
  }
}
