import 'package:flutter/material.dart';
import 'package:pesu/src/dashboard_module/viewModel/dashboard_viewModel.dart';
import 'package:pesu/utils/services/app_routes.dart';
import 'package:pesu/utils/services/bottom_navigaton_provider.dart';
import 'package:provider/provider.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  late DashboardViewModel _viewModel;
  var _mainHeight;
  var _mainWidth;

  @override
  void initState() {
    super.initState();
    _viewModel = Provider.of<DashboardViewModel>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    _mainHeight = MediaQuery.of(context).size.height;
    _mainWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 0,
        leading: IconButton(
          icon: Icon(
            Icons.clear,
            color: Colors.black,
          ),
          onPressed: () {
            Provider.of<BottomNavigationProvider>(context, listen: false)
                .selectBottomIndex(bottomIndex: 0);
          },
        ),
        title: Text(
          'Menu',
          style: TextStyle(fontWeight: FontWeight.w700, color: Colors.black),
        ),
      ),
      body: Container(
        height: _mainHeight,
        width: _mainWidth,
        color: Colors.white,
        padding: EdgeInsets.only(
            left: _mainWidth * 0.04,
            right: _mainWidth * 0.04,
            top: _mainHeight * 0.02),
        child: Container(
          height: _mainHeight * 0.8,
          width: _mainWidth,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: _mainHeight * 0.01,
                childAspectRatio: 1,
                mainAxisSpacing: _mainHeight * 0.05),
            itemBuilder: (_, index) {
              var data = _viewModel.getSettingsList()[index];
              return InkWell(
                onTap: () {
                  if (index == 0) {
                    //login

                  } else if (index == 1) {
                    //courses
                  } else if (index == 2) {
                    Navigator.pushNamed(context, AppRoutes.examination);
                  } else if (index == 3) {
                    Navigator.pushNamed(context, AppRoutes.timeTable);
                  } else if (index == 4) {
                    Navigator.pushNamed(context, AppRoutes.attendance);
                  } else if (index == 5) {
                    Navigator.pushNamed(context, AppRoutes.assignment);
                  } else if (index == 6) {
                    //ISA result
                  } else if (index == 7) {
                    Navigator.pushNamed(context, AppRoutes.seatingInfo);
                  } else if (index == 8) {
                    //session effectiveness
                  } else if (index == 9) {
                    //class room videos
                  } else if (index == 10) {
                    Navigator.pushNamed(context, AppRoutes.backLog);
                  } else if (index == 11) {
                    Navigator.pushNamed(context, AppRoutes.onlinePayments);
                  } else if (index == 12) {
                    Navigator.pushNamed(context, AppRoutes.placement);
                  } else if (index == 13) {
                    //calender
                  } else if (index == 14) {
                    //Announcements
                  } else if (index == 15) {
                    //Library
                  } else if (index == 16) {
                    Navigator.pushNamed(context, AppRoutes.transport);
                  } else if (index == 17) {
                    //PESU Forms
                  } else if (index == 18) {
                    //my profile
                  } else if (index == 19) {
                    Navigator.pushNamed(context, AppRoutes.esaresults);
                  }
                },
                child: Container(
                  //color: Colors.amber,
                  //height: _mainHeight*0.05,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        data.icon,
                        color: Colors.grey.shade400,
                        size: _mainHeight * 0.04,
                      ),
                      SizedBox(
                        height: _mainHeight * 0.01,
                      ),
                      Flexible(
                        child: Text(
                          data.name ?? '',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            itemCount: _viewModel.getSettingsList().length,
          ),
        ),
      ),
    );
  }
}
