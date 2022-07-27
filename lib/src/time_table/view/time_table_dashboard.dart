import 'package:flutter/material.dart';
import 'package:pesu/src/time_table/view/subpages_timetable.dart';
import 'package:pesu/src/time_table/viewmodel/timetable_viewmodel.dart';
import 'package:pesu/utils/constants/color_consts.dart';
import 'package:pesu/utils/view/widget.dart';
import 'package:provider/provider.dart';

import '../model/time_table_model.dart';

class TimeTable extends StatefulWidget {
  const TimeTable({Key? key}) : super(key: key);

  @override
  _TimeTableState createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  late TabController tabController;
  late TimeTableViewmodel _viewModel;
   int? day;
  late int something;
  TimeTableModel? timeTableModel;



  @override
  void initState() {
    super.initState();
    _viewModel=Provider.of<TimeTableViewmodel>(context,listen: false);
    _viewModel.getTimeTableDetails(action: 16,mode: 1,userId: "01bf7cdc-d30e-4bd2-b965-cc3ce5a34198",randomNum:0.8235991550065647,callMethod:'background');
    if(timeTableModel?.day==1){
      print("subjectttttt ${timeTableModel?.subjectName}");
    }
  }


  @override
  Widget build(BuildContext context) {
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
                  child: TabBarView(children: [
                    table("1","1","abc","1",0),
                    table("2","2","abc","2",0),
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
                  ])),
            ])));
  }
  Widget table(String stime,String etime,String subject,String subjectCode,int Break){

    
    return
      Container(
        margin: EdgeInsets.only(top: 10),
        height: MediaQuery.of(context).size.height * 1.5,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height /1.4,
              child: Consumer<TimeTableViewmodel>(builder: (context, data, child) {

                return
                  data.timeTableModel!=null && data.timeTableModel!.isNotEmpty?

                  ListView.builder(
                      itemCount: data.timeTableModel?.length ?? 0,
                      itemBuilder: (context, index) {
                        TimeTableModel model=data.timeTableModel![index];
                        day=model.day!;
                        stime=model.startTime!; 
                        etime=model.endTime!;
                        subject=model.subjectName!;
                        subjectCode=model.subjectCode!;
                        Break=model.status!;
                       print("lalalal${day}");
                       return
                        Column(
                          children: [
                            Container(
                              width: double.infinity,
                              margin: EdgeInsets.only(left: 10, right: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(0),
                                  border: Border.all(color: Colors.grey)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width / 3,
                                      child: Text(
                                        "${model.startTime} - ${model.endTime}"?? "",
                                        // data.timeTableModel?.startTime ?? "",
                                        style: TextStyle(
                                            color: Color(0xff000000),
                                            fontFamily: 'Open Sans',
                                            fontSize: 16,
                                            fontWeight: FontWeight.normal
                                        ),),
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        Container(
                                            width:
                                            MediaQuery
                                                .of(context)
                                                .size
                                                .width *
                                                0.50,
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  subject ?? "",
                                                  maxLines: 3,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      color: Color(0xff000000),
                                                      fontFamily: 'Open Sans',
                                                      fontSize: 16,
                                                      fontWeight: FontWeight
                                                          .normal
                                                  ),),
                                              ],
                                            )),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          model.subjectCode ?? "",

                                          style: TextStyle(
                                              color: Color(0xff666666),
                                              fontFamily: 'Open Sans',
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400
                                          ),),


                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // Container(
                            //   width: double.infinity,
                            //   margin: EdgeInsets.only(left: 10, right: 10),
                            //   color: Color(0xff9E9E9E80),
                            //   height: MediaQuery.of(context).size.height / 17,
                            //   child: Padding(
                            //     padding: const EdgeInsets.only(top: 10),
                            //     child: Text(
                            //       "BREAK",
                            //       textAlign: TextAlign.center,
                            //       style: TextStyle(
                            //           color: Color(0xff333333),
                            //           fontFamily: 'Open Sans',
                            //           fontSize: 18,
                            //           fontWeight: FontWeight.normal
                            //       ),
                            //     ),
                            //   ),
                            // ),

                          ],
                        );


                      }):Container();
              },
              ),
            ),

          ],
        ),
      );

  }
}
