import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:pesu/src/courses/view/course_content.dart';
import 'package:pesu/src/courses/view/course_objectives.dart';
import 'package:pesu/src/courses/view/course_outcomes.dart';
import 'package:pesu/src/courses/view/course_references.dart';
import 'package:pesu/src/courses/viewModel/courseArgument.dart';
import 'package:pesu/utils/services/app_routes.dart';
import 'package:provider/provider.dart';

import '../../../utils/constants/color_consts.dart';
import '../../../utils/view/widget.dart';
import '../model/subjectModel.dart';
import '../viewModel/courseViewModel.dart';
import 'course_dashboard.dart';

class IndividualSubScreen extends StatefulWidget {
  @override
  int? subjectCode;
  String subjectName;
   int? ccId;
  IndividualSubScreen({required this.subjectName,required this.subjectCode, this.ccId});
  State<IndividualSubScreen> createState() => _IndividualSubScreenState();
}

class _IndividualSubScreenState extends State<IndividualSubScreen>
    with TickerProviderStateMixin {
  CourseViewModel _subjectViewModel = CourseViewModel();
  CourseViewModel _unitViewModel = CourseViewModel();
  int? selected;
  int? tabValue;
  late final _tabController =
      TabController(initialIndex: 0, vsync: this, length: 4);
  @override
  void initState() {
    super.initState();
    _subjectViewModel = Provider.of<CourseViewModel>(context, listen: false);
    _subjectViewModel.getSubjectContentDetails(
        action: 18,
        mode: 11,
        subjectId: int.parse(widget.subjectCode.toString()),
        subjectName: widget.subjectName,
        randomNum: 0.9969186291364449);
    _unitViewModel = Provider.of<CourseViewModel>(context, listen: false);

  }

  Widget build(BuildContext context) {
    return Consumer<CourseViewModel>(builder: (context, model, child) {
      var subjectCode = model.subjectModel?.cOURSECONTENT
          ?.map((e) => e.courseContentTypeId)
          .toSet()
          .toList();
      return

          DefaultTabController(
        length: 4,
        child: (model.subjectModel?.cOURSECONTENT != null &&
                model.subjectModel?.cOURSECONTENT?.length != 0)
            ? Scaffold(
                appBar: AppBar(
                  leading: BackButton(
                    onPressed: () {
                      Navigator.pop(context);
                      // Navigator.pushReplacementNamed(context, AppRoutes.courseDashboard);
                    },
                  ),
                  title: Text("${widget.subjectName}"),
                  bottom: TabBar(
                    indicatorSize: TabBarIndicatorSize.label,
                    isScrollable: true,
                    controller: _tabController,
                    tabs: /* model.subjectModel?.cOURSECONTENT
                  ?.map((e) => Tab(text:e.courseContentType))
                  .toSet()
                  .toList();*/
                        // model.subjectModel!.cOURSECONTENT?.map((e) => Tab(text: e)).toList()),
                        [
                      (subjectCode!.contains(1))
                          ? Tab(
                              child: Text("Content"),
                            )
                          : Container(),
                      (subjectCode!.contains(2))
                          ? Tab(
                              child: Text("Objectives"),
                            )
                          : Container(),
                      (subjectCode!.contains(3))
                          ? Tab(
                              child: Text("Outcomes"),
                            )
                          : Container(),
                      (subjectCode!.contains(5))
                          ? Tab(
                              child: Text("References"),
                            )
                          : Container(),
                    ],
                  ),
                ),
                body: TabBarView(
                  controller: _tabController,
                  children:
                      /*   model.subjectModel?.cOURSECONTENT
                ?.map((e) => Center(child: Text(e.courseContentOrder),))
                .toSet()
                .toList();*/
                      [
                    (subjectCode!.contains(1))
                        ? Container(
                            padding: EdgeInsets.only(top: 8, left: 8, right: 8),
                            child: CourseContent(
                              subjectName: widget.subjectName,
                              subjectCode: widget.subjectCode,
                              ccId: model.subjectModel?.cOURSECONTENT?[0].courseContentId,),
                          )
                        : Container(),
                    (subjectCode!.contains(2))
                        ? Container(
                            padding: EdgeInsets.only(top: 8, left: 8, right: 8),
                            child: CourseObjectives(subjectName: widget.subjectName,
                              subjectCode: widget.subjectCode,
                              ccId: model.subjectModel?.cOURSECONTENT?[1].courseContentId,),
                    )

                        : Container(),
                    (subjectCode!.contains(3))
                        ? Container(
                            padding: EdgeInsets.only(top: 8, left: 8, right: 8),
                            child: CourseOutComes(subjectName: widget.subjectName,
                              subjectCode: widget.subjectCode,
                              ccId: model.subjectModel?.cOURSECONTENT?[2].courseContentId,),
                    )
                        : Container(),
                    (subjectCode!.contains(5))
                        ? Container(
                            padding: EdgeInsets.only(top: 8, left: 8, right: 8),
                            child: CourseReferences(subjectName: widget.subjectName,
                              subjectCode: widget.subjectCode,
                              ccId: model.subjectModel?.cOURSECONTENT?[3].courseContentId,),
                    )
                        : Container(),
                  ],
                ),
              )
            :   Scaffold(
          appBar: AppBar(
            leading: BackButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.Dashboard);
              },
            ),
            title: Text("${widget.subjectName}"),

          ),
          body: Center(
            child: model.subjectModelLength==0?Text("No course available",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20
            ),
            ):CircularProgressIndicator(),
          ),
        ),
      );
    });
  }

}
