import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pesu/utils/view/widget.dart';
import 'package:provider/provider.dart';

import '../../../utils/constants/color_consts.dart';
import '../../../utils/constants/custom_widgets.dart';
import '../../../utils/services/bottom_navigaton_provider.dart';
import '../../dashboard_module/view/dashboard_page.dart';

class CalendarDashboard extends StatefulWidget {
  const CalendarDashboard({Key? key}) : super(key: key);

  @override
  State<CalendarDashboard> createState() => _CalendarDashboardState();
}

class _CalendarDashboardState extends State<CalendarDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: sideNavAppBar("Calendar of Event"),
      bottomNavigationBar:    Consumer<BottomNavigationProvider>(
        builder: (context, value, child) {
          return BottomNavigationBar(
              currentIndex: value.selectedIndex,
              fixedColor: appThemeColor,
              items:CustomWidgets.getNavBarItems(),
              selectedFontSize: 10,
              unselectedFontSize: 10,
              type: BottomNavigationBarType.fixed,
              onTap: (index) {

                value.selectBottomIndex(bottomIndex: index);
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => DashboardScreen()));
              }

          );
        },
      ),
      body: Container(
        child: Center(
          child: Text("Data of events nor available",
          style: TextStyle(
            fontSize: 16
          ),
          ),
        ),
      ),
    );
  }
}
