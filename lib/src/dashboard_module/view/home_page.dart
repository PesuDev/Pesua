import 'dart:typed_data';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:intl/intl.dart';
import 'package:pesu/src/announcements/model/announcement_model.dart';
import 'package:pesu/src/announcements/view_model/announcement_viewmodel.dart';
import 'package:pesu/utils/constants/color_consts.dart';
import 'package:pesu/utils/constants/shimmer_effect.dart';
import 'package:pesu/utils/constants/sp_constants.dart';
import 'package:pesu/utils/services/app_routes.dart';
import 'package:pesu/utils/view/app_drawer_screen.dart';
import 'package:pesu/utils/view/widget.dart';
import 'package:provider/provider.dart';

import '../../../utils/services/bottom_navigaton_provider.dart';
import '../../../utils/services/date_time.dart';
import '../../announcements/view/announcement_details.dart';
import '../../my_profile/profile_viewmodel/profile_viewmodel.dart';
import '../../seatinginfo/model/seating_info_model.dart';
import '../../seatinginfo/viewmodel/seating_info_viewmodel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ProfileViewmodel? profileViewmodel;
  AnnouncementViewModel? announcementViewModel;
  late SeatingInfoViewModel _viewModel;

  String currentDate = DateFormat('dd-MM-yyyy').format(DateTime.now());
  // String currentDate = DateFormat('29-MM-yyyy').format(DateTime.now());
  // String Time=("7:45 PM");

  // late String live=currentDate + " " + Time;

   int? currentIndex;
   int? currentIndexMarque;
   int? currentIndexImportant;
   int? myLength;
   int? count;
   int ?length;
   var _currentIndex;
 var  hideIconColor= Color(0xff337ab7);

  //DateFormat('dd-MM-yyyy').add_jm().format(DateTime.now());
  // DateFormat('dd-MM-yyyy HH:MM').format(DateTime.now());

  // DateFormat.yMEd().add_jms().format(DateTime.now());
  Future<void> _submittedRefreshList() async {
    profileViewmodel = Provider.of<ProfileViewmodel>(context, listen: false);
    profileViewmodel?.getProfileDetails(
        action: 4,
        mode: 7,
        randomNum: 0.824022142978994,
        callMethod: 'background',
        isProfileRequest: true);
    announcementViewModel =
        Provider.of<AnnouncementViewModel>(context, listen: false);

    announcementViewModel?.getAnnouncementListInfo();
    announcementViewModel?.getAnnouncementListInfoForMarquee();

    _viewModel = Provider.of<SeatingInfoViewModel>(context, listen: false);
    _viewModel.getSeatingInfoDetails(
        action: 13,
        mode: 3,
        randomNum: 0.6803998119716814,
        callMethod: 'background');
  }


  @override
  void initState() {
    super.initState();
    profileViewmodel = Provider.of<ProfileViewmodel>(context, listen: false);
    profileViewmodel?.getProfileDetails(
        action: 4,
        mode: 7,
        randomNum: 0.824022142978994,
        callMethod: 'background',
        isProfileRequest: true);
    announcementViewModel =
        Provider.of<AnnouncementViewModel>(context, listen: false);

    announcementViewModel?.getAnnouncementListInfo();
    announcementViewModel?.getAnnouncementListInfoForMarquee();

    _viewModel = Provider.of<SeatingInfoViewModel>(context, listen: false);
    _viewModel.getSeatingInfoDetails(
        action: 13,
        mode: 3,
        randomNum: 0.6803998119716814,
        callMethod: 'background');
  }

  var _mainHeight;
  var _mainWidth;

  @override
  Widget build(BuildContext context) {
    _mainHeight = MediaQuery.of(context).size.height;
    _mainWidth = MediaQuery.of(context).size.width;
    return Consumer2<AnnouncementViewModel, SeatingInfoViewModel>(
      builder: (context, value, data, child) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,

              title: Image.asset(
                'assets/images/logo.png',
                height: 30,
              ),
              // titleSpacing: 40,
              elevation: 0,
            ),
            // backgroundColor: Colors.grey,
            body: RefreshIndicator(
              onRefresh: _submittedRefreshList,
              child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: SingleChildScrollView(
                        physics: AlwaysScrollableScrollPhysics(),
                          child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, AppRoutes.myProfile);
                                },
                                child:
                              sp_token !=null?  getDrawerDetails(context: context):Text("")),

                                value.marqueLength!=-1? value.marqueLength>=1? Container(
                                    margin: EdgeInsets.only(top: 5),
                                    width: MediaQuery.of(context).size.width,
                                    height: 60,
                                    child:
                                 CarouselSlider.builder(
                                      options: CarouselOptions(
                                        enableInfiniteScroll: true,
                                        reverse: false,
                                        autoPlay: true,
                                        autoPlayAnimationDuration: Duration(milliseconds: 8000),
                                        autoPlayCurve: Curves.decelerate,
                                        onPageChanged: (index, reason) {
                                          setState(() {
                                            _currentIndex = index; //<-- Page index
                                          });
                                        },
                                      ),
                                      itemBuilder: (BuildContext context, int index,_){
                                        String? base64Image = (value
                                            .announcementMarque![index]
                                            .pictureIconPath);
                                        final UriData? mydata =
                                            Uri.parse(base64Image.toString())
                                                .data;

                                        Uint8List? data =
                                        mydata?.contentAsBytes();
                                     var   myImage=data;
                                       // print("printkaro${_currentIndex}");
                                        return
                                          GestureDetector(
                                            onTap: () {

                                              Navigator.of(context).push(MaterialPageRoute(
                                                  builder: (context) =>
                                                      ChangeNotifierProvider(
                                                          create: (BuildContext
                                                          context) =>
                                                              AnnouncementViewModel(),
                                                          child: Announcement(
                                                              announcementId: value
                                                                  .announcementMarque?[
                                                              index]
                                                                  .announcementId)))
                                              );
                                            },
                                            child: Container(

                                              width:MediaQuery.of(context).size.width,
                                              child: Row(
                                                children: [
                                                  myImage != null
                                                      ?
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                      left: 7,
                                                    ),
                                                    width: 50,
                                                    height: 50,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          0),

                                                    ),
                                                    child: Image.memory(
                                                     myImage,
                                                      gaplessPlayback: true,
                                                    ),
                                                  ):Text(""),
                                                  SizedBox(
                                                    width: 10,
                                                  ),

                                                  Column(
                                                    children: [
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Row(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Container(
                                                            //color: Colors.blue,
                                                            width: MediaQuery.of(context).size.width/1.7,
                                                            child:   Text(
                                                              value
                                                                  .announcementMarque?[
                                                              index]
                                                                  .announcementName ??
                                                                  'No Name',
                                                              style: TextStyle(
                                                                  color: Color(
                                                                      0xff337ab7),
                                                                  fontSize: 14,
                                                                  fontFamily:
                                                                  'Open Sans',
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .normal),
                                                              maxLines: 2,
                                                            ),

                                                          ),
                                                          SizedBox(width: 5,),

                                                          Icon(Icons.circle,
                                                              color:
                                                              hideIconColor,
                                                              size: 10),

                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Container(
                                                            // color: Colors.blue,
                                                            width: MediaQuery.of(context).size.width/1.7,
                                                            child:   Text(
                                                              "Date :${DateTimeUtil.convertDate(int.parse("${value.announcementMarque?[index].startdate}"))} ",
                                                              style: TextStyle(
                                                                  color: Color(
                                                                      0xff333333),
                                                                  fontSize: 14,
                                                                  fontFamily:
                                                                  'Open Sans',
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .normal),
                                                              maxLines: 2,
                                                            ),

                                                          ),
                                                          SizedBox(width: 5,),
                                                          Icon(Icons.arrow_forward_ios_rounded,
                                                              color:
                                                              Color(0xff337ab7),
                                                              size: 10),

                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                      }, itemCount: value.announcementMarque!.length,

                                    )
                                ): value.marqueLength ==0?Container():
                                shimmerUi():Container(),
                                SizedBox(height: 10,),

                                Container(
                              color: Colors.white,
                              padding: EdgeInsets.only(
                                  right: MediaQuery.of(context).size.width/22,

                                top: _mainHeight * 0.01),
                              height: _mainHeight * 0.1,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                     // color: Colors.amber,
                                      width: MediaQuery.of(context).size.width/30,
                                    ),
                                    getStudentLinks(
                                        icon: Icon(Icons.wysiwyg_outlined,),
                                        color: Color(0xffE3E7FD),
                                        text: 'My Courses',
                                        callback: () {
                                          final bottomProvider =
                                          Provider.of<BottomNavigationProvider>(context,
                                              listen: false);
                                          bottomProvider.selectBottomIndex(bottomIndex: 1);
                                        }),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width/17,
                                    ),
                                    getStudentLinks(
                                        icon: Icon(Icons.add_chart),
                                        color: Color(0xffFDECE3),
                                        text: 'ISA Results',
                                        callback: () {
                                          final bottomProvider =
                                          Provider.of<BottomNavigationProvider>(context,
                                              listen: false);
                                          bottomProvider.selectBottomIndex(bottomIndex: 2);
                                        }),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width/17,
                                    ),
                                    getStudentLinks(
                                        icon: Icon(Icons.access_time),
                                        color: Color(0xffE3FDE3),
                                        text: 'Attendance',
                                        callback: () {
                                          final bottomProvider =
                                          Provider.of<BottomNavigationProvider>(context,
                                              listen: false);
                                          bottomProvider.selectBottomIndex(bottomIndex: 3);
                                        }),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width/17,
                                    ),
                                    getStudentLinks(
                                        icon: Icon(Icons.view_week),
                                        color: Color(0xffE3F4FD),
                                        text: 'Seating Info',
                                        callback: () {
                                          Navigator.pushNamed(
                                              context, AppRoutes.seatingInfo);
                                        }),
                                    // SizedBox(
                                    //   width: MediaQuery.of(context).size.width/12,
                                    // ),
                                    Container(
                                      color: Colors.white,
                                      width: MediaQuery.of(context).size.width/17,
                                    ),
                                    getStudentLinks(
                                        icon: Icon(Icons.calendar_today_sharp),
                                        color: Color(0xffFDECE3),
                                        text: 'Calendar',
                                        callback: () {
                                          Navigator.pushNamed(context,
                                              AppRoutes.calendarDashboard);
                                        }),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width/17,
                                    ),
                                    getStudentLinks(
                                        icon: Icon(Icons.menu_book),
                                        color: Color(0xffF3E3FD),
                                        text: 'ESA Result',
                                        callback: () {
                                          Navigator.pushNamed(
                                              context, AppRoutes.esaresults);
                                        }),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width/17,
                                    ),
                                    getStudentLinks(
                                        icon: Icon(Icons.speaker_notes_outlined),
                                        color: Color(0xffE3F4FD),
                                        text: 'Time Table',
                                        callback: () {
                                          Navigator.pushNamed(
                                              context, AppRoutes.timeTable);
                                        }),

                                    SizedBox(
                                      width: MediaQuery.of(context).size.width/17,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            // SizedBox(
                            //   height: _mainHeight * 0.01,
                            // ),

                     value.bannerLength !=-1?   value.bannerLength>=1?    Container(
                              height: _mainHeight * 0.27,

                              child: Swiper(

                                itemBuilder: (BuildContext context, int index) {
                                  // List<AnnouncementModel> name=((value.announcementModel?[index].announcementType==2)?value.announcementModel![index].batchClassId:"hh");
                                  // print("bababa$name");
                                  String? base64Image =
                                  (value.announcementBannerDashModel?[index].iconPath);
                                  final UriData? mydata =
                                      Uri.parse(base64Image.toString()).data;
                                  Uint8List? myImage = mydata?.contentAsBytes();
                                  return Container(
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ChangeNotifierProvider(
                                                        create: (BuildContext
                                                        context) =>
                                                            AnnouncementViewModel(),
                                                        child: Announcement(
                                                            announcementId: value
                                                                .announcementBannerDashModel?[
                                                            index]
                                                                .announcementId))));
                                      },
                                      child: Stack(
                                        children: [
                                          myImage != null && value.announcementBannerDashModel?[index].announcementType==2
                                              ?
                                          Container(
                                            height: _mainHeight * 0.27,

                                            // decoration: BoxDecoration(
                                            //     borderRadius:
                                            //     BorderRadius.circular(5),
                                            // ),
                                            child:    Image.memory(
                                        myImage,
                                        gaplessPlayback: true,
                                      ),
                                                )
                                              : Container(
                                          ),
                                          Positioned(
                                            bottom: 0,
                                            child: Container(
                                                padding: EdgeInsets.only(top: 5,left: 10),
                                                width: _mainWidth,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  color: Colors.black54,
                                                  // borderRadius: BorderRadius.only(
                                                  //     bottomLeft:
                                                  //     Radius.circular(5),
                                                  //     bottomRight:
                                                  //     Radius.circular(5)),
                                                ),
                                                // height: 45,
                                                child: Align(
                                                  alignment: Alignment.topCenter,
                                                  child: Text(
                                                    value
                                                        .announcementBannerDashModel?[
                                                    index]
                                                        .announcementName ??
                                                        "",
                                                    maxLines: 2,
                                                    // "Invitation to Participate from dated - 07 June 2022",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.white),
                                                  ),
                                                )),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                    autoplay: value.announcementBannerDashModel!.length>1? true:false,
                             loop: value.announcementBannerDashModel!.length>1? true:false,
                                itemCount: value.announcementBannerDashModel!.length,

                                //  itemCount: imageList.length,
                              ),
                            ): value.bannerLength ==0?Container():
                     shimmerUi():Container(),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                            //  color: Color(0xffFFFFFF),
                              padding: EdgeInsets.only(
                                  right: 15, top: 5, bottom: 0, left: 15),
                              child: data.seatingInfoModel != null
                                  ? seatingInfo(
                                      seatingInfoModel: data.seatingInfoModel)
                                  : Container(),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                     value.importantAnnouncementLength !=-1?value.importantAnnouncementLength>=1?
                     Container(
                              height: MediaQuery.of(context).size.height / 10,
                              color: Colors.white,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 7,top: 4),
                                    child: Text(
                                      "${"Important Announcement"}  (${currentIndexImportant ??""}/${value.announcementImportant?.length ?? ""})",
                                      style: TextStyle(
                                          color: Color(0xfffd981b),
                                          fontSize: 14,
                                          fontFamily: 'Open Sans',
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 5),
                                    //color: Colors.blue,
                                    height: 46,
                                    child:
                                    Swiper(
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        String? base64Image = (value
                                            .announcementImportant![index]
                                            .pictureIconPath);
                                        final UriData? mydata =
                                            Uri.parse(base64Image.toString())
                                                .data;
                                        Uint8List? myImage =
                                            mydata?.contentAsBytes();
                                        return 
                                          GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).push(MaterialPageRoute(
                                                builder: (context) =>
                                                    ChangeNotifierProvider(
                                                        create: (BuildContext
                                                                context) =>
                                                            AnnouncementViewModel(),
                                                        child: Announcement(
                                                            announcementId: value
                                                                .announcementImportant?[
                                                                    index]
                                                                .announcementId))));
                                          },
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              myImage != null
                                                  ? Container(
                                                      margin: EdgeInsets.only(
                                                        left: 7,
                                                      ),
                                                      width: 50,
                                                      height: 50,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                0),


                                                    ),
                                                child: Image.memory(
                                                  myImage,
                                                  gaplessPlayback: true,
                                                ),
                                              )
                                                  : Padding(
                                                    padding: const EdgeInsets.only(left:5.0),
                                                    child: Container(
                                                      width: 50,
                                                      height: 50,
                                               ),
                                                  ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width /
                                                              1.3,
                                                          // height:MediaQuery.of(context).size.height/40,
                                                          child:
                                                          Text(
                                                            value
                                                                    .announcementImportant?[
                                                                        index]
                                                                    .announcementName ??
                                                                'No Name',
                                                            style: TextStyle(
                                                                color: Color(
                                                                    0xff333333),
                                                                fontSize: 14,
                                                                fontFamily:
                                                                    'Open Sans',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal),
                                                          ),
                                                        ),
                                                        Icon(Icons.circle,
                                                            color:
                                                                Color(0xff337ab7),
                                                            size: 10),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width /
                                                              1.3,
                                                          // height:MediaQuery.of(context).size.height/40,
                                                          child: Text(
                                                            "Date :${DateTimeUtil.convertDate(int.parse("${value.announcementImportant?[index].startdate}"))} ",
                                                            style: TextStyle(
                                                                color: Color(
                                                                    0xff333333),
                                                                fontSize: 14,
                                                                fontFamily:
                                                                    'Open Sans',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal),
                                                          ),
                                                        ),
                                                        Icon(
                                                            Icons
                                                                .arrow_forward_ios_rounded,
                                                            color:
                                                                Color(0xff337ab7),
                                                            size: 14),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                      autoplay: true,
                                      itemCount: value.announcementImportant!.length,
                                        onIndexChanged: (int index) {
                                          setState(() {
                                              currentIndexImportant = index+1;

                                          });
                                        }
                                    ),
                                  ),
                                ],
                              ),
                            ): value.importantAnnouncementLength ==0?Container():
                shimmerUiForAnnouncement():Container(),
                            SizedBox(
                              height: 10,
                            ),
                                value.announcementLength !=-1?value.announcementLength>=1?    Container(
                              height: MediaQuery.of(context).size.height / 10,
                              color: Colors.white,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 7,top: 4),
                                    child: Text(
                                      "${"Announcement"}  (${value.announcementModel?.length})",
                                      style: TextStyle(
                                          color: Color(0xfffd981b),
                                          fontSize: 14,
                                          fontFamily: 'Open Sans',
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 5),
                                    height: 46,
                                    child: Swiper(

                                      itemBuilder:
                                          (BuildContext context, int index) {

                                        String? base64Image = (value
                                            .announcementModel![index]
                                            .pictureIconPath);
                                        final UriData? mydata =
                                            Uri.parse(base64Image.toString())
                                                .data;
                                        Uint8List? myImage =
                                            mydata?.contentAsBytes();
                                        return GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).push(MaterialPageRoute(
                                                builder: (context) =>
                                                    ChangeNotifierProvider(
                                                        create: (BuildContext
                                                                context) =>
                                                            AnnouncementViewModel(),
                                                        child: Announcement(
                                                            announcementId: value
                                                                .announcementModel?[
                                                                    index]
                                                                .announcementId))));
                                          },
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              myImage != null
                                                  ? Container(
                                                      margin: EdgeInsets.only(
                                                        left: 5,
                                                      ),
                                                      width: 50,
                                                      height: 50,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                0),

                                                      ),
                                                child: Image.memory(
                                                  myImage,
                                                  gaplessPlayback: true,
                                                ),
                                                    )
                                                  : Padding(
                                                padding: const EdgeInsets.only(left:7.0),
                                                child: Container(

                                                  height: 40,
                                                  width: 50,),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width /
                                                              1.3,
                                                          // height:MediaQuery.of(context).size.height/40,
                                                          child: Text(
                                                            value
                                                                    .announcementModel?[
                                                                        index]
                                                                    .announcementName ??
                                                                'fvhggzdfzfzjfkjzkjzkjkjkj 5tftdrkeskkwerktgy6t5fdreswrfgfrdes',
                                                            style: TextStyle(
                                                                color: Color(
                                                                    0xff333333),
                                                                fontSize: 14,
                                                                fontFamily:
                                                                    'Open Sans',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal),
                                                          ),
                                                        ),
                                                        Icon(Icons.circle,
                                                            color:
                                                                Color(0xff337ab7),
                                                            size: 10),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width /
                                                              1.3,
                                                          // height:MediaQuery.of(context).size.height/40,
                                                          child: Text(
                                                            "Date :${DateTimeUtil.convertDate(int.parse("${value.announcementModel?[index].startdate}"))} ",
                                                            style: TextStyle(
                                                                color: Color(
                                                                    0xff333333),
                                                                fontSize: 14,
                                                                fontFamily:
                                                                    'Open Sans',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal),
                                                          ),
                                                        ),
                                                        Icon(
                                                            Icons
                                                                .arrow_forward_ios_rounded,
                                                            color:
                                                                Color(0xff337ab7),
                                                            size: 14),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        );


                                      },

                                      autoplay: true,
                                      itemCount: value.announcementModel!.length,
                                        // onTap: (int){
                                        // setState(() {
                                        //   myLength=value.announcementModel?.length;
                                        //   count=(myLength! - currentIndex!);
                                        // });
                                        // },
        onIndexChanged: (int index) {
          setState(() {
              currentIndex = index+1;

          });
        }

        ),
                                  ),
                                ],
                              ),
                            ): value.announcementLength ==0?Container():
                                shimmerUiForAnnouncement():Container(),
                          ]))),
            )

            //drawer: AppDrawerScreen(),
          ),
        );
      },
    );
  }


  Widget swiper(){
    return Consumer<AnnouncementViewModel>(
      builder: (context, data, child) {
        return data.announcementModel != null &&
            data.announcementModel!.isNotEmpty
            ?
        ListView.builder(
            itemCount: data.announcementModel?.length ?? 0,
            itemBuilder: (context, index) {
              AnnouncementModel model = data.announcementModel![index];

              return data.announcementModel?[index].announcementType == 2
                  ?
              Swiper(
                itemBuilder: (BuildContext context, int index) {
                  String? base64Image =
                  (data.announcementModel?[index].iconPath);
                  final UriData? mydata =
                      Uri.parse(base64Image.toString()).data;
                  Uint8List? myImage = mydata?.contentAsBytes();
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) =>
                                  ChangeNotifierProvider(
                                      create: (BuildContext
                                      context) =>
                                          AnnouncementViewModel(),
                                      child: Announcement(
                                          announcementId: data
                                              .announcementModel?[
                                          index]
                                              .announcementId))));
                    },
                    child:
                    Stack(
                      children: [
                        myImage != null
                            ? Container(
                          decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.circular(5),
                         ),
                          child: Image.memory(
                            myImage,
                            gaplessPlayback: true,
                          ),
                        )
                            : Container(),
                        Positioned(
                          bottom: 0,
                          child: Container(
                              padding: EdgeInsets.only(top: 5),
                              width: _mainWidth,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.black54,
                                borderRadius: BorderRadius.only(
                                    bottomLeft:
                                    Radius.circular(5),
                                    bottomRight:
                                    Radius.circular(5)),
                              ),
                              height: 25,
                              child: Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 5),
                                  child: Text(
                                    data
                                        .announcementModel?[
                                    index]
                                        .announcementName ??
                                        "",
                                    // "Invitation to Participate from dated - 07 June 2022",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white),
                                  ),
                                ),
                              )),
                        )
                      ],
                    ),
                  );
                },
                autoplay: true,
                itemCount: data.announcementModel!.length,
                //  itemCount: imageList.length,
              ):

               Container();
            })
            : Center(child: shimmerUiForAnnouncement());
      },
    );
  }

  AppBar getAppBar({required BuildContext context}) {
    return AppBar(
      titleSpacing: 0,
      backgroundColor: appThemeColor,
      title: Text(
        'PES University',
      ),
    );
  }

  Widget getStudentLinks(
      {required Icon icon,
      required Color color,
      required String text,
      required Function callback}) {
    return GestureDetector(
      onTap: () => callback(),
      child: Column(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: color,
            child: icon,
          ),
          SizedBox(
            height: 5,
          ),
          Text(text)
        ],
      ),
    );
  }

  Widget getDrawerDetails({required BuildContext context}) {
    String? base64Image = profileViewmodel?.profileModel?.photo;
    final UriData? mydata = Uri.parse(base64Image.toString()).data;
    Uint8List? myImage = mydata?.contentAsBytes();
    return RefreshIndicator(
      onRefresh: _submittedRefreshList,
      child:
      Consumer<ProfileViewmodel>(builder: (context, data, child) {
        String? base64Image = (data.profileModel?.photo);
        final UriData? mydata = Uri.parse(base64Image.toString()).data;
        Uint8List? myImage = mydata?.contentAsBytes();
        return data.profileModel != null
            ? Container(
                height: _mainHeight * 0.060,
                color: Colors.white,
                margin: EdgeInsets.only(
                    // left: _mainWidth * 0.03,
                    // right: _mainWidth * 0.03,
                    top: _mainHeight * 0.01),
                child: Row(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    myImage != null
                        ? Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: ClipOval(
                            child: Image.memory(
                              myImage,
                              gaplessPlayback: true,
                              height: 50,
                              width: 50,
                              fit: BoxFit.fill,

                            ),
                          ),
                        )
                        :
                         Icon(Icons.account_circle_outlined,size: 50,),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                    Container(
                      width: _mainWidth * 0.75,
                      child: Column(
                        //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.profileModel?.name ?? "",
                            // 'Student Name',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                fontFamily: 'Open Sans',
                                color: Color(0xff333333)),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text("SRN :${data.profileModel?.departmentId ?? ""}",
                              style: getTextStyle),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            : shimmerUiForProfile();
      }),
    );
  }

  Widget seatingInfo({List<SeatingInfoModel>? seatingInfoModel}) {
    return seatingInfoModel != null
        ? ListTileTheme.merge(
            dense: true,
            child: Container(
              color: Colors.white,
              child: ListView.builder(
                itemCount: seatingInfoModel.length ?? 0,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  SeatingInfoModel model = seatingInfoModel[index];
                  var mydate=DateTimeUtil.convertDate(model.testStartTime!.toInt());
                  return mydate ==
                          currentDate
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,

                          children: [
                            Text(
                              'Seating Info',
                              style: TextStyle(
                                  // backgroundColor: Color(0xffFFFFFF),
                                  color: Color(0xfffd981b),
                                  fontSize: 16,
                                  fontFamily: 'Open Sans',
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              model.subjectCode ?? 'UEMEIDH',
                              style: TextStyle(
                                  // backgroundColor: Color(0xffFFFFFF),
                                  color: Color(0xfff9B9B9B),
                                  fontSize: 14,
                                  fontFamily: 'Open Sans',
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              model.subjectName ?? 'Computer Network Security',
                              style: TextStyle(
                                  //    backgroundColor: Color(0xffFFFFFF),
                                  color: Color(0xfff333333),
                                  fontSize: 16,
                                  fontFamily: 'Open Sans',
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Date & Time",       style: TextStyle(
                               backgroundColor: Color(0xffFFFFFF),
                            color: Color(0xfff9B9B9B),
                            fontSize: 14,
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w500),),
                                    Row(
                                      children: [
                                        Text( ("${DateTimeUtil.convertDate(model.testStartTime!.toInt())}"","), style: TextStyle(
                                            backgroundColor: Color(0xffFFFFFF),
                                            color: Color(0xfff333333),
                                            fontSize: 16,
                                            fontFamily: 'Open Sans',
                                            fontWeight: FontWeight.w400),),
                  Text(
                        ("${DateTimeUtil.converDateIntoTime(model.testStartTime!.toInt())}-${DateTimeUtil.converDateIntoTime(model.testEndTime!.toInt())}") ?? "",

                        style: TextStyle(
                                backgroundColor: Color(0xffFFFFFF),
                                color: Color(0xfff333333),
                                fontSize: 16,
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.w400),
                      ),
                                      ],
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text("Terminal", style: TextStyle(
                               backgroundColor: Color(0xffFFFFFF),
                            color: Color(0xfff9B9B9B),
                            fontSize: 14,
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w400),),
                                    Text( model.terminalName ?? 'S401',  style: TextStyle(
                                        backgroundColor: Color(0xffFFFFFF),
                                        color: Color(0xfff333333),
                                        fontSize: 16,
                                        fontFamily: 'Open Sans',
                                        fontWeight: FontWeight.w400),),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              'Location',
                              style: TextStyle(
                                  //   backgroundColor: Color(0xffFFFFFF),
                                  color: Color(0xfff9B9B9B),
                                  fontSize: 14,
                                  fontFamily: 'Open Sans',
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              model.roomName ?? 'S401',
                              style: TextStyle(
                                  //   backgroundColor: Color(0xffFFFFFF),
                                  color: Color(0xfff333333),
                                  fontSize: 14,
                                  fontFamily: 'Open Sans',
                                  fontWeight: FontWeight.w400),
                            ),
                            Divider(
                              thickness: 3,
                            ),
                          ],
                        )
                      : Container();
                },
              ),
            ),
          )
        : Center(child: CircularProgressIndicator());
  }

  TextStyle get getTextStyle => TextStyle(
      fontSize: 16,
      color: Color(0xff9B9B9B),
      fontFamily: 'Open Sans',
      fontWeight: FontWeight.w500);
}
