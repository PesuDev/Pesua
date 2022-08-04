import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pesu/src/courses/view/individual_sub_Screen.dart';
import 'package:pesu/src/courses/viewModel/courseDropDownViewModel.dart';
import 'package:pesu/src/courses/viewModel/courseViewModel.dart';
import 'package:pesu/utils/services/app_routes.dart';
import 'package:pesu/utils/view/widget.dart';
import 'package:provider/provider.dart';

class CourseDashboard extends StatefulWidget {
  const CourseDashboard({Key? key}) : super(key: key);

  @override
  _CourseDashboardState createState() => _CourseDashboardState();
}

class _CourseDashboardState extends State<CourseDashboard> {
  final GlobalKey _menuKey = GlobalKey();
  bool isSemSelected = false;
  String? dropDownTitle;
  late CourseDropDownViewModel _courseDropDownViewModel;
  late CourseViewModel _courseViewModel;

  void initState() {
    super.initState();
    _courseDropDownViewModel =
        Provider.of<CourseDropDownViewModel>(context, listen: false);
    _courseDropDownViewModel.getCourseDropDownDetails(
        action: 18,
        mode: 1,
        whichObjectId: "clickHome_pesuacademy_mycourses",
        title: "My Courses",
        userId: "e157111c-3591-4826-a1da-3b5d20db14df",
        deviceType: 1,
        serverMode: 0,
        programId: 1,
        redirectValue: "redirect:/a/ad",
        randomNum: 0.3376470323389076);
    _courseViewModel = Provider.of<CourseViewModel>(context, listen: false);
    _courseViewModel.getCourseDetails(
        action: 18,
        mode: 2,
        batchClassId: 1272,
        classBatchSectionId: 4063,
        classId: 39,
        userId: "b12faeb9-f07a-4456-8e71-50f4d81919ed",
        programId: 1,
        semIndexVal: 0,
        randomNum: 0.26757885412517934);
    print(
        "dddddddddddddddd ${_courseDropDownViewModel.courseDropDownModel?.length}");
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CourseDropDownViewModel>(builder: (context, model, child) {
      return Scaffold(
          appBar: sideNavAppBar("My Courses"),
          body: model.courseDropDownModel != null &&
                  model.courseDropDownModel!.length != 0
              ? Container(
                  padding:
                      EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 3),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          print("set $isSemSelected");
                          isSemSelected = true;
                          print("reset $isSemSelected");
                          // _semBottomSheet();
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                backgroundColor: Colors.black45,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                elevation: 16,
                                child: Container(
                                  child: ListView.separated(
                                    itemCount:
                                        model.courseDropDownModel?.length ?? 0,
                                    itemBuilder: (context, index) {
                                      print("bbbbbb $dropDownTitle");
                                      return Column(
                                        children: [
                                          _buildRow(model
                                                  .courseDropDownModel?[index]
                                                  .className ??
                                              ""),
                                        ],
                                      );
                                    },
                                    separatorBuilder: (context, index) {
                                      return Divider(
                                        color: Colors.white60,
                                        endIndent: 5.0,
                                        indent: 5.0,
                                      );
                                    },
                                    shrinkWrap: true,
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(2, 2),
                                  blurRadius: 8,
                                  color: (isSemSelected == true)
                                      ? Colors.blue
                                      : Colors.white)
                            ],
                            border: Border.all(
                                color: (isSemSelected == true)
                                    ? Colors.blueAccent
                                    : Colors.grey),
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: Container(
                            color: Colors.white,
                            padding: EdgeInsets.only(
                                left: 5, right: 5, top: 5, bottom: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  dropDownTitle ??
                                      "${model.courseDropDownModel![0].className}",
                                  style: TextStyle(fontSize: 18),
                                ),
                                Icon(Icons.arrow_drop_down),
                              ],
                            ),
                          ),
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
                          height: MediaQuery.of(context).size.height * 0.7,
                          padding: EdgeInsets.only(top: 8, bottom: 8),
                          child: ListView.builder(
                              itemCount:
                                  data.courseModel?.sTUDENTSUBJECTS?.length ??
                                      0,
                              itemBuilder: (context, index) {
                                print(
                                    "sssssssssssssss  ${data.courseModel?.sTUDENTSUBJECTS?[index].subjectCode}");
                                return Column(
                                  children: [
                                    Container(
                                      height: 100,
                                      child: Card(
                                        elevation: 5,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, bottom: 10),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                  padding:
                                                      EdgeInsets.only(top: 5),
                                                  width: 40,
                                                  child: Icon(Icons.ac_unit)),
                                              Container(
                                                padding:
                                                    EdgeInsets.only(left: 10),
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.8,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
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
                                                            ""),
                                                        PopupMenuButton(
                                                          child: Icon(
                                                              Icons.more_vert),
                                                          itemBuilder:
                                                              (context) {
                                                            return List
                                                                .generate(1,
                                                                    (index) {
                                                              return PopupMenuItem(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        top: 0,
                                                                        bottom:
                                                                            0,
                                                                        right:
                                                                            0,
                                                                        left:
                                                                            0),
                                                                child: InkWell(
                                                                  onTap: () {
                                                                    Navigator.pushNamed(
                                                                        context,
                                                                        AppRoutes
                                                                            .individualSub);
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    padding: EdgeInsets.only(
                                                                        top: 20,
                                                                        bottom:
                                                                            20,
                                                                        right:
                                                                            10,
                                                                        left:
                                                                            15),
                                                                    child: Text(
                                                                      'View Details',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              14),
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
                                                        "${data.courseModel?.sTUDENTSUBJECTS?[index].subjectName ?? ""}"),
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
                                                                  text: 'Type:',
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      fontSize:
                                                                          14,
                                                                      color: Colors
                                                                          .grey)),
                                                              TextSpan(
                                                                  text:
                                                                      " ${data.courseModel?.sTUDENTSUBJECTS?[index].name}",
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          14,
                                                                      color: Colors
                                                                          .blueGrey)),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  right: 50),
                                                          child: RichText(
                                                            text: TextSpan(
                                                              children: <
                                                                  TextSpan>[
                                                                TextSpan(
                                                                    text:
                                                                        'Credits:',
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .normal,
                                                                        fontSize:
                                                                            14,
                                                                        color: Colors
                                                                            .grey)),
                                                                TextSpan(
                                                                    text:
                                                                        ' ${data.courseModel?.sTUDENTSUBJECTS?[index].credits ?? ""}',
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontSize:
                                                                            14,
                                                                        color: Colors
                                                                            .blueGrey)),
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
                ));
    });
  }

  Widget _buildRow(
    String name,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            InkWell(
              onTap: () {
                setState(() {
                  dropDownTitle = name;
                });
                Navigator.of(context).pop();
              },
              child: Container(
                padding:
                    EdgeInsets.only(left: 10.0, top: 8, bottom: 8, right: 8),
                child: InkWell(
                  child: Row(
                    children: <Widget>[
                      Center(
                        child: Text(
                          name,
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _semBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return new Container(
            color: Color(0xFF737373),
            //could change this to Color(0xFF737373),
            //so you don't have to change MaterialApp canvasColor
            child: new Container(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                decoration: new BoxDecoration(
                    color: Colors.black45,
                    borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(30.0),
                        topRight: const Radius.circular(30.0))),
                child: Column(
                  children: [
                    new Text(
                      "SEM 3",
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                    Divider(
                      color: Colors.white,
                      indent: 12.0,
                      endIndent: 12.0,
                    ),
                    new Text(
                      "SEM 4",
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                  ],
                )),
          );
        });
  }
}
