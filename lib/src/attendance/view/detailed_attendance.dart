import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pesu/utils/view/widget.dart';
import 'package:provider/provider.dart';

import '../../../utils/constants/cheking_network.dart';
import '../view_model/attendance_view_model.dart';
class DetailedAttendance extends StatefulWidget {

  String? subjectCode;
  String? subjectName;
  String? percentage;
  String? attendance;
  int? subjectId;
  int? batchClassId;
  int? classBatchSectionId;
  DetailedAttendance({this.subjectCode,this.subjectName,this.attendance,this.percentage,this.subjectId,this.batchClassId,this.classBatchSectionId});
  @override
  _DetailedAttendanceState createState() => _DetailedAttendanceState();
}

class _DetailedAttendanceState extends State<DetailedAttendance> {

  late AttendanceViewModel _viewModel;
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  void initState() {
    super.initState();
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    _viewModel = Provider.of<AttendanceViewModel>(context, listen: false);
    // _viewModel.getAttendanceDropDown(
    // );
    _viewModel.getDetailedAttendanceModel(isDynamic: true,batchId: widget.batchClassId,classBatchSectionId:widget.classBatchSectionId,subId: widget.subjectId);
    // _viewModel.getDetailedAttendanceModel(isDynamic: false);

    // _viewModel.getDetailedAttendanceModel(isDynamic: true,batchId: batchClassId,classbatchsectionId: classBatchSectionId);
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

  Widget build(BuildContext context) {
    return _connectionStatus == true
        ?
      Scaffold(
      appBar: sideNavAppBar("Attendance Report"),
         body: Consumer<AttendanceViewModel>(builder: (context,value,child) {
        return value.detailedAttendanceModel != null  ?
        SingleChildScrollView(
          child: Column(
            children: [

              Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.13,
                //  height:85,
                width: 500,
                color: Color(0xff0091CD),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Column(
                        children: [
                          SizedBox(height: 15,),
                          Row(
                            children: [
                              Text('${widget.subjectCode} ', style: TextStyle(fontSize: 14,
                                color: Color.fromRGBO(255, 255, 255, 0.6),),),
                              Expanded(child: Text(
                                '- ${widget.subjectName}',
                                style: TextStyle(
                                  fontSize: 14, color: Colors.white,),)),
                            ],
                          ),
                          Row(
                            children: [
                              Text('Last updated on : ',
                                style: TextStyle(
                                  fontSize: 14, color: Colors.white,),),

                            ],
                          ),
                          Row(
                            children: [
                              Text('Attendance ', style: TextStyle(fontSize: 14,
                                color: Color.fromRGBO(255, 255, 255, 0.6),),),
                              Text('${widget.attendance}', style: TextStyle(
                                fontSize: 14, color: Colors.white,),),
                              SizedBox(width: 15,),
                              Text('Percentage ', style: TextStyle(fontSize: 14,
                                color: Color.fromRGBO(255, 255, 255, 0.6),),),
                              Text('${widget.percentage} %', style: TextStyle(
                                fontSize: 14, color: Colors.white,),),
                            ],
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 3),
              value.detailedAttendanceModel!.isNotEmpty ?  Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ListView.builder(
                    // scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: value.detailedAttendanceModel?.length ?? 0,
                    itemBuilder: (context, index) {
                      return Container(
                        child: Column(
                          // mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            //  CardViewContent(attdetails[index]),
                            ListTile(
                              title: Container(
                                child: Text(value.detailedAttendanceModel?[index].dateOfAttendance??"",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Column(
                                        children: [
                                          Container(
                                            //  width: 170,
                                              child: Text(
                                                 "${ value.detailedAttendanceModel?[index].startTime??""} - ${ value.detailedAttendanceModel?[index].endTime??""}",
                                                  style: TextStyle(fontSize: 14,
                                                    color: Color(
                                                        0xff9B9B9B),))),

                                          Icon(
                                            value.detailedAttendanceModel?[index].status==1?  Icons.check:Icons.clear,
                                            color:  value.detailedAttendanceModel?[index].status==1?Colors.green:Colors.red,
                                            size: 30.0,
                                          ),
                                        ],
                                      ),
                                      SizedBox(width: 8,),
                                      Container(color: Colors.black,
                                        height: 55,
                                        width: 0.05,),

                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Divider(),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ):Center(child: Padding(
                padding: const EdgeInsets.all(38.0),
                child: Text("No Data Available", style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    color: Color(0xff000000)
                ),),
              )),
            ],
          ),
        ) : Center(
          child: value.detailedAttendanceModel!=null && value.detailedAttendanceModel!.isEmpty?Text("No Data Available",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 18,
              color: Color(0xff000000)
            ),
          ):CircularProgressIndicator(),
        );
      }
      ),
    ):WillPopScope(onWillPop: () {return exit(0);
    }, child: NoNetworkWidget());

}}
