import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pesu/src/announcements/view_model/announcement_viewmodel.dart';
import 'package:pesu/src/attendance/view/attendance_dashboard.dart';
import 'package:pesu/src/attendance/view_model/attendance_view_model.dart';
import 'package:pesu/src/courses/view/course_dashboard.dart';
import 'package:pesu/src/dashboard_module/view/home_page.dart';
import 'package:pesu/src/dashboard_module/view/menu_page.dart';
import 'package:pesu/src/dashboard_module/viewModel/dashboard_viewModel.dart';
import 'package:pesu/src/isa_results/view/isa_results.dart';
import 'package:pesu/src/my_profile/profile_viewmodel/profile_viewmodel.dart';
import 'package:pesu/src/seatinginfo/viewmodel/seating_info_viewmodel.dart';
import 'package:pesu/utils/constants/color_consts.dart';
import 'package:pesu/utils/services/bottom_navigaton_provider.dart';
import 'package:provider/provider.dart';
import '../../../utils/constants/cheking_network.dart';
import '../../courses/viewModel/courseViewModel.dart';
import '../../isa_results/viewmodel/isaViewModel.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool _connectionStatus = true;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  void initState() {
    super.initState();
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }


  Future<void> initConnectivity() async {
    ConnectivityResult result = ConnectivityResult.none;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
        setState(() => _connectionStatus = true);
        break;
      case ConnectivityResult.mobile:
        setState(() => _connectionStatus = true);
        break;
      case ConnectivityResult.none:
        setState(() => _connectionStatus = false);
        break;
      default:
        setState(() => _connectionStatus = true);
        break;
    }
  }
  @override
  Widget build(BuildContext context) {
    return _connectionStatus == true
        ?
      WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Consumer<BottomNavigationProvider>(
          builder: (context, value, child) {
  return WillPopScope(
            onWillPop: (){

                if (value.selectedIndex == 0) {
                  return exit(0);
                } else {
                  print("callllllaaa");

                  value.selectBottomIndex(bottomIndex: 0);
                  return Future.value(null);
                }

            },
            child: Consumer<BottomNavigationProvider>(
              builder: (context, value, child) {
                log(value.selectedIndex.toString());
                switch (value.selectedIndex) {
                  case 0:
                    return MultiProvider(
                      providers: [
                        ChangeNotifierProvider(
                        create: (_) => ProfileViewmodel(),),
                ChangeNotifierProvider(
                create: (_) => AnnouncementViewModel(),),
                        ChangeNotifierProvider(
                          create: (_) => SeatingInfoViewModel(),)
                      ],

                        child: HomePage(),

                    );
                  case 1:
                    return ChangeNotifierProvider(
                      create: (_) => CourseViewModel(),
                      child: CourseDashboard(isFromDashboard: true,),
                    );
                  case 2:
                    return ChangeNotifierProvider(
                      create: (_) => IsaViewModel(),
                      child: ISAResults(isFromDashboard: true,),
                    );
                  case 3:
                    return ChangeNotifierProvider(
                      create: (_) => AttendanceViewModel(),
                      child: AttendanceDashboard(isFromDashboard: true,),
                    );
                  case 4:
                    return ChangeNotifierProvider(
                      create: (_) => DashboardViewModel(),
                      child: MenuPage(),
                    );

                default:
                  return Container();
              }
            },
          ),
        );
        }),
      bottomNavigationBar: Consumer<BottomNavigationProvider>(
        builder: (context, value, child) {
          return BottomNavigationBar(
            currentIndex: value.selectedIndex,
            fixedColor: appThemeColor,
            items: getNavBarItems(),
            selectedFontSize: 10,
            unselectedFontSize: 10,
            type: BottomNavigationBarType.fixed,
            onTap: (index) => value.selectBottomIndex(bottomIndex: index),
          );
        },
      ),
    )):WillPopScope(onWillPop: () {return exit(0);
    }, child: NoNetworkWidget());
  }


  List<BottomNavigationBarItem> getNavBarItems() {
    return [
      BottomNavigationBarItem(
          icon: Icon(
            Icons.home_outlined,
            color: Colors.black54,
          ),
          label: 'HOME',
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
          label: 'MY COURSES',
          activeIcon: Icon(
            Icons.wysiwyg_outlined,
            color: appThemeColor,
          )),
      BottomNavigationBarItem(
          icon: Icon(
            Icons.add_chart,
            color: Colors.black54,
          ),
          label: 'ISA RESULTS',
          activeIcon: Icon(
            Icons.add_chart,
            color: appThemeColor,
          )),
      BottomNavigationBarItem(
          icon: Icon(
            Icons.access_time,
            color: Colors.black54,
          ),
          label: 'ATTENDANCE',
          activeIcon: Icon(
            Icons.access_time,
            color: appThemeColor,
          )),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.menu,
          color: Colors.black54,
        ),
        label: 'MENU',
        activeIcon: Icon(
          Icons.menu,
          color: appThemeColor,
        ),
      ),
    ];
  }
}
