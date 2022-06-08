import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'announcement.dart';

class Announcements extends StatefulWidget {
  const Announcements({Key? key}) : super(key: key);

  @override
  State<Announcements> createState() => _AnnouncementsState();
}

class _AnnouncementsState extends State<Announcements> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,

        title: Text("Announcements"),
      ),
      body: 
      Column(
        crossAxisAlignment:CrossAxisAlignment.start,

        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("IMPORTANT ANNOUNCEMENT (16)",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              // height: MediaQuery.of(context).size.height,
              child:
              GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Announcement()));
                },
                child: ListView.builder(
                    itemCount: 15,
                    itemBuilder: (BuildContext context,int index){
                     return
                       Padding(
                         padding: const EdgeInsets.only(right: 20),
                         child: Row(
                         mainAxisAlignment: MainAxisAlignment.start,

                         children: [
                           Icon(Icons.ac_unit,size: 50,),
                           SizedBox(width: 10,),
                           Column(
                             mainAxisAlignment: MainAxisAlignment.start,
                             crossAxisAlignment: CrossAxisAlignment.start,

                             children: [
                               Container(
                                 margin:EdgeInsets.only(top: 10),
                                 width: MediaQuery.of(context).size.width/2,

                                 child:Text("Seatinginformation_24.05.2022"),
                               ),
                               Text("_AS_RRCampus"),
                               SizedBox(
                                 height: 5,
                               ),
                               Row(
                                 children: [
                                   Text("Date",style: TextStyle(
                                     color: Colors.grey
                                   ),),
                                   Text("24-MAy-2022",style: TextStyle(
                                     color: Colors.grey
                                   ),),
                                 ],
                               ),
                               Divider(
                                 height: 2,
                                 color: Colors.black,
                                 thickness: 2,

                               ),
                             ],
                           ),
                           Spacer(),
                           Column(
                             children: [
                               Icon(Icons.circle,color: Colors.blueAccent,size: 10,),
                               SizedBox(
                                 height: 5,
                               ),
                               Icon(Icons.chevron_right,size: 20,),


                             ],
                           ),

                         ],
                     ),
                       );
                    }
                ),
              ),

            ),
          ),


        ],
      ),
    );
  }
}
