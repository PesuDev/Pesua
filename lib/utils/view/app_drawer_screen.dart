import 'package:flutter/material.dart';
import 'package:pesu/utils/constants/color_consts.dart';
import 'package:pesu/utils/services/app_routes.dart';

class AppDrawerScreen extends StatefulWidget {
  const AppDrawerScreen({Key? key}) : super(key: key);

  @override
  State<AppDrawerScreen> createState() => _AppDrawerScreenState();
}

class _AppDrawerScreenState extends State<AppDrawerScreen> {
  var _mainHeight;
  var _mainWidth;

  @override
  Widget build(BuildContext context) {
    _mainHeight = MediaQuery.of(context).size.height;
    _mainWidth = MediaQuery.of(context).size.width;

    return Drawer(
      child: Container(
        color: Colors.white,
        height: _mainHeight * 0.8,
        width: _mainWidth * 0.3,
        child: ListView(
          children: [
            Container(
              height: _mainHeight * 0.035,
              alignment: Alignment.center,
              child: RichText(
                text: TextSpan(
                    text: 'PES',
                    style: TextStyle(
                        color: headingColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                    children: [
                      TextSpan(
                          text: ' University',
                          style: TextStyle(color: appThemeContrastColor)),
                    ]),
              ),
            ),
            Divider(),
            getDrawerDetails(context: context),
            getDrawerTiles(
                context: context,
                icon: Icons.assessment,
                title: 'My Courses',
                callback: () {}),

            getDrawerTiles(
                context: context,
                icon: Icons.all_inclusive,
                title: 'Examination Grievance Redressal System',
                callback: () {}),
            getDrawerTiles(
                context: context,
                icon: Icons.addchart_sharp,
                title: 'Timetable',
                callback: () {}),
            getDrawerTiles(
                context: context,
                icon: Icons.wysiwyg_outlined,
                title: 'Attendance',
                callback: () {
Navigator.pushNamed(context, AppRoutes.attendance);

                }),
            getDrawerTiles(
                context: context,
                icon: Icons.weekend_outlined,
                title: 'Assignments',
                callback: () {
                  Navigator.pushNamed(context, AppRoutes.assignment);

                }),
            getDrawerTiles(
                context: context,
                icon: Icons.weekend_outlined,
                title: 'ISA Results',
                callback: () {}),
            getDrawerTiles(
                context: context,
                icon: Icons.weekend_outlined,
                title: 'ESA Results',
                callback: () {}),
            getDrawerTiles(
                context: context,
                icon: Icons.weekend_outlined,
                title: 'Session Effectiveness',
                callback: () {}),
            getDrawerTiles(
                context: context,
                icon: Icons.weekend_outlined,
                title: 'Seating Info',
                callback: () {}),
            getDrawerTiles(
                context: context,
                icon: Icons.weekend_outlined,
                title: 'ClassRoom Videos',
                callback: () {}),
            getDrawerTiles(
                context: context,
                icon: Icons.weekend_outlined,
                title: 'Backlog Registration',
                callback: () {
                  Navigator.pushNamed(context, AppRoutes.backLog);
                }),
            getDrawerTiles(
                context: context,
                icon: Icons.weekend_outlined,
                title: 'Online Payments',
                callback: () {}),
            getDrawerTiles(
                context: context,
                icon: Icons.weekend_outlined,
                title: 'Placements',
                callback: () {
                  Navigator.pushNamed(context, AppRoutes.placement);
                }),
            getDrawerTiles(
                context: context,
                icon: Icons.weekend_outlined,
                title: 'Calender',
                callback: () {}),
            getDrawerTiles(
                context: context,
                icon: Icons.weekend_outlined,
                title: 'Announcements',
                callback: () {}),
            getDrawerTiles(
                context: context,
                icon: Icons.weekend_outlined,
                title: 'Notification',
                callback: () {

                  Navigator.pushNamed(context, AppRoutes.notification);
                }),
            getDrawerTiles(
                context: context,
                icon: Icons.weekend_outlined,
                title: 'Library',
                callback: () {}),
            getDrawerTiles(
                context: context,
                icon: Icons.weekend_outlined,
                title: 'PES University',
                callback: () {}),
            getDrawerTiles(
                context: context,
                icon: Icons.weekend_outlined,
                title: 'PESU Forums',
                callback: () {}),
            getDrawerTiles(
                context: context,
                icon: Icons.weekend_outlined,
                title: 'CIE',
                callback: () {}),
            getDrawerTiles(
                context: context,
                icon: Icons.weekend_outlined,
                title: 'Bootstrap',
                callback: () {}),
            getDrawerTiles(
                context: context,
                icon: Icons.weekend_outlined,
                title: 'Transport',
                callback: () {

                  Navigator.pushNamed(context, AppRoutes.transport);
                }),
            getDrawerTiles(
                context: context,
                icon: Icons.weekend_outlined,
                title: 'My Profile',
                callback: () {}),
            getDrawerTiles(
                context: context,
                icon: Icons.weekend_outlined,
                title: 'Setting',
                callback: () {

                  Navigator.pushNamed(context, AppRoutes.settings);
                }),
            getDrawerTiles(
                context: context,
                icon: Icons.weekend_outlined,
                title: 'Help',
                callback: () {

                  Navigator.pushNamed(context, AppRoutes.help);
                }),
            getDrawerTiles(
                context: context,
                icon: Icons.weekend_outlined,
                title: 'Logout',
                callback: () {}),
          ],
        ),
      ),
    );
  }

  Widget getDrawerTiles(
      {required BuildContext context,
      required IconData icon,
      required String title,
      required Function callback}) {
    return GestureDetector(
      onTap:()=> callback(),
      child: Container(
        padding: EdgeInsets.only(
          left: _mainWidth * 0.02,
          right: _mainWidth * 0.02,
          bottom: _mainHeight*0.01,
            top:  _mainHeight*0.01,
        ),

        color: Colors.blue,
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 20,
            ),
            SizedBox(width: _mainWidth*0.02,),
            Container(

              width: _mainWidth*0.62,
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
    /*ListTile(

      leading: Container(
          decoration: BoxDecoration(
              color: appThemeColor.withAlpha(50),
              borderRadius: BorderRadius.circular(5)),
          height: 30,
          width: 30,
          child: Icon(
            icon,
            color: appThemeColor,
            size: 20,
          )),
      title: Text(
        title,
        style: TextStyle(
            fontSize: 16, color: Colors.black87, fontWeight: FontWeight.w500),
      ),
      trailing: Icon(
        Icons.arrow_right,
        size: 20,
      ),
    );*/
  }

  Widget getDrawerDetails({required BuildContext context}) {
    return Container(
      height: _mainHeight * 0.11,
      color: Colors.white,
      padding: EdgeInsets.only(left: _mainWidth * 0.02),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: MediaQuery.of(context).size.height * 0.04,
            backgroundImage: NetworkImage(
                'https://pes.edu/wp-content/uploads/2018/08/PROF.-AJOY-KUMAR-960X960-v1-800x800.jpg'),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.02),
          Container(
            width: _mainWidth * 0.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'AJOY KUMAR',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.black),
                ),
                Text('PESU ID : PES12345678', style: getTextStyle),
                Text('SRN : PES12345678', style: getTextStyle),
                Text('BRANCH : CSE', style: getTextStyle),
                Text('Sem-7,Section A', style: getTextStyle),
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
