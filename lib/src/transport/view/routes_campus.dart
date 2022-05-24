import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoutesCampus extends StatefulWidget {
  const RoutesCampus({Key? key}) : super(key: key);

  @override
  State<RoutesCampus> createState() => _RoutesCampusState();
}

class _RoutesCampusState extends State<RoutesCampus> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10,top: 10,right: 10,bottom: 10),
child: Column(
  mainAxisSize: MainAxisSize.min,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
        Text(
      "ROUTES",
      style: TextStyle(
        fontSize: 20,
        color: Colors.red,
      ),
    ),
    SizedBox(height: 10,),
    Divider(
      height: 1,
    ),
    SizedBox(height: 10,),
ListTileTheme.merge(
  dense: false,
  child: ListView.builder(
    physics:AlwaysScrollableScrollPhysics(),
  itemCount: 2,
  shrinkWrap: true,
  itemBuilder: (context,index){

  return ExpansionTile(title: Text("ROUTES 'A' : SEATING 40"),
  expandedCrossAxisAlignment: CrossAxisAlignment.start,
  children: [

    Text("CHARGES: Rs.2000 per annum"),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Driver: Shiva"),
        Container(

          child: TextButton.icon(onPressed: (){}, icon: Icon(Icons.phone), label: Text("+918867741487")),
        ),
      ],
    )
  ],

  );
}),
)
  ],
),
    );
  }
}
