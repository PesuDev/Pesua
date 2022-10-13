import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pesu/src/announcements/view_model/announcement_viewmodel.dart';
import 'package:pesu/utils/services/date_time.dart';
import 'package:provider/provider.dart';

import '../../../utils/view/widget.dart';
import 'announcement.dart';

class Announcements extends StatefulWidget {
  var announcementId;
  Announcements({this.announcementId});
 // const Announcements({Key? key}) : super(key: key);

  @override
  State<Announcements> createState() => _AnnouncementsState();
}

class _AnnouncementsState extends State<Announcements> {
  late AnnouncementViewModel _announcementViewModel;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _announcementViewModel =
        Provider.of<AnnouncementViewModel>(context, listen: false);
    _announcementViewModel.getAnnouncementListInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

          appBar: sideNavAppBar("Announcements"),


        body:
        Consumer<AnnouncementViewModel>(builder: (context, value, child) {
          return value.announcementModel != null &&
                  value.announcementModel?.length != 0
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                       "${"IMPORTANT ANNOUNCEMENT"}  ${value.announcementModel?.length ?? ""}",

                        //"IMPORTANT ANNOUNCEMENT ",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.white,
                        // height: MediaQuery.of(context).size.height,
                        child:
                        ListView.builder(
                            itemCount: value.announcementModel?.length,
                            itemBuilder: (BuildContext context, int index) {
                              String? base64Image = (value.announcementModel?[index].iconPath);
                              final UriData? mydata = Uri.parse(base64Image.toString()).data;
                              Uint8List? myImage = mydata?.contentAsBytes();
                              return Padding(
                                padding: const EdgeInsets.only(right: 20,left: 10),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context) =>
                                            ChangeNotifierProvider(create: (BuildContext context) =>AnnouncementViewModel(),
                                                child: Announcement(announcementId:value.announcementModel?[index].announcementId ))
                                    ));

                                  },
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          // Icon(
                                          //   Icons.ac_unit,
                                          //   size: 50,
                                          // ),
                                          myImage != null
                                              ? Container(
                                            width: 50,
                                            height: 50,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5),
                                              image: new DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: MemoryImage(myImage)),
                                            ),
                                          )
                                              : Container(
                                           // color: Colors.amber,
                                            decoration: BoxDecoration(
                                              border: Border.all(color: Colors.black)
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 5),
                                              child: Center(
                                                child: Text("   No Image"),

                                              ),
                                            ),
                                            height: 50,
                                            width: 50,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(top: 10),
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2,
                                                child: Text(value
                                                        .announcementModel?[index]
                                                        .announcementName ??
                                                    "Seatinginformation_24.05.2022",style: TextStyle(fontSize: 14),),
                                              ),
                                              Text(value.announcementModel?[index]
                                                      .instituteName ??
                                                  "_AS_RRCampus",style: TextStyle(fontSize: 14),),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "${DateTimeUtil.convertDate(int.parse("${value.announcementModel?[index].startdate}"))} ",
                                                    style: TextStyle(
                                                        color: Colors.grey,fontSize: 14),
                                                  ),
                                                  Text(
                                                    "to ${DateTimeUtil.convertDate(int.parse("${value.announcementModel?[index].endDate}"))}",
                                                    style: TextStyle(
                                                        color: Colors.grey,fontSize: 14),
                                                  ),
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
                                              Icon(
                                                Icons.circle,
                                                color: Colors.blueAccent,
                                                size: 10,
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Icon(
                                                Icons.chevron_right,
                                                size: 14,
                                              ),

                                            ],
                                          ),
                                        ],
                                      ),
                                      Divider(
                                       // thickness: 2,
                                        color: Colors.black,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                    ),


                  ],
                )
              : Center(child: CircularProgressIndicator());
        })
    );
  }
}
