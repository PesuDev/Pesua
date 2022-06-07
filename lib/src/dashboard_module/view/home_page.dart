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
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: appThemeColor,
        title: Text(
          'PES University',
        ),
      ),
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
            getDrawerDetails(context: context),
            SizedBox(
              height: _mainHeight*0.01,
            ),
            Container(
              color: Color(0xffFAFAFA),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    getStudentLinks(
                        icon: Icon(Icons.wysiwyg),
                        color: Colors.blueAccent.shade100,
                        text: 'My Courses',
                        callback: () {}),
                    getStudentLinks(
                        icon: Icon(Icons.archive),
                        color: Colors.orange.shade100,
                        text: 'ISA Results',
                        callback: () {}),
                    getStudentLinks(
                        icon: Icon(Icons.date_range),
                        color: Colors.lightGreen.shade100,
                        text: 'Attendance',
                        callback: () {}),
                    getStudentLinks(
                        icon: Icon(Icons.view_week),
                        color: Colors.lightBlueAccent.shade100,
                        text: 'Seating Info',
                        callback: () {
                          Navigator.pushNamed(context, AppRoutes.seatingInfo);
                        })
                  ],
                ),
              ),
            ),
            SizedBox(
              height: _mainHeight*0.01,
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
                                  bottomRight: Radius.circular(5),
                            )),
                            height: 30,
                            child: Text(
                              "Invitation to Participate in an Event",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
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
                padding: EdgeInsets.symmetric(horizontal: _mainWidth * 0.05),
                child: Text(
                  'Important(4 Unread)',
                  style: TextStyle(color: headingHome,
                  fontSize: 18,fontWeight: FontWeight.bold),
                )),
            Container(
              padding: EdgeInsets.symmetric(horizontal: _mainWidth * 0.03),
              height: _mainHeight * 0.1,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(
                      Icons.ac_unit,
                      size: 24,
                      color: appThemeContrastColor,
                    ),
                    title: Text(
                      'Department of Computer Science & Technology',
                      style: TextStyle(
                        color: headingColor,
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Text(
                      'Date : 24-May-2022',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios_rounded),
                  );
                },
                autoplay: true,
                itemCount: 4,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: _mainWidth * 0.05),
              alignment: Alignment.centerLeft,
              height: _mainHeight * 0.04,
              color: Colors.grey.shade200,
              child: Text(
                'Announcements (1 Unread)',
                style: TextStyle(
                    color: Color(0xff191D6E),
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: _mainWidth * 0.05),
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Icon(
                  Icons.ac_unit,
                  size: 24,
                  color: appThemeContrastColor,
                ),
                title: Text(
                  'Department of Computer Science & Technology',
                  style: TextStyle(
                    color: headingColor,
                    fontSize: 18,
                  ),
                ),
                subtitle: Text(
                  'Date : 24-May-2022',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
              ),
            )
          ],
        ),
      ),
      drawer: AppDrawerScreen(),
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
          SizedBox(height: 5,),
          Text(text)
        ],
      ),
    );
  }
  Widget getDrawerDetails({required BuildContext context}) {
    return Container(

      height: _mainHeight * 0.065,
      color: Colors.white,
      margin: EdgeInsets.only(left: _mainWidth * 0.05,right: _mainWidth*0.05,top: _mainHeight*0.02),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: MediaQuery.of(context).size.height * 0.025,
            backgroundImage: NetworkImage(
                'https://pes.edu/wp-content/uploads/2018/08/PROF.-AJOY-KUMAR-960X960-v1-800x800.jpg'),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.02),
          Container(
            width: _mainWidth * 0.75,
            child: Column(
            //  mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'AJOY KUMAR',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.black),
                ),
                SizedBox(height: 5,),
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
