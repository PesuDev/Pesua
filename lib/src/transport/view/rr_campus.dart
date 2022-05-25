import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pesu/src/transport/view/routes_campus.dart';

class RRCampus extends StatefulWidget {
  const RRCampus({Key? key}) : super(key: key);

  @override
  _RRCampusState createState() => _RRCampusState();
}

class _RRCampusState extends State<RRCampus> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
child: SingleChildScrollView(
  child:   Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      RoutesCampus(),
contactInfo(),
    ],
  ),
),
    );
  }
Widget contactInfo(){
  return Container(
    margin: EdgeInsets.only(left: 15,bottom: 15,right: 15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
Text("Procedure to Enroll",
style: TextStyle(color: Colors.redAccent,
fontSize: 18,
  height: 1
),
),
        SizedBox(height: 10,),
        Text("Please follow this link for further details: ",
          style: TextStyle(
              fontSize: 14,
              height: 1
          ),

        ),
        SizedBox(height: 5,),
        Text("https://www.pes.edu/new-students/transportation/",
          style: TextStyle(
              fontSize: 14,
              height: 1,
            color: Colors.blue
          ),
        ),
        SizedBox(height: 35,),
        Text("Note:",
          style: TextStyle(color: Colors.redAccent,
              fontSize: 14,
              height: 1
          ),
        ),
        SizedBox(height: 5,),
        Text("The pickup points in the routes mentioned are final and there will not be any changes",
          style: TextStyle(
              fontSize: 14,
              height: 1,
            fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(height: 5,),
        Text("Payments can be made Online and by DD in favour of 'PES University General Fund' payable at Bangalore."),
       SizedBox(height: 5,),
        Text("Cash/Cheque Not Accepted",
          style: TextStyle(
              fontSize: 14,
              height: 1,
              fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(height: 5,),
        Row(
          children: [
            Text("Email : ",
              style: TextStyle(
                  fontSize: 14,
                  height: 1,
                  fontWeight: FontWeight.bold
              ),
            ),
            Text(" prajoth@pes.edu",
              style: TextStyle(
                  fontSize: 14,
                  height: 1,
                  fontWeight: FontWeight.bold,
                color: Colors.blue
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
}
