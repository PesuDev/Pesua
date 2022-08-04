import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pesu/src/courses/view/course_dashboard.dart';
import 'package:pesu/src/courses/view/individual_unit_screen.dart';
import 'package:pesu/src/courses/viewModel/courseArgument.dart';
import 'package:pesu/src/courses/viewModel/subjectViewModel.dart';
import 'package:pesu/src/courses/viewModel/unitViewModel.dart';
import 'package:pesu/utils/services/app_routes.dart';
import 'package:pesu/utils/view/widget.dart';
import 'package:provider/provider.dart';
import 'dart:convert' show utf8;

class IndividualSubScreen extends StatefulWidget {
  const IndividualSubScreen({Key? key}) : super(key: key);

  @override
  State<IndividualSubScreen> createState() => _IndividualSubScreenState();
}

class _IndividualSubScreenState extends State<IndividualSubScreen>
    with SingleTickerProviderStateMixin {
  SubjectViewModel _subjectViewModel = SubjectViewModel();
  UnitViewModel _unitViewModel = UnitViewModel();
  late final _tabController =
      TabController(length: 4, initialIndex: 0, vsync: this);
  bool expand = false;

  @override
  void initState() {
    super.initState();
    _subjectViewModel = Provider.of<SubjectViewModel>(context, listen: false);
    _subjectViewModel.getSubjectContentDetails(
        action: 18,
        mode: 11,
        subjectId: 3830,
        subjectName: "Electromagnetic Field & Transmission Lines",
        randomNum: 0.9969186291364449);
    _unitViewModel = Provider.of<UnitViewModel>(context, listen: false);
    _unitViewModel.getUnitDetails(
        action: 18,
        mode: 14,
        subjectId: 456,
        ccId: 301,
        randomNum: 0.23423121848145212);
  }

  Widget build(BuildContext context) {
    return Consumer<SubjectViewModel>(builder: (context, model, child) {
      return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Subject"),
            bottom: TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              isScrollable: true,
              controller: _tabController,
              tabs: [
                Tab(
                  child: Text("Content"),
                ),
                Tab(
                  child: Text("Objectives"),
                ),
                Tab(
                  child: Text("Outcomes"),
                ),
                Tab(
                  child: Text("References"),
                ),
              ],
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            children: [
              Container(
                padding: EdgeInsets.only(top: 8, left: 8, right: 8),
                child: content(),
              ),
              Container(
                padding: EdgeInsets.only(top: 8, left: 8, right: 8),
                child: objectives(),
              ),
              Container(
                  padding: EdgeInsets.only(top: 8, left: 8, right: 8),
                  child: outcomes()),
              Container(
                  padding: EdgeInsets.only(top: 8, left: 8, right: 8),
                  child: references()),
            ],
          ),
        ),
      );
    });
  }

  Widget? content() {
    return Consumer<SubjectViewModel>(builder: (context, model, child) {
      return Consumer<UnitViewModel>(builder: (context, data, child) {
        return Container(
          padding: EdgeInsets.only(top: 8, bottom: 8),
          child: ListView.separated(
            itemCount: data.unitModel?.length ?? 0,
            itemBuilder: (context, i) {
              return Column(
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          print("jjjjjj $expand");
                          setState(() {
                            if (expand == false) {
                              expand = true;
                            } else if (expand == true) {
                              expand = false;
                            }
                          });
                          print("jjjjjj $expand");
                        },
                        child: Icon(
                          (expand == false)
                              ? Icons.add_circle
                              : Icons.remove_circle_rounded,
                          color: Colors.blue,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, AppRoutes.individualUnit,
                              arguments: CourseArguments("hhjhj"));
                        },
                        child: Container(
                          padding: EdgeInsets.only(left: 10),
                          width: MediaQuery.of(context).size.width * 0.85,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(data.unitModel?[i].topicTitle ?? ""),
                              Icon(
                                Icons.chevron_right,
                                color: Colors.grey,
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  (expand == true)
                      ? Consumer<SubjectViewModel>(
                          builder: (context, model, child) {
                          print(
                              "nnnn ${model.subjectModel?.cOURSECONTENT?[i].courseContentTypeId == 3 ? {
                                  model.subjectModel?.cOURSECONTENT?[i]
                                      .courseContent
                                } : 'h'}");
                          return Container(
                            padding: EdgeInsets.only(top: 10, left: 15),
                            child: Text((model.subjectModel?.cOURSECONTENT?[i]
                                        .courseContentTypeId ==
                                    3)
                                ? (model.subjectModel?.cOURSECONTENT?[i]
                                        .courseContent ??
                                    "")
                                : ""),
                          );
                        })
                      : Container(),
                ],
              );
              /*Column(
                  children: [
                    ExpansionTile(
                      childrenPadding: EdgeInsets.zero,
                      backgroundColor: Colors.blueGrey,
                      title: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CourseDashboard()),
                          );
                        },
                        child: Container(
                          color: Colors.blueGrey,
                          padding: EdgeInsets.only(
                            top: 8,
                            bottom: 8,
                            left: 5,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Unit $i"),
                              Icon(Icons.arrow_forward_ios)
                            ],
                          ),
                        ),
                      ),
                      leading: Container(
                        child: Icon(
                          Icons.add,
                        ),
                      ),
                      trailing: const SizedBox(
                        width: 0,
                      ),
                      */
              /* trailing: Container(
                        color: Colors.blueGrey,
                        padding:
                            EdgeInsets.only(top: 8, bottom: 8, left: 0, right: 8),
                        child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CourseDashboard()),
                              );
                            },
                            child: Icon(Icons.arrow_forward_ios)),
                      ),*/
              /*
                      children: [
                        ListTile(
                          title: Text("Helooo"),
                        )
                      ],
                    )
                  ],
                );*/
            },
            separatorBuilder: (context, i) {
              return Divider();
            },
          ),
        );
      });
    });
  }

  Widget? objectives() {
    return Consumer<SubjectViewModel>(builder: (context, model, child) {
      return Container(
        padding: EdgeInsets.only(top: 8, bottom: 8),
        child: ListView.builder(
            itemCount: model.subjectModel?.cOURSECONTENT?.length,
            itemBuilder: (context, int i) {
              return (model.subjectModel?.cOURSECONTENT?[i]
                          .courseContentTypeId ==
                      1)
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.ac_unit_outlined),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.85,
                          padding: EdgeInsets.only(left: 5, top: 5),
                          child: Text(model.subjectModel?.cOURSECONTENT?[i]
                                  .courseContent ??
                              ""),
                        )
                      ],
                    )
                  : Container();
            }),
      );
    });
  }

  Widget? outcomes() {
    return Consumer<SubjectViewModel>(builder: (context, model, child) {
      return Container(
        padding: EdgeInsets.only(top: 8, bottom: 8),
        child: ListView.builder(
            itemCount: model.subjectModel?.cOURSECONTENT?.length ?? 0,
            itemBuilder: (context, int i) {
              return (model.subjectModel?.cOURSECONTENT?[i]
                          .courseContentTypeId ==
                      2)
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.ac_unit_outlined),
                        Container(
                            width: MediaQuery.of(context).size.width * 0.85,
                            padding: EdgeInsets.only(left: 5, top: 5),
                            child: Text(model.subjectModel?.cOURSECONTENT?[i]
                                    .courseContent ??
                                "")),
                      ],
                    )
                  : Container();
            }),
      );
    });
  }

  Widget? references() {
    return Container(
        padding: EdgeInsets.only(top: 8, bottom: 8),
        child: Consumer<SubjectViewModel>(builder: (context, model, child) {
          return ListView.separated(
            itemCount: model.subjectModel?.cOURSECONTENT?.length ?? 0,
            itemBuilder: (context, int i) {
              /*     var LATIN1 = const Latin1Codec();
          var BASE64 = const Base64Codec();
          var bytesInLatin1 = LATIN1.encode(
              model.subjectModel?.cOURSECONTENT?[i].courseContent ?? "");
          var base64encoded = BASE64.encode(bytesInLatin1);
          var bytesInLatin1_decoded = BASE64.decode(base64encoded);
          var initialValue = LATIN1.decode(bytesInLatin1_decoded);
          String decoded = utf8.decode(base64.decode(
              model.subjectModel?.cOURSECONTENT?[i].courseContent ?? ""));*/
              // var data = model.subjectModel?.cOURSECONTENT?[i].courseContent
              //     ?.replaceAll('%', '');
              // var dat = data?.replaceAll('', '');
              // print("daaata $data");
              // String decoded = utf8.decode(base64.decode(data!));
              return (model.subjectModel?.cOURSECONTENT?[i]
                          .courseContentTypeId ==
                      5)
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.ac_unit_outlined,
                          size: 100,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.6,
                          padding: EdgeInsets.only(left: 10, top: 5),
                          child: Text(model.subjectModel?.cOURSECONTENT?[i]
                                  .courseContent ??
                              ""),
                        ),
                      ],
                    )
                  : Container();
            },
            separatorBuilder: (context, i) {
              return (model.subjectModel?.cOURSECONTENT?[i]
                          .courseContentTypeId ==
                      5)
                  ? Divider()
                  : Container();
            },
          );
        }));
  }
}
