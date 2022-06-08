import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:pesu/utils/constants/color_consts.dart';
import 'package:pesu/utils/services/app_routes.dart';
import 'package:pesu/utils/view/app_drawer_screen.dart';
import 'package:pesu/utils/view/widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _mainHeight;
  var _mainWidth;
  List<String> imageList = [
    'https://events.pes.edu/Uploads/20220514%20025025_DigitalBanner400x222may142022.jpg',
    'https://events.pes.edu/Uploads/20220531%20091235_Free%20Vacational%20Training400X222V1.jpg',
    'https://events.pes.edu/Uploads/20220603%20124410_preplacementdiscussion.jpg',
    'https://events.pes.edu/Uploads/20220530%20061247_Campus_placement_drive_400X222_v2%20(1).jpg',
  ];
  @override
  Widget build(BuildContext context) {
    _mainHeight = MediaQuery.of(context).size.height;
    _mainWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: _mainHeight,
          width: _mainWidth,
          color: Colors.white,
          padding: EdgeInsets.only(
            top: _mainHeight * 0.00,
            bottom: _mainHeight * 0.015,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.myProfile);
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      getStudentLinks(
                          icon: Icon(Icons.wysiwyg),
                          color: Color(0xffE3E7FD),
                          text: 'My Courses',
                          callback: () {
                            Navigator.pushNamed(
                                context, AppRoutes.courseDashboard);
                          }),
                      SizedBox(width: 30,),
                      getStudentLinks(
                          icon: Icon(Icons.archive),
                          color: Color(0xffFDECE3),
                          text: 'ISA Results',
                          callback: () {
                            Navigator.pushNamed(context, AppRoutes.isaResults);
                          }),
                      SizedBox(width: 30,),

                      getStudentLinks(
                          icon: Icon(Icons.date_range),
                          color: Color(0xffE3FDE3),
                          text: 'Attendance',
                          callback: () {
                            Navigator.pushNamed(context, AppRoutes.attendance);
                          }),
                      SizedBox(width: 30,),

                      getStudentLinks(
                          icon: Icon(Icons.view_week),
                          color: Color(0xffE3F4FD),
                          text: 'Seating Info',
                          callback: () {
                            Navigator.pushNamed(context, AppRoutes.seatingInfo);
                          }),
                      SizedBox(width: 30,),

                      getStudentLinks(
                          icon: Icon(Icons.calendar_today_sharp),
                          color: Color(0xffFDECE3),
                          text: 'Calender',
                          callback: () {
                          //  Navigator.pushNamed(context, AppRoutes.seatingInfo);
                          }),
                      SizedBox(width: 30,),

                      getStudentLinks(
                          icon: Icon(Icons.menu_book),
                          color: Color(0xffF3E3FD),
                          text: 'ESA Result',
                          callback: () {
                            Navigator.pushNamed(context, AppRoutes.esaresults);
                          }),
                      SizedBox(width: 30,),

                      getStudentLinks(
                          icon: Icon(Icons.speaker_notes_outlined),
                          color: Color(0xffE3F4FD),
                          text: 'Time Table',
                          callback: () {
                            Navigator.pushNamed(context, AppRoutes.timeTable);
                          }),
                      SizedBox(width: 20,)
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: _mainHeight * 0.01,
              ),
              Container(
                height: _mainHeight * 0.2,
                padding: EdgeInsets.symmetric(horizontal: _mainWidth * 0.03),
                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                image: NetworkImage(
                                  imageList[index],
                                ),
                                fit: BoxFit.cover,
                              )),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                              width: _mainWidth,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.black54,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(5),
                                    bottomRight: Radius.circular(5)),
                              ),
                              height: 30,
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Invitation to Participate from dated - 07 June 2022",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  ),
                                ),
                              )),
                        )
                      ],
                    );
                  },
                  autoplay: true,
                  itemCount: imageList.length,
                ),
              ),
              SizedBox(
                height: _mainHeight * 0.03,
              ),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: _mainWidth * 0.035),
                  child: Text(
                    'Important (4 Unread)',
                    style: TextStyle(
                        color: appThemeContrastColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: _mainWidth * 0.03),
                height: _mainHeight * 0.12,
                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.only(
                            top: _mainHeight * 0.02,
                            bottom: _mainHeight * 0.018),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/images/pesu_logo.png',
                              height: 40,
                            ),
                            Container(
                              padding: EdgeInsets.only(left: _mainWidth * 0.03),
                              width: _mainWidth * 0.73,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Department of Computer Science & Technology ',
                                    style: TextStyle(
                                        color: headingColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Spacer(),
                                  Text(
                                    'Date : 24-May-2022',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: _mainHeight * 0.02,
                              alignment: Alignment.topRight,
                              margin: EdgeInsets.only(left: _mainWidth * 0.02),
                              width: _mainWidth * 0.025,
                              decoration: BoxDecoration(
                                  color: appThemeContrastColor,
                                  shape: BoxShape.circle),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  autoplay: true,
                  itemCount: 4,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: _mainWidth * 0.035),
                alignment: Alignment.centerLeft,
                height: _mainHeight * 0.04,
                //color: Colors.grey.shade200,
                child: Text(
                  'Announcements (4 Unread)',
                  style: TextStyle(
                      color: headingColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: _mainWidth * 0.03),
                height: _mainHeight * 0.12,
                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.only(
                            top: _mainHeight * 0.02,
                            bottom: _mainHeight * 0.018),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/images/pesu_logo.png',
                              height: 40,
                            ),
                            Container(
                              padding: EdgeInsets.only(left: _mainWidth * 0.03),
                              width: _mainWidth * 0.73,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Department of Computer Science & Technology ',
                                    style: TextStyle(
                                        color: headingColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Spacer(),
                                  Text(
                                    'Date : 24-May-2022',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: _mainHeight * 0.02,
                              alignment: Alignment.topRight,
                              margin: EdgeInsets.only(left: _mainWidth * 0.02),
                              width: _mainWidth * 0.025,
                              decoration: BoxDecoration(
                                  color: headingColor,
                                  /*index % 2==0?Color(0xff7ab02a):Color(0xffff0000)*/
                                  shape: BoxShape.circle),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  autoplay: true,
                  itemCount: 4,
                ),
              ),
            ],
          ),
        ),
        //drawer: AppDrawerScreen(),
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
    return Container(
      height: _mainHeight * 0.060,
      color: Colors.white,
      margin: EdgeInsets.only(
          left: _mainWidth * 0.05,
          right: _mainWidth * 0.05,
          top: _mainHeight * 0.02),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
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
                  'Student Name',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 5,
                ),
                Text('SRN : PES12345678', style: getTextStyle),
              ],
            ),
          ),
        ],
      ),
    );
  }

  TextStyle get getTextStyle => TextStyle(
      fontSize: 14, color: Colors.black87, fontWeight: FontWeight.w400);
}
