import 'package:flutter/material.dart';
import 'package:pesu/utils/view/widget.dart';

class DetailedAssignment extends StatefulWidget {
  const DetailedAssignment({Key? key}) : super(key: key);

  @override
  State<DetailedAssignment> createState() => _DetailedAssignmentState();
}

class _DetailedAssignmentState extends State<DetailedAssignment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: sideNavAppBar("Assignment"),
      backgroundColor:Colors.white.withOpacity(0.9),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          margin: EdgeInsets.only(top: 15,bottom: 15,left: 10,right: 10),
         padding: EdgeInsets.only(top: 15,bottom: 15,left: 10,right: 10),
child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text("UE17CS511 Problem solving with C",),
    SizedBox(height: 15,),

    Text("Due on: 02-Jun-2022",),
    SizedBox(height: 15,),
    Text("Maximum Marks:10",),

    SizedBox(height: 15,),
Text("Assignment Name",
  style: TextStyle(
      color: Color(0xff999999)
  ),
),

    Text("Assignment Testing"),
    SizedBox(height: 20,),
    Text("Details",
      style: TextStyle(
          color: Color(0xff999999)
      ),
    ),
    Text("Testing"),
    SizedBox(height: 20,),
    Text("Reference",
    style: TextStyle(
      color: Color(0xff999999)
    ),
    ),
    Text("Testing"),
    SizedBox(height: 20,),
  ],
)
        ),
      ),

    );
  }
}
