import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:pesu/src/courses/viewModel/courseArgument.dart';
import 'package:pesu/utils/services/app_routes.dart';
import 'package:provider/provider.dart';

import '../model/subjectModel.dart';
import '../viewModel/courseViewModel.dart';

class IndividualSubScreen extends StatefulWidget {
  const IndividualSubScreen({Key? key}) : super(key: key);

  @override
  State<IndividualSubScreen> createState() => _IndividualSubScreenState();
}

class _IndividualSubScreenState extends State<IndividualSubScreen>
    with SingleTickerProviderStateMixin {
  CourseViewModel _subjectViewModel = CourseViewModel();
  CourseViewModel _unitViewModel = CourseViewModel();
  int? selected;
  late final _tabController =
      TabController(length: 4, initialIndex: 0, vsync: this);

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
        String? htmlCode;
        return Container(
          padding: EdgeInsets.only(top: 8, bottom: 8),
          child: ListView.builder(
            itemCount: data.unitModel?.length ?? 0,
            itemBuilder: (context, i) {
              print("length------ ${data.subjectModel?.cOURSECONTENT?.length}");
              String? uriString =
                  model.subjectModel?.cOURSECONTENT?[i].courseContent;
              String uriDecode = Uri.decodeFull(uriString!);
              htmlCode = uriDecode;

              return Column(children: [
                /*   Row(
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
                            arguments: CourseArguments(
                                data.unitModel?[i].topicTitle ?? ''));
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
                    ? Consumer<CourseViewModel>(
                        builder: (context, model, child) {
                        String? val1;
                        if (model.subjectModel?.cOURSECONTENT?[i]
                                .courseContentTypeId ==
                            3) {
                          val1 = htmlCode;
                        }
                        return Container(
                          padding: EdgeInsets.only(top: 10, left: 15),
                          child: (model.subjectModel?.cOURSECONTENT?[i]
                                      .courseContentTypeId ==
                                  3)
                              ? HtmlWidget(htmlCode!)
                              : Container(),
                        );
                      })
                    : Container(),*/
                ExpansionTile(
                  title: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.individualUnit,
                          arguments: CourseArguments(
                              data.unitModel?[i].topicTitle ?? ''));
                    },
                    child: Container(
                        padding: EdgeInsets.only(top: 8, bottom: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  onExpansionChanged: ((newState) {
                    if (newState)
                      setState(() {
                        selected = i;
                      });
                    else
                      setState(() {
                        selected = -1;
                      });
                  }),
                  // initiallyExpanded: i == selected,
                  leading: Container(
                      child: Icon(
                    selected == i
                        ? Icons.remove_circle_rounded
                        : Icons.add_circle,
                    color: Colors.blue,
                  )),
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
        );
      });
    });
  }

  Widget? objectives() {
    return Consumer<CourseViewModel>(builder: (context, model, child) {
      return Container(
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
                        Icon(Icons.ac_unit_outlined),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.85,
                          padding: EdgeInsets.only(left: 5, top: 5),
                          child: HtmlWidget(
                            htmlCode,
                          ),
                        )
                      ],
                    )
                  : Container();
            }),
      );
    });
  }

  Widget? outcomes() {
    return Consumer<CourseViewModel>(builder: (context, model, child) {
      return Container(
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
                        Icon(Icons.ac_unit_outlined),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.85,
                          padding: EdgeInsets.only(left: 5, top: 5),
                          child: HtmlWidget(htmlCode),
                        )
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
        child: Consumer<CourseViewModel>(builder: (context, model, child) {
          return ListView.separated(
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
                        Icon(
                          Icons.ac_unit_outlined,
                          size: 100,
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width * 0.6,
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
          );
        }));
  }
}
