import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pesu/src/assignment/view/assigment_dashboard.dart';
import 'package:pesu/src/assignment/view/detailed_assignment.dart';
import 'package:pesu/src/attendance/view/attendance_dashboard.dart';
import 'package:pesu/src/attendance/view/back_log_registration.dart';
import 'package:pesu/src/attendance/view/detailed_attendance.dart';
import 'package:pesu/src/help/view/help_dashboard.dart';
import 'package:pesu/src/notification/view/notification.dart';
import 'package:pesu/src/placement/view/placement_dashboard.dart';
import 'package:pesu/src/settings/view/settings.dart';
import 'package:pesu/src/transport/view/transport_dashboard.dart';

class AppRouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    return data(settings);
  }
}

data(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.transport: return MaterialPageRoute(
        builder: (_) =>TransportDashboard()
    );
    case AppRoutes.attendance: return MaterialPageRoute(
        builder: (_) =>AttendanceDashboard()
    );
    case AppRoutes.settings: return MaterialPageRoute(
        builder: (_) =>Settings()
    );
    case AppRoutes.backLog: return MaterialPageRoute(
        builder: (_) =>BackLogRegistration()
    );
    case AppRoutes.help: return MaterialPageRoute(
        builder: (_) =>HelpDashboard()
    );
    case AppRoutes.notification: return MaterialPageRoute(
        builder: (_) =>NotificationDashboard()
    );
    case AppRoutes.assignment: return MaterialPageRoute(
        builder: (_) =>AssignmentsDashboard()
    );
    case AppRoutes.placement: return MaterialPageRoute(
        builder: (_) =>PlacementDashboard()
    );
    case AppRoutes.detailedAttendance: return MaterialPageRoute(
        builder: (_) =>DetailedAttendance()
    );
    case AppRoutes.detailedAssignment: return MaterialPageRoute(
        builder: (_) =>DetailedAssignment()
    );
  }
  }
class AppRoutes {
  static const String transport="transport";
  static const String attendance="attendance";
  static const String settings="settings";
  static const String detailedAttendance="detailedAttendance";
  static const String help="help";
  static const String backLog="backLog";
  static const String assignment="assignment";
  static const String notification="notification";
  static const String placement="placement";
  static const String detailedAssignment="detailedAssignment";

}