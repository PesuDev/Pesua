import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pesu/src/attendance/view/attendance_dashboard.dart';
import 'package:pesu/src/courses/view/course_dashboard.dart';
import 'package:pesu/src/dashboard_module/view/home_Page.dart';
import 'package:pesu/utils/constants/color_consts.dart';
import 'package:pesu/utils/services/bottom_navigaton_provider.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<BottomNavigationProvider>(
        builder: (context, value, child) {
          log(value.selectedIndex.toString());
          switch (value.selectedIndex) {
            case 0:
              return HomePage();
            case 1:
              return CourseDashboard();
            case 2:
              return HomePage();
            case 3:
              return AttendanceDashboard();
            case 4:
              return HomePage();

            default:
              return Container();
          }
        },
      ),
      bottomNavigationBar: Consumer<BottomNavigationProvider>(
        builder: (context, value, child) {
          return BottomNavigationBar(
            currentIndex: value.selectedIndex,
            fixedColor: appThemeColor,
            items: getNavBarItems(),type: BottomNavigationBarType.fixed,
            onTap: (index) => value.selectBottomIndex(bottomIndex: index),
          );
        },
      ),
    );
  }

  List<BottomNavigationBarItem> getNavBarItems() {
    return [
      BottomNavigationBarItem(
          icon: Icon(
            Icons.home_outlined,
            color: Colors.black54,
          ),
          label: 'Home',
          backgroundColor: Colors.green.shade50,
          activeIcon: Icon(
            Icons.home_outlined,
            color: appThemeColor,
          )),
      BottomNavigationBarItem(
          icon: Icon(
            Icons.wysiwyg_outlined,
            color: Colors.black54,
          ),
          label: 'Courses',
          activeIcon: Icon(
            Icons.wysiwyg_outlined,
            color: appThemeColor,
          )),
      BottomNavigationBarItem(
          icon: Icon(
            Icons.add_chart,
            color: Colors.black54,
          ),
          label: 'ISA Results',
          activeIcon: Icon(
            Icons.add_chart,
            color: appThemeColor,
          )),
      BottomNavigationBarItem(
          icon: Icon(
            Icons.access_time,
            color: Colors.black54,
          ),
          label: 'Attendance',
          activeIcon: Icon(
            Icons.access_time,
            color: appThemeColor,
          )),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.notifications_none,
          color: Colors.black54,
        ),
        label: 'Notifications',
        activeIcon: Icon(
          Icons.notifications_none,
          color: appThemeColor,
        ),
      ),
    ];
  }
}
