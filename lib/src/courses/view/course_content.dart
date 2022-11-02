import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:provider/provider.dart';

import '../../../utils/services/app_routes.dart';
import '../viewModel/courseArgument.dart';
import '../viewModel/courseViewModel.dart';

class CourseContent extends StatefulWidget {
  int? subjectCode;
  String subjectName;
  int? ccId;
 CourseContent({this.ccId,required this.subjectName,this.subjectCode});

  @override
  State<CourseContent> createState() => _CourseContentState();
}

class _CourseContentState extends State<CourseContent> {
  bool _customTileExpanded = true;
  CourseViewModel _unitViewModel = CourseViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _unitViewModel = Provider.of<CourseViewModel>(context, listen: false);
    _unitViewModel.getUnitDetails(
        action: 18,
        mode: 14,
        subjectId:int.parse( widget.subjectCode.toString()),
        ccId:int.parse( widget.ccId.toString()),
        randomNum: 0.23423121848145212);
  }
  @override

  Widget build(BuildContext context) {
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
                        ? Icons.remove_circle_rounded
                        : Icons.add_circle_rounded,
                    color: Colors.blue,
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
            : Center(child: model.contentModelLength==-1?CircularProgressIndicator():Text("No course available",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20
          ),));
      });
    });

  }
}
