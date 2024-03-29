import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:pesu/src/announcements/view/announcements.dart';
import 'package:pesu/src/announcements/view_model/announcement_viewmodel.dart';
import 'package:pesu/src/assignment/view/assigment_dashboard.dart';
import 'package:pesu/src/assignment/view/detailed_assignment.dart';
import 'package:pesu/src/attendance/model/attendance_arguments.dart';
import 'package:pesu/src/attendance/view/attendance_dashboard.dart';
import 'package:pesu/src/attendance/view/back_log_registration.dart';
import 'package:pesu/src/attendance/view/detailed_attendance.dart';
import 'package:pesu/src/attendance/view_model/attendance_view_model.dart';
import 'package:pesu/src/calendar/view/calendar_dashboard.dart';
import 'package:pesu/src/cie/view/cie_dashboard.dart';
import 'package:pesu/src/bootstrap/view/bootstrap.dart';
import 'package:pesu/src/courses/model/courseModel.dart';
import 'package:pesu/src/courses/view/course_dashboard.dart';
import 'package:pesu/src/courses/view/individual_sub_Screen.dart';
import 'package:pesu/src/courses/view/individual_unit_screen.dart';
import 'package:pesu/src/courses/viewModel/courseArgument.dart';
import 'package:pesu/src/courses/viewModel/courseViewModel.dart';
import 'package:pesu/src/esaresults/view/esa_graph.dart';
import 'package:pesu/src/esaresults/view/esa_results.dart';
import 'package:pesu/src/esaresults/viewmodel/graph_viewmodel.dart';
import 'package:pesu/src/examination_grievance/view/examination_grievance.dart';
import 'package:pesu/src/help/view/help_dashboard.dart';
import 'package:pesu/src/isa_results/view/isa_results.dart';
import 'package:pesu/src/isa_results/view/isa_results_graph.dart';
import 'package:pesu/src/isa_results/viewmodel/isaViewModel.dart';
import 'package:pesu/src/login/view/login.dart';
import 'package:pesu/src/login/viewmodel/login_viewmodel.dart';
import 'package:pesu/src/my_profile/profile_viewmodel/profile_viewmodel.dart';
import 'package:pesu/src/my_profile/view/my_profile.dart';
import 'package:pesu/src/notification/view/notification.dart';
import 'package:pesu/src/online_payments/view/online_payments.dart';
import 'package:pesu/src/placement/view/placement_dashboard.dart';
import 'package:pesu/src/seatinginfo/view/seating_info.dart';
import 'package:pesu/src/seatinginfo/viewmodel/seating_info_viewmodel.dart';
import 'package:pesu/src/session_effectiveness/view/session_effectiveness.dart';
import 'package:pesu/src/settings/view/settings.dart';
import 'package:pesu/src/time_table/view/subpages_timetable.dart';
import 'package:pesu/src/time_table/view/time_table_dashboard.dart';
import 'package:pesu/src/time_table/viewmodel/timetable_viewmodel.dart';
import 'package:pesu/src/transport/view/transport_dashboard.dart';
import 'package:provider/provider.dart';

import '../../src/announcements/view/announcement.dart';
import '../../src/dashboard_module/view/dashboard_page.dart';
import '../../src/esaresults/viewmodel/Esa_viewmodel.dart';

class AppRouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    return data(settings);
  }
}

data(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.transport:
      return MaterialPageRoute(builder: (_) => TransportDashboard());
    case AppRoutes.attendance:
      return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
              create: (_) => AttendanceViewModel(),
              child: AttendanceDashboard()));
    case AppRoutes.settings:
      return MaterialPageRoute(builder: (_) => Settings());
    case AppRoutes.backLog:
      return MaterialPageRoute(builder: (_) => BackLogRegistration());
    case AppRoutes.help:
      return MaterialPageRoute(builder: (_) => HelpDashboard());
    case AppRoutes.notification:
      return MaterialPageRoute(builder: (_) => NotificationDashboard());
    case AppRoutes.assignment:
      return MaterialPageRoute(builder: (_) => AssignmentsDashboard());
    case AppRoutes.placement:
      return MaterialPageRoute(builder: (_) => PlacementDashboard());
    case AppRoutes.cieDashboard:
      return MaterialPageRoute(builder: (_) => CieDashboard());
    case AppRoutes.detailedAttendance:
      final args = settings.arguments as DetailedArguments;
      return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
              create: (_) => AttendanceViewModel(),
              child: DetailedAttendance(
                subjectCode: args.subjectCode,
                subjectName: args.subjectName,
                attendance: args.attendance,
                percentage: args.percentage,
              )));
    case AppRoutes.detailedAssignment:
      return MaterialPageRoute(builder: (_) => DetailedAssignment());
    case AppRoutes.esaresults:
      return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
                create: (_) => EsaViewModel(),
                child: ESAResults(),
              ));
    case AppRoutes.seatingInfo:
      return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
                create: (_) => SeatingInfoViewModel(),
                child: SeatingInfo(),
              ));
    case AppRoutes.bootStrap:
      return MaterialPageRoute(builder: (_) => BootStrap());
    case AppRoutes.timeTable:
      return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
                create: (_) => TimeTableViewmodel(),
                child: TimeTable(),
              ));
    case AppRoutes.onlinePayments:
      return MaterialPageRoute(builder: (_) => OnlinePayments());
    case AppRoutes.examination:
      return MaterialPageRoute(builder: (_) => Examination());
    case AppRoutes.announcements:
      return MaterialPageRoute(  builder: (_) => ChangeNotifierProvider(
        create: (_) =>AnnouncementViewModel(),
        child: Announcements(),
      ));
    case AppRoutes.login:
      return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
                create: (_) => LoginViewModel(),
                child: Login(),
              ));
    case AppRoutes.sessionEffectiveness:
      return MaterialPageRoute(builder: (_) => SessionEffect());
    case AppRoutes.isaResults:
      return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
                create: (_) => IsaViewModel(),
                child: ISAResults(),
              ));
    case AppRoutes.isaResultsGraph:
      return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
              create: (_) => IsaViewModel(), child: IsaResultGraph()));
    case AppRoutes.myProfile:
      return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
                create: (_) => ProfileViewmodel(),
                child: MyProfile(),
              ));
    case AppRoutes.courseDashboard:
      return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
                create: (_) => CourseViewModel(),
                child: CourseDashboard(),
              ));
    case AppRoutes.individualSub:
      return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
                create: (_) => CourseViewModel(),
                child: IndividualSubScreen(),
              ));
    case AppRoutes.individualUnit:
      final CourseArguments? args = settings.arguments as CourseArguments?;
      return MaterialPageRoute(
          builder: (_) => IndividualUnitScreen(title: args?.title));
    case AppRoutes.esaGraph:
      return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
                create: (_) => GraphViewModel(),
                child: EsaGraph(),
              ));
    case AppRoutes.calendarDashboard:
      return MaterialPageRoute(builder: (_) => CalendarDashboard());
      case AppRoutes.Dashboard:
      return MaterialPageRoute(builder: (_) => DashboardScreen());
  }
}

class AppRoutes {
  static const String transport = "transport";
  static const String attendance = "attendance";
  static const String settings = "settings";
  static const String detailedAttendance = "detailedAttendance";
  static const String help = "help";
  static const String backLog = "backLog";
  static const String assignment = "assignment";
  static const String notification = "notification";
  static const String placement = "placement";
  static const String detailedAssignment = "detailedAssignment";
  static const String cieDashboard = "cieDashboard";
  static const String esaresults = "esaresults";
  static const String seatingInfo = "seatingInfo";
  static const String bootStrap = "bootStrap";
  static const String timeTable = "timeTable";
  static const String onlinePayments = "onlinePayments";
  static const String examination = "examination";
  static const String announcements = "announcements";
  static const String login = "login";
  static const String sessionEffectiveness = "sessionEffectiveness";
  static const String isaResults = "isaResults";
  static const String isaResultsGraph = "isaResultsGraph";
  static const String myProfile = "myProfile";
  static const String courseDashboard = "courseDashboard";
  static const String individualSub = "individualSub";
  static const String individualUnit = "individualUnit";
  static const String esaGraph = "esaGraph";
  static const String calendarDashboard = "calendarDashboard";
  static const String Dashboard = "Dashboard";
}
