import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:provider/provider.dart';

import '../viewModel/courseViewModel.dart';

class CourseReferences extends StatefulWidget {
  int? subjectCode;
  String subjectName;
  int? ccId;
  CourseReferences({this.ccId,required this.subjectName,this.subjectCode});

  @override
  State<CourseReferences> createState() => _CourseReferencesState();
}

class _CourseReferencesState extends State<CourseReferences> {
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
                    width: 29.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              'assets/images/m_course_.jpg'),
                          fit: BoxFit.cover),
                      // shape: BoxShape.circle,
                    ),
                  ),
                  Container(
                      width:
                      MediaQuery.of(context).size.width * 0.8,
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
              : Center(child: model.contentModelLength==-1?CircularProgressIndicator():Text("No course available",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20
            ),));
        }));
  }
}
