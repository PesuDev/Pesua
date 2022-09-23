import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:provider/provider.dart';

import '../../../utils/view/widget.dart';

import 'dart:math' as math;

import '../view_model/announcement_viewmodel.dart';

class Announcement extends StatefulWidget {
  const Announcement({Key? key}) : super(key: key);

  @override
  State<Announcement> createState() => _AnnouncementState();
}



class _AnnouncementState extends State<Announcement> {
  late AnnouncementViewModel _announcementViewModel;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _announcementViewModel =
        Provider.of<AnnouncementViewModel>(context, listen: false);
    _announcementViewModel.getAnnouncementBannerInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: sideNavAppBar("Announcement"),
        backgroundColor: Colors.white.withOpacity(0.9),
        body: Consumer<AnnouncementViewModel>(builder: (context, value, child) {
          String? htmlCode;

          return value.announcementBannerModel != null &&
              value.announcementBannerModel?.length != 0
              ?
          Container(
              width: double.infinity,
              color: Colors.grey[20],
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
              child: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: ListView.builder(
                      itemCount: value.announcementBannerModel?.length,
                      itemBuilder: (BuildContext context, int index) {
                        String? base64Image = (value.announcementBannerModel?[index].pictureIconPath);
                        final UriData? mydata = Uri.parse(base64Image.toString()).data;
                        Uint8List? myImage = mydata?.contentAsBytes();

                        String? uriString =
                            value.announcementBannerModel?[index].description;
                        String uriDecode = Uri.decodeFull(uriString!);
                        htmlCode = uriDecode;
                        return
                          Container(
                          color: Colors.white,
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5,top: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  value.announcementBannerModel?[index].announcementName??""
                                  ,
                                  style: TextStyle(fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Color(0xff191D6E)),
                                ),

                                myImage !=null && value.announcementBannerModel?[index].isBannerImage==1?
                                Container(
                                  margin: EdgeInsets.only(right: 5,top: 10),
                                  height: 200,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      image: DecorationImage(
                                        image: MemoryImage(
                                            myImage
                                        ),
                                        fit: BoxFit.fill,
                                      )),
                                ):Container(),
                                SizedBox(height: 10,),

                                Text(
                                  value.announcementBannerModel?[index].createdDateFrSorting??''
                                  ,
                                  style: TextStyle(fontWeight: FontWeight.normal,
                                      fontSize: 20,
                                      color: Color(0xff191D6E)),
                                ),
                                Divider(
                                  color: Colors.black,
                                ),

                                        Row(
                                        children: [
                                          Container(
                                              //margin: EdgeInsets.only(top: 10,left: 10),
                                              child: Text("ST_Labs_Swayam_May_2022_converted.pdf",style: TextStyle(color: Color(0xff333333),fontSize: 16),)),
                                          Spacer(),
                                          Transform.rotate(
                                              angle: 180 * math.pi / 140,
                                          child: Icon(Icons.attach_file,color: Colors.grey,))

                                        ],
                                      ),

                                Divider(
                                  color: Colors.black,
                                ),

                                HtmlWidget(htmlCode!)

                              ],
                            ),
                          ),

                        );
                      })
              )

          )
              : Center(child: CircularProgressIndicator());
        }));


    //       Container(
    //         width: MediaQuery.of(context).size.width/1.4,
    //           child: Text("ESA backlogs Seating Allocation_30.05.2022_AS",
    //           style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20,color: Color(0xff191D6E)),)),
    //       SizedBox(height: 15,),
    //        RichText(text: TextSpan(
    //          children:
    //            [
    //              TextSpan(
    //                text: "Date",
    //                style: TextStyle(fontSize: 14,color: Color(0xff999999)),
    //              ),
    //              TextSpan(
    //                text: "25-05-2022",
    //                style: TextStyle(fontSize: 14,color: Color(0xff999999)),
    //              ),
    //
    //            ]
    //        ),
    //
    //        ),
    //        // Text("30-May-2022",style: TextStyle(fontSize: 14,color: Color(0xff999999)),),
    //       SizedBox(height: 5,),
    //
    //       Container(
    //         height: MediaQuery.of(context).size.height/16,
    //         decoration: BoxDecoration(
    //           color: Color(0xffFCFCFC),
    //           border: Border.all(color:Color(0xffEDEDED) ),
    //         ),
    //         child:
    //         Row(
    //           children: [
    //             Container(
    //                 margin: EdgeInsets.only(top: 10,left: 10),
    //
    //                 width: MediaQuery.of(context).size.width/1.2,
    //                 height: MediaQuery.of(context).size.height/2,
    //
    //
    //                 child:
    //                 Text("Time_table_Backlog_ST_Labs_Swayam_May_2022_converted.pdf",style: TextStyle(color: Color(0xff333333),fontSize: 16),)),
    //             Spacer(),
    //             Transform.rotate(
    //                 angle: 180 * math.pi / 140,
    //             child: Icon(Icons.attach_file,color: Colors.grey,))
    //
    //           ],
    //         ),
    //       ),
    //       SizedBox(height: 5,),
    //       Container(
    //         height: MediaQuery.of(context).size.height/16,
    //         decoration: BoxDecoration(
    //           color: Color(0xffFCFCFC),
    //           border: Border.all(color:Color(0xffEDEDED) ),
    //         ),
    //         child:
    //         Row(
    //           children: [
    //             Container(
    //                 margin: EdgeInsets.only(top: 10,left: 10),
    //
    //                 width: MediaQuery.of(context).size.width/1.2,
    //                 height: MediaQuery.of(context).size.height/2,
    //
    //
    //                 child: Text("ST_Labs_Swayam_May_2022_converted.pdf",style: TextStyle(color: Color(0xff333333),fontSize: 16),)),
    //             Spacer(),
    //             Transform.rotate(
    //                 angle: 180 * math.pi / 140,
    //             child: Icon(Icons.attach_file,color: Colors.grey,))
    //
    //           ],
    //         ),
    //       ),
    //
    // SizedBox(
    //   height: 20,
    // ),
    //
    // Text("ESA backlogs Seating Allocation_30.05.2022_AS",style: TextStyle(color: Color(0xff333333),fontSize: 16),),
    //         ],
    //       ),
    //     ),
    //   )
    //
    // );
  }
}
