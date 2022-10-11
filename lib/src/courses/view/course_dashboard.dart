import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    classBatchData= await util.getString(sp_className);

    print(">>>>> $classBatch");
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
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.blueGrey)
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButtonFormField<String>(
                                      hint: Text("$classBatchData"),
                                      value: classBatch,
                                      items:model.courseDropDownModel?.map((item) => DropdownMenuItem<String>(
                                        value: item.className,
                                        child: Text(item.className.toString(),),
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
                                height: 15,
                              ),
                              Consumer<CourseViewModel>(
                                  builder: (context, data, child) {
                                // print("hello ${data.courseModel?.length}");
                                return Container(
                                  color: Colors.white,
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
                                              height: 110,
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
                                                        child: Container(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top: 5),
                                                            width: 40,
                                                            child: Icon(
                                                                Icons.ac_unit)),
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
                                                                      .more_vert),
                                                                  itemBuilder:
                                                                      (context) {
                                                                    return List
                                                                        .generate(
                                                                            1,
                                                                            (index) {
                                                                      return PopupMenuItem(
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
                                                                            Navigator.pushNamed(
                                                                                context,
                                                                                AppRoutes.individualSub);
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            padding: EdgeInsets.only(
                                                                                top: 20,
                                                                                bottom: 20,
                                                                                right: 10,
                                                                                left: 15),
                                                                            child:
                                                                                Text(
                                                                              'View Course Info',
                                                                                    style: TextStyle(
                                                                                        fontWeight: FontWeight.w400,
                                                                                        fontSize: 12,
                                                                                        fontFamily: 'open-sans',
                                                                                        color: Color(0xff333333))
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    });
                                                                  },
                                                                ),
                                                              ],
                                                            ),
                                                            Text(
                                                                "${data.courseModel?.sTUDENTSUBJECTS?[index].subjectName ?? ""}",style: TextStyle(
                                                                fontWeight: FontWeight.w400,
                                                                fontSize: 14,
                                                                fontFamily: 'open-sans',
                                                                color: Color(0xff333333)
                                                            )),
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
                                                                                ' ${data.courseModel?.sTUDENTSUBJECTS?[index].credits ?? ""}',
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
                                                            )
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
