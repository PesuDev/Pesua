import 'package:flutter/material.dart';
import 'package:pesu/src/time_table/view/subpages_timetable.dart';
import 'package:pesu/utils/view/widget.dart';

class TimeTable extends StatefulWidget {
  const TimeTable({Key? key}) : super(key: key);

  @override
  _TimeTableState createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  late TabController tabController;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 7,
        child: Scaffold(
            appBar: sideNavAppBar("TimeTable"),
            backgroundColor:Colors.white.withOpacity(0.9),
            body: Column(children: [
              Container(
                color: Colors.cyan,
                width: double.infinity,
                margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                child: TabBar(
                  isScrollable: true,
                  indicatorColor: Colors.orange,
                  indicatorWeight: 6,
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
                  child: TabBarView(children: [
                    Monday(),
                    Tuesday(),
                    Wednesday(),
                    Thursday(),
                    Friday(),
                    Saturday(),
                    Sunday(),
                  ])),
            ])));
  }
}
