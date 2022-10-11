import 'package:flutter/material.dart';
import 'package:pesu/src/attendance/model/attendance_arguments.dart';
import 'package:pesu/src/attendance/view_model/attendance_view_model.dart';
import 'package:pesu/utils/constants/sp_constants.dart';
import 'package:pesu/utils/services/app_routes.dart';
import 'package:pesu/utils/view/widget.dart';
import 'package:provider/provider.dart';

import '../../../utils/services/sharedpreference_utils.dart';

class AttendanceDashboard extends StatefulWidget {
  bool isFromDashboard;
 AttendanceDashboard({required this.isFromDashboard}) ;

  @override
  _AttendanceDashboardState createState() => _AttendanceDashboardState();
}


class _AttendanceDashboardState extends State<AttendanceDashboard> {
  late AttendanceViewModel _viewModel;
  var classBatch;
  var classBatchData;
  var classBatchData1;
  void initState() {
    super.initState();
 initMethod();
    drop();
  }
  SharedPreferenceUtil util = SharedPreferenceUtil();
initMethod()async{
  _viewModel = Provider.of<AttendanceViewModel>(context, listen: false);
  _viewModel.getAttendanceDropDown(
  );
  _viewModel.getAttendanceListInfo(isDynamic: false);

  classBatchData= await util.getString(sp_className);

print(">>>>> $classBatch");
}

  drop()async{
    classBatchData=  await util.getString(sp_className);
    classBatchData1 = classBatchData.toString().substring(0,5);
    print("object${classBatchData1}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:widget.isFromDashboard?sideNavAppBarForDashboard("Attendance"): sideNavAppBar("Attendance"),
     // drawer: Container(),
      body: Consumer<AttendanceViewModel>(builder: (context,value,child){

        return value.attendanceListModel?.aTTENDANCELIST !=null?Container(
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
                  child: DropdownButtonHideUnderline(
                    child: DropdownButtonFormField<String>(
                      hint: Text("$classBatchData1"),
                        value: classBatch,
                        items:value.attendanceDropDownModel?.map((item) => DropdownMenuItem<String>(
                          value: item.className,
                          child: Text(item.className.toString(),),
                        ))
                            .toList(),
                        onChanged: (item) {
                          print("Oye");
                          var batchClassId;
                          setState(() {
                            // subject=item;
                            // var subjectCodeList=   data.sessionEffectivenessModel?.stuentsubjectlist?.map((itemValue){
                            //   if(item==itemValue.subjectName){
                            //     return itemValue.subjectCode.toString();
                            //   }
                            //
                            // });

                            for (var subjectData in value!.attendanceDropDownModel!){
                              if(subjectData.className==item){
                               batchClassId=subjectData.batchClassId;
                              }
                            }
                          });
                          print("Hoye");
                          //       print(">>>>  $subjectCode");
                          _viewModel.getAttendanceListInfo(isDynamic: true,batchId: batchClassId);
                        }),
                  ),
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
                                                    fontFamily: 'open sans',
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xff333333),
                                                    fontSize: 12
                                                ),
                                              ),
                                              SizedBox(height: 5,),
                                              Text("${value.attendanceListModel?.aTTENDANCELIST?[index].subjectName}",
                                                maxLines: 4,
                                                style: TextStyle(
fontFamily: 'open sans',
fontWeight: FontWeight.w400,
color: Color(0xff9B9B9B),
                                                    fontSize: 12
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 20,),
                                        Expanded(child: Text("${value.attendanceListModel?.aTTENDANCELIST?[index].attendedClasses??0}/${value.attendanceListModel?.aTTENDANCELIST?[index].totalClasses??0}")),
                                        SizedBox(width: 5,),
                                        Expanded(child: Text("${value.attendanceListModel?.aTTENDANCELIST?[index].attendancePercenrage??"NA"}")),
                                        SizedBox(width: 5,),
                                        Expanded(child: IconButton(
                                          icon:      Icon(Icons.keyboard_arrow_right,
                                            size: 30,
                                            color: Color(0xff999999),
                                          ),
                                          onPressed: (){
                                            Navigator.pushNamed(context, AppRoutes.detailedAttendance,arguments: DetailedArguments(
                                              subjectCode: value.attendanceListModel?.aTTENDANCELIST?[index].subjectCode,
                                              subjectName: value.attendanceListModel?.aTTENDANCELIST?[index].subjectName,
                                              attendance: "${value.attendanceListModel?.aTTENDANCELIST?[index].attendedClasses}/${value.attendanceListModel?.aTTENDANCELIST?[index].totalClasses}",
                                              percentage: value.attendanceListModel?.aTTENDANCELIST?[index].attendancePercenrage.toString()
                                            ));
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
        ):Center(child: CircularProgressIndicator(),);
      },

      ),
    );
  }

}
