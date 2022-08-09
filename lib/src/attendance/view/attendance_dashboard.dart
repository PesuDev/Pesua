import 'package:flutter/material.dart';
import 'package:pesu/src/attendance/view_model/attendance_view_model.dart';
import 'package:pesu/utils/services/app_routes.dart';
import 'package:pesu/utils/view/widget.dart';
import 'package:provider/provider.dart';

class AttendanceDashboard extends StatefulWidget {
  const AttendanceDashboard({Key? key}) : super(key: key);

  @override
  _AttendanceDashboardState createState() => _AttendanceDashboardState();
}


class _AttendanceDashboardState extends State<AttendanceDashboard> {
  late AttendanceViewModel _viewModel;
  void initState() {
    super.initState();
    _viewModel = Provider.of<AttendanceViewModel>(context, listen: false);
    _viewModel.getAttendanceDropDown(
    );
    _viewModel.getAttendanceListInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: sideNavAppBar("Attendance"),
     // drawer: Container(),
      body: Consumer<AttendanceViewModel>(builder: (context,value,child){
        return Container(
          margin: EdgeInsets.only(top: 15,left: 15,right: 15,bottom: 15),
          child: SingleChildScrollView(
            child:   Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueGrey)
                  ),
                  child: TextButton(onPressed: (){},

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Sem-3",
                            style: TextStyle(
                              color: Colors.black87,
                            ),
                          ),
                          Icon(Icons.arrow_drop_down_outlined,
                            color: Colors.black,
                          ),
                        ],
                      )),
                ),

                Container(
                  child: Column(
                    children: [

                      Container(
                        margin: EdgeInsets.only(top: 15),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Color(0xff163269)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [
                            Text("SUBJECT",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18
                              ),
                            ),
                            Text("ATTENDANCE  %" ,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18
                              ),
                            ),
                          ],
                        ),
                      ),
                      ListTileTheme.merge(
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: value.attendanceListModel?.aTTENDANCELIST?.length,
                            itemBuilder: (context,index){
                              return Container(
                                margin: EdgeInsets.only(top: 10),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          flex:2,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("${value.attendanceListModel?.aTTENDANCELIST?[index].subjectCode}",
                                                style: TextStyle(


                                                    fontSize: 14
                                                ),
                                              ),
                                              Text("${value.attendanceListModel?.aTTENDANCELIST?[index].subjectName}",
                                                maxLines: 4,
                                                style: TextStyle(


                                                    fontSize: 14
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 20,),
                                        Expanded(child: Text("${value.attendanceListModel?.aTTENDANCELIST?[index].attendedClasses??0}/${value.attendanceListModel?.aTTENDANCELIST?[index].totalClasses??0}")),
                                        SizedBox(width: 5,),
                                        Expanded(child: Text("${value.attendanceListModel?.aTTENDANCELIST?[index].attendancePercenrage??0}%")),
                                        SizedBox(width: 5,),
                                        Expanded(child: IconButton(
                                          icon:      Icon(Icons.keyboard_arrow_right,
                                            size: 30,
                                            color: Color(0xff999999),
                                          ),
                                          onPressed: (){
                                            Navigator.pushNamed(context, AppRoutes.detailedAttendance);
                                          },
                                        )),
                                      ],
                                    ),
                                    SizedBox(height: 10,),
                                    Divider(color: Colors.grey,thickness: 0.5,),
                                  ],
                                ),

                              );
                            }),
                      ),
                    ],
                  ),
                )
              ],

            ),
          ),
        );
      },

      ),
    );
  }

}
