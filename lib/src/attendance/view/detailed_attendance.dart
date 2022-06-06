import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pesu/utils/view/widget.dart';
class DetailedAttendance extends StatefulWidget {
  @override
  _DetailedAttendanceState createState() => _DetailedAttendanceState();
}

class _DetailedAttendanceState extends State<DetailedAttendance> {

  final List attdetails = [
    {
      "date": "30-Apr-2021",
      "time": "08:15 - 09:15",
      "status": "",
    },
    {
      "date": "5-May-2021",
      "time": "10:00 - 11:00",
      "status": "",
    },
    {
      "date": "6-May-2021",
      "time": "11:00 - 12:00",
      "status": "",
    },
    {
      "date": "7-May-2021",
      "time": "01:00 - 02:00",
      "status": "",
    },
    {
      "date": "9-May-2021",
      "time": "02:00 - 03:00",
      "status": "",
    },
    {
      "date": "10-May-2021",
      "time": "04:00 - 05:00",
      "status": "",
    },
    {
      "date": "11-May-2021",
      "time": "06:00 - 06:00",
      "status": "",
    },

  ];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: sideNavAppBar("Attendance Report"),
      body: SingleChildScrollView(
        child: Column(
          children: [

            Container(
              height: MediaQuery.of(context).size.height * 0.13,
              //  height:85,
              width: 500,
              color:Color(0xff0091CD),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:EdgeInsets.only(left: 20),
                    child: Column(
                      children: [
                        SizedBox(height: 15,),
                        Row(
                          children: [
                            Text('UF17C5253 ',style: TextStyle(fontSize: 14,color: Color.fromRGBO(255,255,255,0.6), ),),
                            Expanded(child: Text('- Microprocessors & Architecture',style: TextStyle(fontSize: 14,color: Colors.white, ),)),
                          ],
                        ),
                        Row(
                          children: [
                            Text('Last updated on : 29-Apr-2021 08:54 AM',style: TextStyle(fontSize: 14,color: Colors.white, ),),

                          ],
                        ),
                        Row(
                          children: [
                            Text('Attendance ',style: TextStyle(fontSize: 14,color: Color.fromRGBO(255,255,255,0.6), ),),
                            Text('36/40',style: TextStyle(fontSize: 14,color: Colors.white, ),),
                            SizedBox(width: 15,),
                            Text('Percentage ',style: TextStyle(fontSize: 14,color: Color.fromRGBO(255,255,255,0.6), ),),
                            Text('88.02 %',style: TextStyle(fontSize: 14,color: Colors.white, ),),
                          ],
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height:3),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ListView.builder(
                  // scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: attdetails.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Column(
                        // mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          //  CardViewContent(attdetails[index]),
                          ListTile(
                            title: Container(
                              child: Text(attdetails[index]['date'],style: TextStyle(fontSize: 16,color: Colors.black),),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          //  width: 170,
                                            child: Text(attdetails[index]['time'], style: TextStyle(fontSize: 14,color: Color(0xff9B9B9B),))),

                                        Icon(
                                          Icons.check,
                                          color: Colors.green,
                                          size: 30.0,
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 8,),
                                    Container(color: Colors.black, height: 55, width: 0.05,),

                                  ],
                                ),
                              ],
                            ),
                          ),
                          Divider(),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
