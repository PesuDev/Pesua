import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/view/widget.dart';

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
        drawer: Container(),
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
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.blue),)),
              SizedBox(height: 15,),
              Text("30-May-2022"),
              SizedBox(height: 5,),
              Divider(
                color: Colors.grey,
              ),
              Row(
                children: [
                  Text("30-May-2022_AS.pdf"),
                  Spacer(),
                  Icon(Icons.picture_as_pdf,color: Colors.grey,)

                ],
              ),
              Divider(
                color: Colors.grey,
              ),
        Text("ESA backlogs Seating Allocation_30.05.2022_AS"),
            ],
          ),
        ),
      )

    );
  }
}
