import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pesu/utils/view/widget.dart';

class NotificationDashboard extends StatefulWidget {
  const NotificationDashboard({Key? key}) : super(key: key);

  @override
  State<NotificationDashboard> createState() => _NotificationDashboardState();
}

class _NotificationDashboardState extends State<NotificationDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar:sideNavAppBar("Notification"),

      body: Container(
margin: EdgeInsets.only(left: 15,right: 15,top: 20,bottom: 20),
child: ListView.builder(
  itemCount: 15,
  itemBuilder: (BuildContext context, int index) {
    return  Card(
margin: EdgeInsets.only(bottom: 15),
      child: Container(
        padding: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("PESU - Announcement",style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,

                ),),
                Icon(Icons.clear,
                size: 15,
                  color: Color(0xff999999),
                ),
              ],
            ),
            SizedBox(height: 5,),
            Text("Intership opportunities at cRAIS",style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,

            ),),
            SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("03-06-2022, 18:15:30",style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff999999),
                ),),
                Icon(Icons.keyboard_arrow_right,
                  size: 15,
                  color: Color(0xff999999),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  },
),
      ),
    );
  }
}
