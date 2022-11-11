import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pesu/utils/services/app_routes.dart';
import 'package:pesu/utils/view/widget.dart';
import 'package:provider/provider.dart';

import '../../../utils/constants/color_consts.dart';
import '../../../utils/constants/custom_widgets.dart';
import '../../../utils/services/bottom_navigaton_provider.dart';
import '../../dashboard_module/view/dashboard_page.dart';

class AssignmentsDashboard extends StatefulWidget {

  @override
  _AssignmentsDashboardState createState() => _AssignmentsDashboardState();
}
class _AssignmentsDashboardState extends State<AssignmentsDashboard> {
  int _counter = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white.withOpacity(0.9),
      appBar: sideNavAppBar("Assignment"),
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
      body:SingleChildScrollView(
        child: Container(

          margin: EdgeInsets.only(left: 15,right: 15,top: 20,bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Pending(8)"),
              SizedBox(height: 10,),
assignementList(),
              SizedBox(height: 15,),
              Text("Completed(3)"),
              SizedBox(height: 15,),
              assignementList()
            ],
          ),
        ),
      )
    );
  }
  Widget assignementList(){
    return Container(
      child: ListTileTheme.merge(
        dense: true,
        child: ListView.builder(
            itemCount: 4,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context,index){
          return InkWell(
            onTap: (){
Navigator.pushNamed(context, AppRoutes.detailedAssignment);
            },
            child: Container(
              padding: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
Text("UE17CS511 Problem solving with C",),
                  SizedBox(height: 5,),
Text("Type: Home word",),
                  SizedBox(height: 5,),
Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children:[ Text("Due on: 02-Jun-2022",),
    Icon(Icons.keyboard_arrow_right,
    color: Color(0xff999999),
    size: 20,
    )
    ]),
                  SizedBox(height: 10,),
                  Divider(),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}


