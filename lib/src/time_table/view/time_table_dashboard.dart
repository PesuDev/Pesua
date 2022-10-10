
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pesu/src/time_table/view/subpages_timetable.dart';
import 'package:pesu/src/time_table/viewmodel/timetable_viewmodel.dart';
import 'package:pesu/utils/constants/color_consts.dart';
import 'package:pesu/utils/view/widget.dart';
import 'package:provider/provider.dart';
import 'dart:developer';


class TimeTable extends StatefulWidget {
   TimeTable({this.indexvalue});

  @override
  _TimeTableState createState() => _TimeTableState();

  int? indexvalue;

}


class _TimeTableState extends State<TimeTable>  with SingleTickerProviderStateMixin{
  late TabController tabController;
  late TimeTableViewmodel _viewModel;







  DateTime date = DateTime.now();
   @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }



   @override
  Widget build(BuildContext context) {

    return
      DefaultTabController(
        initialIndex: DateFormat('EEEE').format(DateTime.now()).toString().toLowerCase()=="monday"?0:
        DateFormat('EEEE').format(DateTime.now()).toString().toLowerCase()=="tuesday"?1:
        DateFormat('EEEE').format(DateTime.now()).toString().toLowerCase()=="wednesday"?2:
        DateFormat('EEEE').format(DateTime.now()).toString().toLowerCase()=="thursday"?3:
        DateFormat('EEEE').format(DateTime.now()).toString().toLowerCase()=="friday"?4:
        DateFormat('EEEE').format(DateTime.now()).toString().toLowerCase()=="saturday"?5:
        DateFormat('EEEE').format(DateTime.now()).toString().toLowerCase()=="sunday"?6:0,
        length: 7,
        child: Scaffold(
            appBar: sideNavAppBar("TimeTable"),

            backgroundColor:Colors.red.withOpacity(0.9),
            body: Column(children: [
              Container(
                color: headingColor,
                width: double.infinity,
              //  margin: EdgeInsets.only(left: 10, right: 10, top: 9),
                child: TabBar(
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.white.withOpacity(0.9),
                  isScrollable: true,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(

                      borderRadius: BorderRadius.circular(0),
                      color: Color(0xff0091cd)),

                  tabs: [
                    Tab(
                      child: Container(
                        child: Text(

                          "MON",
                          style: TextStyle(
                              fontFamily: 'Open Sans',
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                             // color: Color(0xffFFFFFF)
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
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              //color: Color(0xffFFFFFF)
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
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                             // color: Color(0xffFFFFFF)
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
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                             // color: Color(0xffFFFFFF)
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
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              //color: Color(0xffFFFFFF)
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
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
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
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                          ),
                          maxLines: 1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                    height: MediaQuery.of(context).size.height,
                    child:
                    TabBarView(
                     //controller:tabController,

                        children: [
                         ChangeNotifierProvider(create: (BuildContext context) =>TimeTableViewmodel(),
                          child: TableDetails(day: 'mon',
                      )),
                      ChangeNotifierProvider(create: (BuildContext context) =>TimeTableViewmodel(),
                          child: TableDetails(day: 'tuesday',)),
                      ChangeNotifierProvider(create: (BuildContext context) =>TimeTableViewmodel(),
                          child:TableDetails(day: 'wednesday',)),
                      ChangeNotifierProvider(create: (BuildContext context) =>TimeTableViewmodel(),
                          child:TableDetails(day: 'thursday',)),
                         ChangeNotifierProvider(create: (BuildContext context) =>TimeTableViewmodel(),
                          child:TableDetails(day: 'friday',)),
                      ChangeNotifierProvider(create: (BuildContext context) =>TimeTableViewmodel(),
                          child:TableDetails(day: 'saturday',)),
                      ChangeNotifierProvider(create: (BuildContext context) =>TimeTableViewmodel(),
                          child:TableDetails(day: 'sunday',)),
                    ])
                ),
              ),

            ])));
  }

  }

//DateFormat('EEEE').format(DateTime.now())




