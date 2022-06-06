import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pesu/src/dashboard_module/model/settings_model.dart';
import 'package:pesu/utils/services/app_routes.dart';

class DashboardViewModel extends ChangeNotifier{

  List<SettingsModel> getSettingsList(){
    return [
      SettingsModel(name: 'Login',icon: Icons.settings,callback: (){},),
      SettingsModel(name: 'My Courses',icon: Icons.settings,callback: (){}),
      SettingsModel(name: 'Exam Grievances',icon: Icons.settings,callback: (){}),
      SettingsModel(name: 'Time Table',icon: Icons.settings,callback: (){}),
      SettingsModel(name: 'Attendance',icon: Icons.settings,callback: (){}),
      SettingsModel(name: 'Assignments',icon: Icons.settings,callback: (){}),
      SettingsModel(name: 'ISA Results',icon: Icons.settings,callback: (){}),
      SettingsModel(name: 'Seating Info',icon: Icons.settings,callback: (){}),
      SettingsModel(name: 'Session Effectiveness',icon: Icons.settings,callback: (){}),
      SettingsModel(name: 'Classroom Videos',icon: Icons.settings,callback: (){}),
      SettingsModel(name: 'Backlog Registration',icon: Icons.settings,callback: (){}),
      SettingsModel(name: 'Online Payment',icon: Icons.settings,callback: (){}),
      SettingsModel(name: 'Placements',icon: Icons.settings,callback: (){}),
      SettingsModel(name: 'Calender',icon: Icons.settings,callback: (){}),
      SettingsModel(name: 'Announcements',icon: Icons.settings,callback: (){}),
      SettingsModel(name: 'Library',icon: Icons.settings,callback: (){}),
      SettingsModel(name: 'Transport',icon: Icons.settings,callback: (){}),
      SettingsModel(name: 'PESU Forums',icon: Icons.settings,callback: (){}),
      SettingsModel(name: 'My Profile',icon: Icons.settings,callback: (){}),
      SettingsModel(name: 'ESA Results',icon: Icons.settings,callback: (){}),
    ];
  }


}