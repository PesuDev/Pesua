import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pesu/src/dashboard_module/model/settings_model.dart';
import 'package:pesu/utils/services/app_routes.dart';

class DashboardViewModel extends ChangeNotifier{

  List<SettingsModel> getSettingsList(){
    return [
      SettingsModel(name: 'LogOut',icon: Icons.logout,callback: (){},),
      SettingsModel(name: 'My Courses',icon: Icons.book_outlined,callback: (){}),
      SettingsModel(name: 'Exam Grievances',icon: Icons.add_chart,callback: (){}),
      SettingsModel(name: 'Time Table',icon: Icons.alarm_on_outlined,callback: (){}),
      SettingsModel(name: 'Attendance',icon: Icons.bookmark_added,callback: (){}),
      SettingsModel(name: 'Assignments',icon: Icons.book_sharp,callback: (){}),
      SettingsModel(name: 'ISA Results',icon: Icons.add_chart,callback: (){}),
      SettingsModel(name: 'Seating Info',icon: Icons.event_seat,callback: (){}),
      SettingsModel(name: 'Session Effectiveness',icon: Icons.settings_input_svideo_sharp,callback: (){}),
      SettingsModel(name: 'Classroom Videos',icon: Icons.ondemand_video_outlined,callback: (){}),
      SettingsModel(name: 'Backlog Registration',icon: Icons.app_registration,callback: (){}),
      SettingsModel(name: 'Online Payment',icon: Icons.payment,callback: (){}),
      SettingsModel(name: 'Placements',icon: Icons.business,callback: (){}),
      SettingsModel(name: 'Calender',icon: Icons.calendar_today_outlined,callback: (){}),
      SettingsModel(name: 'Announcements',icon: Icons.announcement_outlined,callback: (){}),
      SettingsModel(name: 'Library',icon: Icons.library_books,callback: (){}),
      SettingsModel(name: 'Transport',icon: Icons.emoji_transportation,callback: (){}),
      SettingsModel(name: 'PESU Forums',icon: Icons.folder,callback: (){}),
      SettingsModel(name: 'My Profile',icon: Icons.account_circle_outlined,callback: (){}),
      SettingsModel(name: 'ESA Results',icon: Icons.add_chart,callback: (){}),
    ];
  }


}