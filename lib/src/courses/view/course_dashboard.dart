import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pesu/src/attendance/model/attendance_arguments.dart';
import 'package:pesu/src/courses/view/individual_sub_Screen.dart';

import 'package:pesu/src/courses/viewModel/courseViewModel.dart';
import 'package:pesu/utils/constants/sp_constants.dart';
import 'package:pesu/utils/services/app_routes.dart';
import 'package:pesu/utils/view/widget.dart';
import 'package:provider/provider.dart';

import '../../../utils/services/sharedpreference_utils.dart';

class CourseDashboard extends StatefulWidget {
 bool isFromDashboard;
 CourseDashboard({required this.isFromDashboard});

  @override
  _CourseDashboardState createState() => _CourseDashboardState();
}

class _CourseDashboardState extends State<CourseDashboard> {
  final GlobalKey _menuKey = GlobalKey();
  bool isSemSelected = false;
  String? dropDownTitle;
  late CourseViewModel _courseDropDownViewModel;
  late CourseViewModel _courseViewModel;
var classBatchData;
var classBatchData1;
  void initState() {
    super.initState();
    initMethod();
  }
  SharedPreferenceUtil util = SharedPreferenceUtil();

  initMethod()async{
    _courseDropDownViewModel =
        Provider.of<CourseViewModel>(context, listen: false);
    _courseDropDownViewModel.getCourseDropDownDetails(
        action: 18,
        mode: 1,
        whichObjectId: "clickHome_pesuacademy_mycourses",
        title: "My Courses",
        deviceType: 1,
        serverMode: 0,
        redirectValue: "redirect:/a/ad",
        randomNum: 0.3376470323389076);
    _courseViewModel = Provider.of<CourseViewModel>(context, listen: false);
    _courseViewModel.getCourseDetails(
        action: 18,
        mode: 2,
        batchClassId: 1272,
        classBatchSectionId: 4063,
        semIndexVal: 0,
        randomNum: 0.26757885412517934);
    print(
        "dddddddddddddddd ${_courseDropDownViewModel.courseDropDownModel?.length}");
    // classBatchData= await util.getString(sp_className);
    // classBatchData.toString().substring(0,5);
    my();

    print(">>>>> $classBatch");
  }
my()async{
  classBatchData= await util.getString(sp_className);
  classBatchData1=classBatchData.toString().substring(0,5);
  print("my1 $classBatchData1");

}

  var classBatch;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:widget.isFromDashboard?sideNavAppBarForDashboard("My Courses"): sideNavAppBar("My Courses"),
        body: SingleChildScrollView(
          child: Consumer<CourseViewModel>(builder: (context, model, child) {
            return Container(
              child:
                  model.courseDropDownModel != null &&
                          model.courseDropDownModel!.length != 0
                      ? Container(
                          padding: EdgeInsets.only(
                              top: 15, left: 15, right: 15, bottom: 3),
                          child: Column(
                            children: [
                              Container(
                                height: 34,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.blueGrey)
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButtonFormField<String>(
                                      decoration: InputDecoration.collapsed(hintText: ''),


                                      hint: Padding(
                                        padding: const EdgeInsets.only(top: 7,left: 10),
                                        child: Text("$classBatchData1"),
                                      ),
                                      value: classBatch,
                                      items:model.courseDropDownModel?.map((item) => DropdownMenuItem<String>(
                                        value: item.className,
                                        child: Padding(
                                          padding: const EdgeInsets.only(top: 7,left: 5),
                                          child: Text(item.className.toString(),),
                                        ),
                                      ))
                                          .toList(),
                                      onChanged: (item) {
                                        print("Oye");
                                        var batchClassId;
                                        var classBatchSectionId;
                                        var classId;
                                        var programId;
                                        setState(() {
                                           classBatch=item;
                                          // var subjectCodeList=   data.sessionEffectivenessModel?.stuentsubjectlist?.map((itemValue){
                                          //   if(item==itemValue.subjectName){
                                          //     return itemValue.subjectCode.toString();
                                          //   }
                                          //
                                          // });

                                          for (var subjectData in model.courseDropDownModel!){
                                            if(subjectData.className==item){
                                              batchClassId=subjectData.batchClassId;
                                              classBatchSectionId = subjectData.classBatchSectionId;
                                              classId = subjectData.classId;

                                            }
                                          }
                                        });
                                        _courseViewModel.dropdownGetCourseDetails(
                                            action: 18,
                                            mode: 2,
                                            batchClassId: batchClassId,
                                            classBatchSectionId: classBatchSectionId,
                                          programId: 1,
                                          classId: classId,
                                            semIndexVal: 0,
                                            randomNum: 0.26757885412517934,  );
                                        print("Hoye");
                                        //       print(">>>>  $subjectCode");
                                        //_viewModel.getAttendanceListInfo(isDynamic: true,batchId: batchClassId);
                                      }),
                                ),
                              ),

                              SizedBox(
                                height: 10,
                              ),
                              Consumer<CourseViewModel>(
                                  builder: (context, data, child) {
                                // print("hello ${data.courseModel?.length}");
                                return Container(
                                 // color: Colors.amber,
                                  height:
                                      MediaQuery.of(context).size.height * 0.7,
                                  padding: EdgeInsets.only(top: 8, bottom: 8),
                                  child: ListView.builder(
                                      itemCount: data.courseModel?.sTUDENTSUBJECTS
                                              ?.length ??
                                          0,
                                      itemBuilder: (context, index) {
                                        print(
                                            "sssssssssssssss  ${data.courseModel?.sTUDENTSUBJECTS?[index].subjectCode}");
                                        return Column(
                                          children: [
                                            Container(
                                              child: Card(
                                                elevation: 5,
                                                child: Padding(
                                                  padding: const EdgeInsets.only(
                                                      top: 10,),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                    children: [
                                                      Flexible(
                                                        child:
                                                        Container(
                                                          margin: EdgeInsets.only(left: 5),
                                                          height: 40,
                                                          width: 40.0,
                                                          decoration: BoxDecoration(
                                                            image: DecorationImage(
                                                                image: AssetImage(
                                                                    'assets/images/m_course_.jpg'),
                                                                fit: BoxFit.fill),
                                                            // shape: BoxShape.circle,
                                                          ),
                                                        ),
                                                       // Image.asset("assets/images/m_course_.jpg",height: 40,width: 40,),
                                                      ),
                                                      Container(
                                                        padding: EdgeInsets.only(
                                                            left: 10),
                                                        width:
                                                            MediaQuery.of(context)
                                                                    .size
                                                                    .width *
                                                                0.8,
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(data
                                                                        .courseModel
                                                                        ?.sTUDENTSUBJECTS?[
                                                                            index]
                                                                        .subjectCode ??
                                                                    "",style: TextStyle(
                                                                  fontWeight: FontWeight.w400,
                                                                  fontSize: 14,
                                                                  fontFamily: 'open-sans',
                                                                  color: Color(0xff9B9B9B)
                                                                )),
                                                                PopupMenuButton(
                                                                  child: Icon(Icons
                                                                      .more_vert,color: Color(0xff9B9B9B),),
                                                                  itemBuilder:
                                                                      (context) {
                                                                    return List
                                                                        .generate(
                                                                            1,
                                                                            (index) {
                                                                      return PopupMenuItem(
                                                                        height: 20,
                                                                        padding: EdgeInsets.only(
                                                                            top:
                                                                                0,
                                                                            bottom:
                                                                                0,
                                                                            right:
                                                                                0,
                                                                            left:
                                                                                0),
                                                                        child:
                                                                            InkWell(
                                                                          onTap:
                                                                              () {
                                                                            Navigator.pop(context);
                                                                            Navigator.pushNamed(
                                                                                context,
                                                                                AppRoutes.individualSub,arguments: CourseArgument(
                                                                                subjectCode: data.courseModel?.sTUDENTSUBJECTS?[index].subjectId,

                                                                                ccId: 0,subjectName: data.courseModel?.sTUDENTSUBJECTS?[index].subjectName));
                                                                          },
                                                                          child:
                                                                              Padding(
                                                                                padding: const EdgeInsets.only(left: 10),
                                                                                child: Text(
                                                                                'View Course Info',
                                                                                    style: TextStyle(
                                                                                        fontWeight: FontWeight.w400,
                                                                                        fontSize: 12,
                                                                                        fontFamily: 'open-sans',
                                                                                        color: Color(0xff333333),
                                                                                    )
                                                                                    ,
                                                                                  textAlign: TextAlign.center,
                                                                            ),
                                                                              ),
                                                                        ),
                                                                      );
                                                                    });
                                                                  },
                                                                ),
                                                              ],
                                                            ),
                                                            Container(
                                                             // color: Colors.amber,
                                                              width: MediaQuery.of(context).size.width/2,
                                                              child: Text(
                                                                  "${data.courseModel?.sTUDENTSUBJECTS?[index].subjectName ?? ""}",style: TextStyle(
                                                                  fontWeight: FontWeight.w400,
                                                                  fontSize: 14,
                                                                  fontFamily: 'open-sans',
                                                                  color: Color(0xff333333)
                                                              ),
                                                                maxLines: 2,
                                                              ),
                                                            ),
                                                            Divider(
                                                              color: Colors.grey,
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                RichText(
                                                                  text: TextSpan(
                                                                    children: <
                                                                        TextSpan>[
                                                                      TextSpan(
                                                                          text:
                                                                              'Type:',
                                                                          style: TextStyle(
                                                                              fontWeight: FontWeight.w400,
                                                                              fontFamily: 'open-sans',
                                                                              fontSize: 12,
                                                                              color: Color(0xff9B9B9B)
                                                                          )),
                                                                      TextSpan(
                                                                          text:
                                                                              " ${data.courseModel?.sTUDENTSUBJECTS?[index].name}",
                                                                          style: TextStyle(
                                                                              fontWeight: FontWeight
                                                                                  .w500,
                                                                              fontSize:
                                                                                  12,
                                                                              color:
                                                                                  Color(0xff333333))),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .only(
                                                                          right:
                                                                              50),
                                                                  child: RichText(
                                                                    text:
                                                                        TextSpan(
                                                                      children: <
                                                                          TextSpan>[
                                                                        TextSpan(
                                                                            text:
                                                                                'Credits:',
                                                                            style: TextStyle(
                                                                                fontWeight: FontWeight.w400,
                                                                                fontSize: 12,
                                                                                fontFamily: 'open-sans',
                                                                                color: Color(0xff9B9B9B))),
                                                                        TextSpan(
                                                                            text:
                                                                                ' ${data.courseModel?.sTUDENTSUBJECTS?[index].credits.toString().substring(0,1) ?? ""}',
                                                                            style: TextStyle(
                                                                                fontWeight: FontWeight.w500,
                                                                                fontSize: 12,
                                                                                fontFamily: 'open-sans',
                                                                                color: Color(0xff333333))),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),

                                                              ],
                                                            ),
                                                            SizedBox(height: 10,)
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        );
                                      }),
                                );
                              })
                            ],
                          ),
                        )
                      : Center(
                          child: CircularProgressIndicator(),
                        ),
            );
          }),
        ));
  }
}
