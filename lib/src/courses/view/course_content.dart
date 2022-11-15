import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:provider/provider.dart';

import '../../../utils/constants/cheking_network.dart';
import '../../../utils/constants/custom_widgets.dart';
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
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    _unitViewModel = Provider.of<CourseViewModel>(context, listen: false);
    _unitViewModel.getUnitDetails(
        action: 18,
        mode: 14,
        subjectId:int.parse( widget.subjectCode.toString()),
        ccId:int.parse( widget.ccId.toString()),
        randomNum: 0.23423121848145212);
  }
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }
  bool _connectionStatus = true;
  final Connectivity _connectivity = Connectivity();


  Future<void> initConnectivity() async {
    ConnectivityResult result = ConnectivityResult.none;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
        setState(() => _connectionStatus = true);
        break;
      case ConnectivityResult.mobile:
        setState(() => _connectionStatus = true);
        break;
      case ConnectivityResult.none:
        setState(() => _connectionStatus = false);
        break;
      default:
        setState(() => _connectionStatus = true);
        break;
    }
  }
  @override

  Widget build(BuildContext context) {
    return _connectionStatus == true
        ?
      Consumer<CourseViewModel>(builder: (context, model, child) {
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

                  controlAffinity: ListTileControlAffinity.leading,
                  onExpansionChanged: (bool expanded) {
                    setState(() => _customTileExpanded = expanded);
                  },
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
            },
          ),
        )
            : Center(child: model.contentModelLength==-1?CircularProgressIndicator():Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 0.0),
              child: Text("E-Learning content is available only on student webportal",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Open Sans',
                    color: Color(0xff333333),
                    fontSize: 16
                ),
              ),
            ),
            SizedBox(height: 5,),
            InkWell(
              onTap: (){
                CustomWidgets.webUrl();
              },
              child: Text("click here to visit PesuAcademy web portal",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Color(0xff0091cd),
                    fontFamily: 'Open Sans',
                    fontSize: 16
                ),
              ),
            ),
          ],
        ));
      });
    }):WillPopScope(onWillPop: () {return exit(0);
    }, child: NoNetworkWidget());

  }
}
