import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/view/widget.dart';

import 'dart:math' as math;

class Announcement extends StatefulWidget {
  const Announcement({Key? key}) : super(key: key);

  @override
  State<Announcement> createState() => _AnnouncementState();
}

class _AnnouncementState extends State<Announcement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: sideNavAppBar("Announcement"),
        //drawer: Container(),
        backgroundColor:        Colors.white.withOpacity(0.9),
      body: Container(
        width: double.infinity,
        color: Colors.white,
        height:MediaQuery.of(context).size.height/2 ,
        child: Padding(
          padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width/1.4,
                  child: Text("ESA backlogs Seating Allocation_30.05.2022_AS",
                  style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20,color: Color(0xff191D6E)),)),
              SizedBox(height: 15,),
              Text("30-May-2022",style: TextStyle(fontSize: 14,color: Color(0xff999999)),),
              SizedBox(height: 5,),

              Container(
                height: MediaQuery.of(context).size.height/18,
                decoration: BoxDecoration(
                  color: Color(0xffEDEDED),
                  border: Border.all(color:Color(0xff333333) ),
                ),
                child: Row(
                  children: [
                    Container(
                        margin: EdgeInsets.only(top: 10,left: 10),

                        width: MediaQuery.of(context).size.width/1.2,
                        height: MediaQuery.of(context).size.height/2,


                        child: Text("30-May-2022_AS.pdf",style: TextStyle(color: Color(0xff333333),fontSize: 16),)),
                    Spacer(),
                    Transform.rotate(
                        angle: 180 * math.pi / 140,
                    child: Icon(Icons.attach_file,color: Colors.grey,))

                  ],
                ),
              ),

        SizedBox(
          height: 20,
        ),

        Text("ESA backlogs Seating Allocation_30.05.2022_AS",style: TextStyle(color: Color(0xff333333),fontSize: 16),),
            ],
          ),
        ),
      )

    );
  }
}
