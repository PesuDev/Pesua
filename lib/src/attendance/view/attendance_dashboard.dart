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
     // drawer: Container(),
      body: Container(
        margin: EdgeInsets.only(top: 15,left: 15,right: 15,bottom: 15),
child: SingleChildScrollView(
  child:   Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
  decoration: BoxDecoration(
    border: Border.all(color: Colors.blueGrey)
  ),
        child: TextButton(onPressed: (){},

            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Sem-3",
            style: TextStyle(
              color: Colors.black,
            ),
            ),
            Icon(Icons.arrow_drop_down_outlined,
            color: Colors.black,
            ),
          ],
        )),
      ),

  attendanceList(),
    ],

  ),
),
      ),
    );
  }
  Widget attendanceList(){
    return Container(
      child: Column(
        children: [

          Container(
            margin: EdgeInsets.only(top: 15),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color(0xff163269)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Text("SUBJECT",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16
                  ),
                ),
                Text("ATTENDANCE  %" ,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16
                  ),
                ),
              ],
            ),
          ),
          ListTileTheme.merge(
            child: ListView.builder(
              shrinkWrap: true,
physics: NeverScrollableScrollPhysics(),
                itemCount: 33,
                itemBuilder: (context,index){
              return Container(
                margin: EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex:2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("UE20CS251",
                              style: TextStyle(


                                fontSize: 14
                              ),
                              ),
                              Text("Design and Analysis of Algorithm",
                                maxLines: 4,
                                style: TextStyle(


                                    fontSize: 14
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 20,),
                        Expanded(child: Text("21/50")),
                        SizedBox(width: 5,),
                        Expanded(child: Text("42")),
                        SizedBox(width: 5,),
                        Expanded(child: Text(">")),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Divider(),
                  ],
                ),

              );
            }),
          ),
        ],
      ),
    );
  }
}
