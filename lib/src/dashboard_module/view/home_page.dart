import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:intl/intl.dart';
import 'package:pesu/src/announcements/view_model/announcement_viewmodel.dart';
import 'package:pesu/utils/constants/color_consts.dart';
import 'package:pesu/utils/services/app_routes.dart';
import 'package:pesu/utils/view/app_drawer_screen.dart';
import 'package:pesu/utils/view/widget.dart';
import 'package:provider/provider.dart';

import '../../../utils/services/date_time.dart';
import '../../announcements/view/announcement.dart';
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

  String currentDate = DateFormat('dd-MM-yyyy').add_jm().format(DateTime.now());

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
    return RefreshIndicator(
      onRefresh: _submittedRefreshList,
      child: Consumer2<AnnouncementViewModel, SeatingInfoViewModel>(
        builder: (context, value, data, child) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: Colors.grey,
              body: (value.announcementModel != null &&
                      value.announcementModel?.length != 0)
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: SingleChildScrollView(
                          child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, AppRoutes.myProfile);
                                },
                                child: getDrawerDetails(context: context)),
                            SizedBox(
                              height: _mainHeight * 0.01,
                            ),
                            Container(
                              color: Color(0xffFAFAFA),
                              padding: EdgeInsets.only(
                                  left: _mainWidth * 0.05,
                                  right: _mainWidth * 0.05,
                                  top: _mainHeight * 0.01),
                              //  margin: EdgeInsets.only(left: _mainWidth*0.03,right: _mainWidth*0.03),
                              height: _mainHeight * 0.1,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    getStudentLinks(
                                        icon: Icon(Icons.wysiwyg),
                                        color: Color(0xffE3E7FD),
                                        text: 'My Courses',
                                        callback: () {
                                          Navigator.pushNamed(
                                              context, AppRoutes.courseDashboard);
                                        }),
                                    SizedBox(
                                      width: 26,
                                    ),
                                    getStudentLinks(
                                        icon: Icon(Icons.archive),
                                        color: Color(0xffFDECE3),
                                        text: 'ISA Results',
                                        callback: () {
                                          Navigator.pushNamed(
                                              context, AppRoutes.isaResults);
                                        }),
                                    SizedBox(
                                      width: 26,
                                    ),
                                    getStudentLinks(
                                        icon: Icon(Icons.date_range),
                                        color: Color(0xffE3FDE3),
                                        text: 'Attendance',
                                        callback: () {
                                          Navigator.pushNamed(
                                              context, AppRoutes.attendance);
                                        }),
                                    SizedBox(
                                      width: 26,
                                    ),
                                    getStudentLinks(
                                        icon: Icon(Icons.view_week),
                                        color: Color(0xffE3F4FD),
                                        text: 'Seating Info',
                                        callback: () {
                                          Navigator.pushNamed(
                                              context, AppRoutes.seatingInfo);
                                        }),
                                    SizedBox(
                                      width: 26,
                                    ),
                                    getStudentLinks(
                                        icon: Icon(Icons.calendar_today_sharp),
                                        color: Color(0xffFDECE3),
                                        text: 'Calender',
                                        callback: () {
                                          Navigator.pushNamed(context,
                                              AppRoutes.calendarDashboard);
                                        }),
                                    SizedBox(
                                      width: 26,
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
                                      width: 26,
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
                                      width: 26,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: _mainHeight * 0.01,
                            ),
                            Container(
                              height: _mainHeight * 0.27,
                              // padding: EdgeInsets.symmetric(
                              //     horizontal: _mainWidth * 0.03),
                              child: Swiper(
                                itemBuilder: (BuildContext context, int index) {
                                  String? base64Image =
                                      (value.announcementModel?[index].iconPath);
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
                                                          announcementId: value
                                                              .announcementModel?[
                                                                  index]
                                                              .announcementId))));
                                    },
                                    child: Stack(
                                      children: [
                                        myImage != null
                                            ? Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(5),
                                                    image: DecorationImage(
                                                      image: MemoryImage(myImage),
                                                      fit: BoxFit.fill,
                                                    )),
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
                                              height: 30,
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Padding(
                                                  padding: const EdgeInsets.only(
                                                      bottom: 5),
                                                  child: Text(
                                                    value
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
                                itemCount: value.announcementModel!.length,
                                //  itemCount: imageList.length,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              color: Color(0xffFFFFFF),
                              padding: EdgeInsets.only(
                                  right: 15, top: 5, bottom: 0, left: 15),
                              child: data.seatingInfoModel != null
                                  ? seatingInfo(
                                      seatingInfoModel: data.seatingInfoModel)
                                  : Text("data"),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height / 10,
                              color: Colors.white,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 7,top: 4),
                                    child: Text(
                                      "${"Important Announcement"}  (${value.announcementModel?.length ?? ""})",
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
                                                        left: 7,
                                                      ),
                                                      width: 50,
                                                      height: 50,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                0),
                                                        image:
                                                            new DecorationImage(
                                                                fit: BoxFit.fill,
                                                                image:
                                                                    MemoryImage(
                                                                        myImage,
                                                                        scale:
                                                                            0.5)),
                                                      ),
                                                    )
                                                  : Padding(
                                                    padding: const EdgeInsets.only(left:5.0),
                                                    child: Container(
                                                decoration: BoxDecoration(
                                                      border: Border.all(color: Colors.black)
                                                ),
                                                child: Padding(
                                                    padding: const EdgeInsets.only(left: 5),
                                                    child: Center(
                                                      child: Text("   No Image"),

                                                    ),
                                                ),
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
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height / 10,
                              color: Colors.white,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 7,top: 4),
                                    child: Text(
                                      "${"Announcement"}  (${value.announcementModel?.length ?? ""})",
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
                                                        image:
                                                            new DecorationImage(
                                                                fit: BoxFit.fill,
                                                                image:
                                                                    MemoryImage(
                                                                        myImage,
                                                                        scale:
                                                                            0.5)),
                                                      ),
                                                    )
                                                  : Padding(
                                                padding: const EdgeInsets.only(left:7.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(color: Colors.black)
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(left: 5),
                                                    child: Center(
                                                      child: Text("   No Image"),

                                                    ),
                                                  ),
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
                                                            size: 14),
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
                                                            size: 10),
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
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ])))
                  : Center(
                      child: CircularProgressIndicator(),
                    ),
              //drawer: AppDrawerScreen(),
            ),
          );
        },
      ),
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
      child: Consumer<ProfileViewmodel>(builder: (context, data, child) {
        String? base64Image = (data.profileModel?.photo);
        final UriData? mydata = Uri.parse(base64Image.toString()).data;
        Uint8List? myImage = mydata?.contentAsBytes();
        return data.profileModel != null
            ? Container(
                height: _mainHeight * 0.060,
                color: Colors.white,
                margin: EdgeInsets.only(
                    left: _mainWidth * 0.03,
                    right: _mainWidth * 0.03,
                    top: _mainHeight * 0.01),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    myImage != null
                        ? Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              image: new DecorationImage(
                                  fit: BoxFit.fill,
                                  image: MemoryImage(myImage, scale: 0.5)),
                            ),
                          )
                        : CircleAvatar(
                            radius: MediaQuery.of(context).size.height * 0.025,
                            backgroundImage: NetworkImage(
                                'https://tnschools.gov.in/wp-content/themes/TNDS/assets/coloured_icons/2.png'),
                          ),
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
            : Center(child: CircularProgressIndicator());
      }),
    );
  }

  Widget seatingInfo({List<SeatingInfoModel>? seatingInfoModel}) {
    return seatingInfoModel != null
        ? ListTileTheme.merge(
            dense: true,
            child: ListView.builder(
              itemCount: seatingInfoModel.length ?? 0,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                SeatingInfoModel model = seatingInfoModel[index];
                print(
                    "DATeJNS${DateTimeUtil.convertTimeIntodate(model.testStartTime!.toInt())}");
                print("james${currentDate}");

                return '${DateTimeUtil.convertTimeIntodate(model.testStartTime!.toInt())}' ==
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
                              Text(
                                'Date & Time',
                                style: TextStyle(
                                    //   backgroundColor: Color(0xffFFFFFF),
                                    color: Color(0xfff9B9B9B),
                                    fontSize: 14,
                                    fontFamily: 'Open Sans',
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                'Terminal',
                                style: TextStyle(
                                    //   backgroundColor: Color(0xffFFFFFF),
                                    color: Color(0xfff9B9B9B),
                                    fontSize: 14,
                                    fontFamily: 'Open Sans',
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${DateTimeUtil.convertTimeIntodate(model.testStartTime!.toInt())}' ??
                                    'Terminal',
                                style: TextStyle(
                                    backgroundColor: Color(0xffFFFFFF),
                                    color: Color(0xfff333333),
                                    fontSize: 16,
                                    fontFamily: 'Open Sans',
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                model.terminalName ?? 'S401',
                                style: TextStyle(
                                    //   backgroundColor: Color(0xffFFFFFF),
                                    color: Color(0xfff333333),
                                    fontSize: 14,
                                    fontFamily: 'Open Sans',
                                    fontWeight: FontWeight.w400),
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
                    : SizedBox(
                        height: 0,
                      );
              },
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
