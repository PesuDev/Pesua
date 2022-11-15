import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:provider/provider.dart';

import '../../../utils/constants/cheking_network.dart';
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
  bool _connectionStatus = true;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
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
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }



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
    return  _connectionStatus == true
        ?
      Container(
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
        })):WillPopScope(onWillPop: () {return exit(0);
    }, child: NoNetworkWidget());
  }
}
