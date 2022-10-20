import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
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
  State<IndividualSubScreen> createState() => _IndividualSubScreenState();
}

class _IndividualSubScreenState extends State<IndividualSubScreen>
    with TickerProviderStateMixin {
  CourseViewModel _subjectViewModel = CourseViewModel();
  CourseViewModel _unitViewModel = CourseViewModel();
  int? selected;
  int? tabValue;
  bool _customTileExpanded = true;
  Map<String, bool> expansionState = Map();
  late final _tabController =
      TabController(initialIndex: 0, vsync: this, length: 4);

/*  late final _tabController =
      TabController(initialIndex: 0, vsync: this, length: 4);*/

  @override
  void initState() {
    super.initState();
    _subjectViewModel = Provider.of<CourseViewModel>(context, listen: false);
    _subjectViewModel.getSubjectContentDetails(
        action: 18,
        mode: 11,
        subjectId: 3830,
        subjectName: "Electromagnetic Field & Transmission Lines",
        randomNum: 0.9969186291364449);
    _unitViewModel = Provider.of<CourseViewModel>(context, listen: false);
    _unitViewModel.getUnitDetails(
        action: 18,
        mode: 14,
        subjectId: 456,
        ccId: 301,
        randomNum: 0.23423121848145212);
  }

  Widget build(BuildContext context) {
    return Consumer<CourseViewModel>(builder: (context, model, child) {
      var subjectCode = model.subjectModel?.cOURSECONTENT
          ?.map((e) => e.courseContentTypeId)
          .toSet()
          .toList();
      /*late final _tabController = TabController(
          initialIndex: 0, vsync: this, length: subjectCode?.length ?? 0);*/
      return
          /*DefaultTabController(
        length: 4,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Subject"),
            bottom: TabBar(labelColor: Colors.white, tabs: [
              (subjectCode!.contains(1))
                  ? Tab(
                      child: Text("Content"),
                    )
                  : (subjectCode!.contains(2))
                      ? Tab(
                          child: Text("Objectives"),
                        )
                      : (subjectCode!.contains(3))
                          ? Tab(
                              child: Text("OutComes"),
                            )
                          : (subjectCode!.contains(5))
                              ? Tab(
                                  child: Text("References"),
                                )
                              : Container(),
              Tab(
                child: Text("References"),
              ),
              Tab(
                child: Text("References"),
              ),
              Tab(
                child: Text("References"),
              )
            ]),
          ),
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              (subjectCode!.contains(1))
                  ? Container(
                      padding: EdgeInsets.only(top: 8, left: 8, right: 8),
                      child: content(),
                    )
                  : (subjectCode!.contains(2))
                      ? Container(
                          padding: EdgeInsets.only(top: 8, left: 8, right: 8),
                          child: objectives(),
                        )
                      : (subjectCode!.contains(3))
                          ? Container(
                              padding:
                                  EdgeInsets.only(top: 8, left: 8, right: 8),
                              child: outcomes(),
                            )
                          : (subjectCode!.contains(5))
                              ? Container(
                                  padding: EdgeInsets.only(
                                      top: 8, left: 8, right: 8),
                                  child: references(),
                                )
                              : Container(),
              Container(
                padding: EdgeInsets.only(top: 8, left: 8, right: 8),
                child: objectives(),
              ),
              Container(
                  padding: EdgeInsets.only(top: 8, left: 8, right: 8),
                  child: outcomes()),
              (subjectCode!.contains(5))
                  ? Container(
                      padding: EdgeInsets.only(top: 8, left: 8, right: 8),
                      child: references())
                  : Container(),
            ],
          ),
        ),
      );*/
          DefaultTabController(
        length: 4,
        child: (model.subjectModel?.cOURSECONTENT != null &&
                model.subjectModel?.cOURSECONTENT?.length != 0)
            ? Scaffold(
                appBar: AppBar(
                  leading: BackButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.Dashboard);
                    },
                  ),
                  title: Text("Subject"),
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
                            child: content(),
                          )
                        : Container(),
                    (subjectCode!.contains(2))
                        ? Container(
                            padding: EdgeInsets.only(top: 8, left: 8, right: 8),
                            child: objectives(),
                          )
                        : Container(),
                    (subjectCode!.contains(3))
                        ? Container(
                            padding: EdgeInsets.only(top: 8, left: 8, right: 8),
                            child: outcomes())
                        : Container(),
                    (subjectCode!.contains(5))
                        ? Container(
                            padding: EdgeInsets.only(top: 8, left: 8, right: 8),
                            child: references())
                        : Container(),
                  ],
                ),
              )
            : Container(),
      );
    });
  }

  /* void getContentDescp() {
    List<String> SubjjectIdList;
    int? i;
    if(i ==)

    }
    // print('NEWD123333333333 -- --- ${closedTime[0]}');
    return AllContent;
  }*/

  Widget? content() {
    return Consumer<CourseViewModel>(builder: (context, model, child) {
      return Consumer<CourseViewModel>(builder: (context, data, child) {
        /* data.subjectModel.forEach((name) {
          expansionState.putIfAbsent(name, () => true);
        });*/
        String? htmlCode;
        return model.subjectModel != null &&
                data.unitModel != null &&
                data.unitModel?.length != 0
            ? Container(
                padding: EdgeInsets.only(top: 8, bottom: 8),
                child: ListView.builder(
                  itemCount: data.unitModel?.length ?? 0,
                  itemBuilder: (context, i) {
                    print(
                        "length------ ${data.subjectModel?.cOURSECONTENT?.length}");
                    String? uriString =
                        model.subjectModel?.cOURSECONTENT?[i].courseContent;
                    String uriDecode = Uri.decodeFull(uriString!);
                    htmlCode = uriDecode;

                    return Column(children: [
                      ExpansionTile(
                        title: InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, AppRoutes.individualUnit,
                                arguments: CourseArguments(
                                    data.unitModel?[i].topicTitle ?? ''));
                          },
                          child: Container(
                              padding: EdgeInsets.only(top: 8, bottom: 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(data.unitModel?[i].topicTitle ?? ""),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 12,
                                  )
                                ],
                              )),
                        ),
                        // subtitle: Text('Leading expansion arrow icon'),
                        controlAffinity: ListTileControlAffinity.leading,
                        /*     onExpansionChanged: ((newState) {
                          if (newState)
                            setState(() {
                              selected = i;
                            });
                          else
                            setState(() {
                              selected = -1;
                            });
                        }),*/
                        onExpansionChanged: (bool expanded) {
                          setState(() => _customTileExpanded = expanded);
                        },

                        // initiallyExpanded: i == selected,
                        leading: Icon(
                          _customTileExpanded
                              ? Icons.arrow_drop_down_circle
                              : Icons.arrow_drop_down,
                        ),
                        // tilePadding: EdgeInsets.zero,
                        children: <Widget>[
                          ListTile(
                            title: (model.subjectModel?.cOURSECONTENT?[i]
                                        .courseContentTypeId ==
                                    3)
                                ? HtmlWidget(htmlCode!)
                                : Container(),
                          ),
                        ],
                      )
                    ]);

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
                ),
              )
            : Center(child: CircularProgressIndicator());
      });
    });
  }

  Widget? objectives() {
    return Consumer<CourseViewModel>(builder: (context, model, child) {
      return model.subjectModel != null &&
              model.subjectModel?.cOURSECONTENT?.length != 0
          ? Container(
              color: Colors.white,
              padding: EdgeInsets.only(top: 8, bottom: 8),
              child: ListView.builder(
                  itemCount: model.subjectModel?.cOURSECONTENT?.length,
                  itemBuilder: (context, int i) {
                    String? uriString =
                        model.subjectModel?.cOURSECONTENT?[i].courseContent;
                    String uriDecode = Uri.decodeFull(uriString!);
                    String htmlCode = uriDecode;
                    return (model.subjectModel?.cOURSECONTENT?[i]
                                .courseContentTypeId ==
                            1)
                        ? Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 5),
                                height: 40,
                                width: 40.0,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/pesu_logo.png'),
                                      fit: BoxFit.cover),
                                  // shape: BoxShape.circle,
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.78,
                                padding: EdgeInsets.only(top: 5, right: 5),
                                child: HtmlWidget(
                                  htmlCode,
                                ),
                              )
                            ],
                          )
                        : Container();
                  }),
            )
          : Center(
              child: CircularProgressIndicator(),
            );
    });
  }

  Widget? outcomes() {
    return Consumer<CourseViewModel>(builder: (context, model, child) {
      return model.subjectModel != null &&
              model.subjectModel?.cOURSECONTENT?.length != 0
          ? Container(
              color: Colors.white,
              padding: EdgeInsets.only(top: 8, bottom: 8),
              child: ListView.builder(
                  itemCount: model.subjectModel?.cOURSECONTENT?.length ?? 0,
                  itemBuilder: (context, int i) {
                    String? uriString =
                        model.subjectModel?.cOURSECONTENT?[i].courseContent;
                    String uriDecode = Uri.decodeFull(uriString!);
                    String htmlCode = uriDecode;
                    return (model.subjectModel?.cOURSECONTENT?[i]
                                .courseContentTypeId ==
                            2)
                        ? Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 5),
                                height: 40,
                                width: 40.0,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/pesu_logo.png'),
                                      fit: BoxFit.cover),
                                  // shape: BoxShape.circle,
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.78,
                                padding: EdgeInsets.only(left: 5, top: 5),
                                child: HtmlWidget(htmlCode),
                              )
                            ],
                          )
                        : Container();
                  }),
            )
          : Center(child: CircularProgressIndicator());
    });
  }

  Widget? references() {
    return Container(
        color: Colors.white,
        padding: EdgeInsets.only(top: 8, bottom: 8),
        child: Consumer<CourseViewModel>(builder: (context, model, child) {
          return model.subjectModel != null &&
                  model.subjectModel?.cOURSECONTENT?.length != 0
              ? ListView.separated(
                  itemCount: model.subjectModel?.cOURSECONTENT?.length ?? 0,
                  itemBuilder: (context, int i) {
                    String? uriString =
                        model.subjectModel?.cOURSECONTENT?[i].courseContent;
                    String uriDecode = Uri.decodeFull(uriString!);
                    String htmlCode = uriDecode;
                    return (model.subjectModel?.cOURSECONTENT?[i]
                                .courseContentTypeId ==
                            5)
                        ? Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 5),
                                height: 40,
                                width: 40.0,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/pesu_logo.png'),
                                      fit: BoxFit.cover),
                                  // shape: BoxShape.circle,
                                ),
                              ),
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  padding: EdgeInsets.only(left: 10, top: 5),
                                  child: HtmlWidget(htmlCode)),
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
                )
              : Center(child: CircularProgressIndicator());
        }));
  }
}
