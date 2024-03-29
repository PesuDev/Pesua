
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pesu/src/time_table/model/time_table_model.dart';
import 'package:pesu/src/time_table/viewmodel/timetable_viewmodel.dart';
import 'package:provider/provider.dart';

class TableDetails extends StatefulWidget {
  String? day;

  TableDetails({@required this.day});

  @override
  State<TableDetails> createState() => _TableDetailsState();
}

class _TableDetailsState extends State<TableDetails> {
  late TimeTableViewmodel _viewModel;
  TimeTableModel? timeTableModel;

  @override
  void initState() {
    super.initState();
    _viewModel = Provider.of<TimeTableViewmodel>(context, listen: false);
    _viewModel.getTimeTableDetails(
        action: 16,
        mode: 1,
        userId: "01bf7cdc-d30e-4bd2-b965-cc3ce5a34198",
        randomNum: 0.8235991550065647,
        callMethod: 'background');
  }

  Future<void>refres()async{
    _viewModel.getTimeTableDetails(
        action: 16,
        mode: 1,
        userId: "01bf7cdc-d30e-4bd2-b965-cc3ce5a34198",
        randomNum: 0.8235991550065647,
        callMethod: 'background');
  }

  @override
  Widget build(BuildContext context) {

    return widget.day=="mon"? Monday():widget.day=="tuesday"?Tuesday():widget.day=="wednesday"?Wednesday():widget.day=="thursday"?Thursday()
    :widget.day=="friday"?Friday():widget.day=="saturday"?Saturday():widget.day=="sunday"?Sunday():Container();
  }
  Widget Monday(){
    return RefreshIndicator(
      onRefresh: refres,
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.only(top: 10),
          height: MediaQuery.of(context).size.height * 1.5,
          color: Colors.white,
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 1.4,
                child: Consumer<TimeTableViewmodel>(
                  builder: (context, data, child) {
                    return data.timeTableModel != null &&
                        data.timeTableModel!.isNotEmpty
                        ? ListView.builder(
                        itemCount: data.timeTableModel?.length ?? 0,
                        itemBuilder: (context, index) {
                          TimeTableModel model = data.timeTableModel![index];

                          print("mon ${model.subjectName}");
                          return model.day == 1
                              ? Column(
                            children: [
                              Container(
                                width: double.infinity,
                                margin: EdgeInsets.only(
                                    left: 10, right: 10),
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(0),
                                    border:
                                    Border.all(color: Colors.grey)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context)
                                            .size
                                            .width /
                                            3,
                                        child: Text(
                                          ("${model.startTime}-${model.endTime}"),
                                          // data.timeTableModel?.startTime ?? "",
                                          style: TextStyle(
                                              color: Color(0xff000000),
                                              fontFamily: 'Open Sans',
                                              fontSize: 16,
                                              fontWeight:
                                              FontWeight.normal),
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                              width:
                                              MediaQuery.of(context)
                                                  .size
                                                  .width *
                                                  0.50,
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .start,
                                                children: [
                                                  Text(
                                                    model.subjectName ??
                                                        "",
                                                    maxLines: 3,
                                                    overflow:
                                                    TextOverflow
                                                        .ellipsis,
                                                    style: TextStyle(
                                                        color: Color(
                                                            0xff000000),
                                                        fontFamily:
                                                        'Open Sans',
                                                        fontSize: 16,
                                                        fontWeight:
                                                        FontWeight
                                                            .normal),
                                                  ),
                                                ],
                                              )),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            model.subjectCode ?? "",
                                            style: TextStyle(
                                                color:
                                                Color(0xff666666),
                                                fontFamily: 'Open Sans',
                                                fontSize: 16,
                                                fontWeight:
                                                FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              model.timeTableTemplateStatus
                                  .toString() ==
                                  "1"
                                  ? Container(
                                width: double.infinity,
                                margin: EdgeInsets.only(
                                    left: 10, right: 10),
                                color: Color(0xff9E9E9E80),
                                height: MediaQuery.of(context)
                                    .size
                                    .height /
                                    17,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10),
                                  child: Text(
                                    model.timeTableTemplateStatus
                                        .toString() ==
                                        "1"
                                        ? "Break"
                                        : "",
                                    //"BREAK",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color(0xff333333),
                                        fontFamily: 'Open Sans',
                                        fontSize: 18,
                                        fontWeight:
                                        FontWeight.normal),
                                  ),
                                ),
                              )
                                  : Container(),
                            ],
                          )
                              : Container();
                        })
                        : Center(child: CircularProgressIndicator());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget Tuesday(){
    return RefreshIndicator(
      onRefresh: refres,
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.only(top: 10),
          height: MediaQuery.of(context).size.height * 1.5,
          color: Colors.white,
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 1.4,
                child: Consumer<TimeTableViewmodel>(
                  builder: (context, data, child) {
                    return data.timeTableModel != null &&
                        data.timeTableModel!.isNotEmpty
                        ? ListView.builder(
                        itemCount: data.timeTableModel?.length ?? 0,
                        itemBuilder: (context, index) {
                          TimeTableModel model = data.timeTableModel![index];

                          print("mot ${model.subjectName}");
                          return model.day == 2
                              ? Column(
                            children: [
                              Container(
                                width: double.infinity,
                                margin: EdgeInsets.only(
                                    left: 10, right: 10),
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(0),
                                    border:
                                    Border.all(color: Colors.grey)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context)
                                            .size
                                            .width /
                                            3,
                                        child: Text(
                                          ("${model.startTime}-${model.endTime}"),
                                          // data.timeTableModel?.startTime ?? "",
                                          style: TextStyle(
                                              color: Color(0xff000000),
                                              fontFamily: 'Open Sans',
                                              fontSize: 16,
                                              fontWeight:
                                              FontWeight.normal),
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                              width:
                                              MediaQuery.of(context)
                                                  .size
                                                  .width *
                                                  0.50,
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .start,
                                                children: [
                                                  Text(
                                                    model.subjectName ??
                                                        "",
                                                    maxLines: 3,
                                                    overflow:
                                                    TextOverflow
                                                        .ellipsis,
                                                    style: TextStyle(
                                                        color: Color(
                                                            0xff000000),
                                                        fontFamily:
                                                        'Open Sans',
                                                        fontSize: 16,
                                                        fontWeight:
                                                        FontWeight
                                                            .normal),
                                                  ),
                                                ],
                                              )),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            model.subjectCode ?? "",
                                            style: TextStyle(
                                                color:
                                                Color(0xff666666),
                                                fontFamily: 'Open Sans',
                                                fontSize: 16,
                                                fontWeight:
                                                FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              model.timeTableTemplateStatus
                                  .toString() ==
                                  "1"
                                  ? Container(
                                width: double.infinity,
                                margin: EdgeInsets.only(
                                    left: 10, right: 10),
                                color: Color(0xff9E9E9E80),
                                height: MediaQuery.of(context)
                                    .size
                                    .height /
                                    17,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10),
                                  child: Text(
                                    model.timeTableTemplateStatus
                                        .toString() ==
                                        "1"
                                        ? "Break"
                                        : "",
                                    //"BREAK",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color(0xff333333),
                                        fontFamily: 'Open Sans',
                                        fontSize: 18,
                                        fontWeight:
                                        FontWeight.normal),
                                  ),
                                ),
                              )
                                  : Container(),
                            ],
                          )
                              : Container();
                        })
                        : Center(child: CircularProgressIndicator());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget Wednesday(){
    return RefreshIndicator(
      onRefresh: refres,
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.only(top: 10),
          height: MediaQuery.of(context).size.height * 1.5,
          color: Colors.white,
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 1.4,
                child: Consumer<TimeTableViewmodel>(
                  builder: (context, data, child) {
                    return data.timeTableModel != null &&
                        data.timeTableModel!.isNotEmpty
                        ? ListView.builder(
                        itemCount: data.timeTableModel?.length ?? 0,
                        itemBuilder: (context, index) {
                          TimeTableModel model = data.timeTableModel![index];

                          print("mot ${model.subjectName}");
                          return model.day == 3
                              ? Column(
                            children: [
                              Container(
                                width: double.infinity,
                                margin: EdgeInsets.only(
                                    left: 10, right: 10),
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(0),
                                    border:
                                    Border.all(color: Colors.grey)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context)
                                            .size
                                            .width /
                                            3,
                                        child: Text(
                                          ("${model.startTime}-${model.endTime}"),
                                          // data.timeTableModel?.startTime ?? "",
                                          style: TextStyle(
                                              color: Color(0xff000000),
                                              fontFamily: 'Open Sans',
                                              fontSize: 16,
                                              fontWeight:
                                              FontWeight.normal),
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                              width:
                                              MediaQuery.of(context)
                                                  .size
                                                  .width *
                                                  0.50,
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .start,
                                                children: [
                                                  Text(
                                                    model.subjectName ??
                                                        "",
                                                    maxLines: 3,
                                                    overflow:
                                                    TextOverflow
                                                        .ellipsis,
                                                    style: TextStyle(
                                                        color: Color(
                                                            0xff000000),
                                                        fontFamily:
                                                        'Open Sans',
                                                        fontSize: 16,
                                                        fontWeight:
                                                        FontWeight
                                                            .normal),
                                                  ),
                                                ],
                                              )),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            model.subjectCode ?? "",
                                            style: TextStyle(
                                                color:
                                                Color(0xff666666),
                                                fontFamily: 'Open Sans',
                                                fontSize: 16,
                                                fontWeight:
                                                FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              model.timeTableTemplateStatus
                                  .toString() ==
                                  "1"
                                  ? Container(
                                width: double.infinity,
                                margin: EdgeInsets.only(
                                    left: 10, right: 10),
                                color: Color(0xff9E9E9E80),
                                height: MediaQuery.of(context)
                                    .size
                                    .height /
                                    17,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10),
                                  child: Text(
                                    model.timeTableTemplateStatus
                                        .toString() ==
                                        "1"
                                        ? "Break"
                                        : "",
                                    //"BREAK",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color(0xff333333),
                                        fontFamily: 'Open Sans',
                                        fontSize: 18,
                                        fontWeight:
                                        FontWeight.normal),
                                  ),
                                ),
                              )
                                  : Container(),
                            ],
                          )
                              : Container();
                        })
                        : Center(child: CircularProgressIndicator());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }
  Widget Thursday(){
    return RefreshIndicator(
      onRefresh: refres,
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.only(top: 10),
          height: MediaQuery.of(context).size.height * 1.5,
          color: Colors.white,
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 1.4,
                child: Consumer<TimeTableViewmodel>(
                  builder: (context, data, child) {
                    return data.timeTableModel != null &&
                        data.timeTableModel!.isNotEmpty
                        ? ListView.builder(
                        itemCount: data.timeTableModel?.length ?? 0,
                        itemBuilder: (context, index) {
                          TimeTableModel model = data.timeTableModel![index];

                          print("mot ${model.subjectName}");
                          return model.day == 4
                              ? Column(
                            children: [
                              Container(
                                width: double.infinity,
                                margin: EdgeInsets.only(
                                    left: 10, right: 10),
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(0),
                                    border:
                                    Border.all(color: Colors.grey)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context)
                                            .size
                                            .width /
                                            3,
                                        child: Text(
                                          ("${model.startTime}-${model.endTime}"),
                                          // data.timeTableModel?.startTime ?? "",
                                          style: TextStyle(
                                              color: Color(0xff000000),
                                              fontFamily: 'Open Sans',
                                              fontSize: 16,
                                              fontWeight:
                                              FontWeight.normal),
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                              width:
                                              MediaQuery.of(context)
                                                  .size
                                                  .width *
                                                  0.50,
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .start,
                                                children: [
                                                  Text(
                                                    model.subjectName ??
                                                        "",
                                                    maxLines: 3,
                                                    overflow:
                                                    TextOverflow
                                                        .ellipsis,
                                                    style: TextStyle(
                                                        color: Color(
                                                            0xff000000),
                                                        fontFamily:
                                                        'Open Sans',
                                                        fontSize: 16,
                                                        fontWeight:
                                                        FontWeight
                                                            .normal),
                                                  ),
                                                ],
                                              )),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            model.subjectCode ?? "",
                                            style: TextStyle(
                                                color:
                                                Color(0xff666666),
                                                fontFamily: 'Open Sans',
                                                fontSize: 16,
                                                fontWeight:
                                                FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              model.timeTableTemplateStatus
                                  .toString() ==
                                  "1"
                                  ? Container(
                                width: double.infinity,
                                margin: EdgeInsets.only(
                                    left: 10, right: 10),
                                color: Color(0xff9E9E9E80),
                                height: MediaQuery.of(context)
                                    .size
                                    .height /
                                    17,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10),
                                  child: Text(
                                    model.timeTableTemplateStatus
                                        .toString() ==
                                        "1"
                                        ? "Break"
                                        : "",
                                    //"BREAK",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color(0xff333333),
                                        fontFamily: 'Open Sans',
                                        fontSize: 18,
                                        fontWeight:
                                        FontWeight.normal),
                                  ),
                                ),
                              )
                                  : Container(),
                            ],
                          )
                              : Container();
                        })
                        : Center(child: CircularProgressIndicator());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }
  Widget Friday(){
    return RefreshIndicator(
      onRefresh: refres,
      child: Scaffold(
        body:
        Container(
          margin: EdgeInsets.only(top: 10),
          height: MediaQuery.of(context).size.height * 1.5,
          color: Colors.white,
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 1.4,
                child: Consumer<TimeTableViewmodel>(
                  builder: (context, data, child) {
                    return data.timeTableModel != null &&
                        data.timeTableModel!.isNotEmpty
                        ? ListView.builder(
                        itemCount: data.timeTableModel?.length ?? 0,
                        itemBuilder: (context, index) {
                          TimeTableModel model = data.timeTableModel![index];

                          print("mot ${model.subjectName}");
                          return model.day == 5
                              ? Column(
                            children: [
                              Container(
                                width: double.infinity,
                                margin: EdgeInsets.only(
                                    left: 10, right: 10),
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(0),
                                    border:
                                    Border.all(color: Colors.grey)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context)
                                            .size
                                            .width /
                                            3,
                                        child: Text(
                                          ("${model.startTime}-${model.endTime}"),
                                          // data.timeTableModel?.startTime ?? "",
                                          style: TextStyle(
                                              color: Color(0xff000000),
                                              fontFamily: 'Open Sans',
                                              fontSize: 16,
                                              fontWeight:
                                              FontWeight.normal),
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                              width:
                                              MediaQuery.of(context)
                                                  .size
                                                  .width *
                                                  0.50,
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .start,
                                                children: [
                                                  Text(
                                                    model.subjectName ??
                                                        "",
                                                    maxLines: 3,
                                                    overflow:
                                                    TextOverflow
                                                        .ellipsis,
                                                    style: TextStyle(
                                                        color: Color(
                                                            0xff000000),
                                                        fontFamily:
                                                        'Open Sans',
                                                        fontSize: 16,
                                                        fontWeight:
                                                        FontWeight
                                                            .normal),
                                                  ),
                                                ],
                                              )),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            model.subjectCode ?? "",
                                            style: TextStyle(
                                                color:
                                                Color(0xff666666),
                                                fontFamily: 'Open Sans',
                                                fontSize: 16,
                                                fontWeight:
                                                FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              model.timeTableTemplateStatus
                                  .toString() ==
                                  "1"
                                  ? Container(
                                width: double.infinity,
                                margin: EdgeInsets.only(
                                    left: 10, right: 10),
                                color: Color(0xff9E9E9E80),
                                height: MediaQuery.of(context)
                                    .size
                                    .height /
                                    17,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10),
                                  child: Text(
                                    model.timeTableTemplateStatus
                                        .toString() ==
                                        "1"
                                        ? "Break"
                                        : "",
                                    //"BREAK",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color(0xff333333),
                                        fontFamily: 'Open Sans',
                                        fontSize: 18,
                                        fontWeight:
                                        FontWeight.normal),
                                  ),
                                ),
                              )
                                  : Container(),
                            ],
                          )
                              : Container();
                        })
                        : Center(child: CircularProgressIndicator());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }
  Widget Saturday(){
    return Scaffold(
      backgroundColor: Colors.white,
      body:
      Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 380,
              margin: const EdgeInsets.all(19.0),
              // padding: EdgeInsets.only(left: 50, top: 5),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300)),
              child: Center(
                child: Text('NO CLASSES AVAILABLE ',
                    style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff717171),
                        fontWeight: FontWeight.w600)),
              ),
            ),
            CircleAvatar(
              radius: 23,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.refresh,
                color: Color(0xff0091cd),
                size: 30.0,
              ),
            ),
            Text("Refresh",
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xff0091cd),
                )),
          ],
        ),
      ),
    );

  }
  Widget Sunday(){
    return Scaffold(
      backgroundColor: Colors.white,
      body:
      Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 380,
              margin: const EdgeInsets.all(19.0),
              // padding: EdgeInsets.only(left: 50, top: 5),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300)),
              child: Center(
                child: Text('NO CLASSES AVAILABLE ',
                    style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff717171),
                        fontWeight: FontWeight.w600)),
              ),
            ),
            CircleAvatar(
              radius: 23,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.refresh,
                color: Color(0xff0091cd),
                size: 30.0,
              ),
            ),
            Text("Refresh",
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xff0091cd),
                )),
          ],
        ),
      ),
    );

  }



}





