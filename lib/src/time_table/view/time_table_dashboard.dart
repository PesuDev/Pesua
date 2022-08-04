import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pesu/src/time_table/view/subpages_timetable.dart';
import 'package:pesu/src/time_table/viewmodel/timetable_viewmodel.dart';
import 'package:pesu/utils/constants/color_consts.dart';
import 'package:pesu/utils/view/widget.dart';
import 'package:provider/provider.dart';
import 'dart:developer';


class TimeTable extends StatefulWidget {
  const TimeTable({Key? key}) : super(key: key);

  @override
  _TimeTableState createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable>  with SingleTickerProviderStateMixin{
  late TabController tabController;


   DateTime date = DateTime.now();
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController=TabController(length: 7, vsync: this);
    tabController.addListener(() {

    });
  }



   @override
  Widget build(BuildContext context) {

    print("lala ${date.weekday}");
    print("loo ${tabController.index}");

    return DefaultTabController(
        length: 7,
        child: Scaffold(
            appBar: sideNavAppBar("TimeTable"),
            backgroundColor:Colors.white.withOpacity(0.9),
            body: Column(children: [
              Container(
                color: headingColor,
                width: double.infinity,
                margin: EdgeInsets.only(left: 10, right: 10, top: 9),
                child: TabBar(
                  labelColor: Colors.white,
                  isScrollable: true,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(

                      borderRadius: BorderRadius.circular(0),
                      color: Colors.blue),

                  tabs: [
                    Tab(
                      child: Container(
                        child: Text(
                          "MON",
                          style: TextStyle(
                              fontFamily: 'Open Sans',
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffFFFFFF)
                          ),
                          maxLines: 1,
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        child: Text(
                          "TUE",
                          style: TextStyle(
                              fontFamily: 'Open Sans',
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffFFFFFF)
                          ),
                          maxLines: 1,
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        child: Text(
                          "WED",
                          style: TextStyle(
                              fontFamily: 'Open Sans',
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffFFFFFF)
                          ),
                          maxLines: 1,
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        child: Text(
                          "THU",
                          style: TextStyle(
                              fontFamily: 'Open Sans',
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffFFFFFF)
                          ),
                          maxLines: 1,
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        child: Text(
                          "FRI",
                          style: TextStyle(
                              fontFamily: 'Open Sans',
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffFFFFFF)
                          ),
                          maxLines: 1,
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        child: Text(
                          "SAT",
                          style: TextStyle(
                              fontFamily: 'Open Sans',
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffFFFFFF)
                          ),
                          maxLines: 1,
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        child: Text(
                          "SUN",
                          style: TextStyle(
                              fontFamily: 'Open Sans',
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffFFFFFF)
                          ),
                          maxLines: 1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  height: MediaQuery.of(context).size.height / 1.36,
                  child:
                  TabBarView(
                   //controller: tabController,

                      children: [
                       ChangeNotifierProvider(create: (BuildContext context) =>TimeTableViewmodel(),
                        child: Monday(
                    )),
                    ChangeNotifierProvider(create: (BuildContext context) =>TimeTableViewmodel(),
                        child: Tuesday()),
                    ChangeNotifierProvider(create: (BuildContext context) =>TimeTableViewmodel(),
                        child:Wednesday()),
                    ChangeNotifierProvider(create: (BuildContext context) =>TimeTableViewmodel(),
                        child:Thursday()),
                       ChangeNotifierProvider(create: (BuildContext context) =>TimeTableViewmodel(),
                        child:Friday()),
                    ChangeNotifierProvider(create: (BuildContext context) =>TimeTableViewmodel(),
                        child:Saturday()),
                    ChangeNotifierProvider(create: (BuildContext context) =>TimeTableViewmodel(),
                        child:Sunday()),
                  ])
              ),

            ])));
  }

  }



