import 'package:flutter/material.dart';

class AttendanceDashboard extends StatefulWidget {
  const AttendanceDashboard({Key? key}) : super(key: key);

  @override
  _AttendanceDashboardState createState() => _AttendanceDashboardState();
}

class _AttendanceDashboardState extends State<AttendanceDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Row(
          children: [
            Container(
              child: IconButton(icon: Icon(Icons.arrow_back_ios_outlined),
                onPressed: (){

                },

              ),
            ),
            Text("Attendance"),
          ],
        ),

      ),
    );
  }
}
