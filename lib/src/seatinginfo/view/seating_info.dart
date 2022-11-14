import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pesu/src/seatinginfo/model/seating_info_model.dart';
import 'package:pesu/utils/view/widget.dart';
import 'package:provider/provider.dart';
import '../../../utils/constants/color_consts.dart';
import '../../../utils/constants/custom_widgets.dart';
import '../../../utils/services/bottom_navigaton_provider.dart';
import '../../../utils/services/date_time.dart';
import '../../dashboard_module/view/dashboard_page.dart';
import '../viewmodel/seating_info_viewmodel.dart';

class SeatingInfo extends StatefulWidget {
  const SeatingInfo({Key? key}) : super(key: key);

  @override
  _SeatingInfoState createState() => _SeatingInfoState();
}

class _SeatingInfoState extends State<SeatingInfo> {
  late SeatingInfoViewModel _viewModel;
  Timestamp? time;


  @override
  void initState() {
    super.initState();
    _viewModel = Provider.of<SeatingInfoViewModel>(context, listen: false);
    _viewModel.getSeatingInfoDetails(
        action: 13,
        mode: 3,
        randomNum: 0.6803998119716814,
        callMethod: 'background');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: sideNavAppBar("Seating Info"),
        backgroundColor: Colors.white.withOpacity(0.9),
        bottomNavigationBar:    Consumer<BottomNavigationProvider>(
          builder: (context, value, child) {
            return BottomNavigationBar(
                currentIndex: value.selectedIndex,
                fixedColor: appThemeColor,
                items:CustomWidgets.getNavBarItems(),
                selectedFontSize: 10,
                unselectedFontSize: 10,
                type: BottomNavigationBarType.fixed,
                onTap: (index) {

                  value.selectBottomIndex(bottomIndex: index);
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => DashboardScreen()));
                }

            );
          },
        ),
        body: Consumer<SeatingInfoViewModel>(builder: (context, data, child) {
          return data.seatingInfoModel != null &&
                  data.seatingInfoModel!.isNotEmpty
              ? Container(
                  margin: EdgeInsets.only(top: 10),
                  child: ListView.builder(
                      itemCount: data.seatingInfoModel?.length ?? 0,
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        SeatingInfoModel model = data.seatingInfoModel![index];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              margin:
                                  EdgeInsets.only(left: 10, right: 10, top: 5),
                              color: headingColor,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 8.0,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Assessment",
                                      style: TextStyle(
                                          fontFamily: 'Open Sans',
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xff008DC9)),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      model.assessmentName ?? "",
                                      style: TextStyle(
                                          fontFamily: 'Open Sans',
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                          color: Color(0xffFFFFFF)),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Block",
                                      style: TextStyle(
                                          fontFamily: 'Open Sans',
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xff008DC9)),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      model.roomName ?? "",
                                      style: TextStyle(
                                          fontFamily: 'Open Sans',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xffFFFFFF)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: 30,
                              color: Colors.blueAccent,
                              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "SUBJECT",
                                    style: TextStyle(
                                        fontFamily: 'Open Sans',
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xffFFFFFF)),
                                  ),
                                  Text(
                                    "DATE & TIME",
                                    style: TextStyle(
                                        fontFamily: 'Open Sans',
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xffFFFFFF)),
                                  ),
                                  Text(
                                    "TERMINAL",
                                    style: TextStyle(
                                        fontFamily: 'Open Sans',
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xffFFFFFF)),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(10, 8, 10, 0),
                              color: Color(0xffFFFFFF),
                              child: ListTileTheme.merge(
                                dense: true,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: data.seatingInfoModel?.length ?? 0,
                                  itemBuilder: (context, index) {
                                    SeatingInfoModel model =
                                        data.seatingInfoModel![index];
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Flexible(
                                                child: Container(
                                                  width: 100,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        model.subjectCode ?? "",
                                                        maxLines: 5,
                                                        textAlign:
                                                            TextAlign.start,
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'Open Sans',
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: Color(
                                                                0xff000000)),
                                                      ),
                                                      Text(
                                                        model.subjectName ?? "",
                                                        maxLines: 5,
                                                        textAlign:
                                                            TextAlign.start,
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'Open Sans',
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: Color(
                                                                0xff8b8b8b)),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 100,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      '${DateTimeUtil.convertDate(model.testStartTime!.toInt())}'
                                                          "",
                                                      maxLines: 5,
                                                      textAlign:

                                                          TextAlign.start,
                                                      style: TextStyle(
                                                          fontFamily:
                                                              'Open Sans',
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: Color(
                                                              0xff333333)),
                                                    ),
                                                    Text(
                                                      ("${DateTimeUtil.converDateIntoTime(model.testStartTime!.toInt())}-${DateTimeUtil.converDateIntoTime(model.testEndTime!.toInt())}") ?? "",
                                                      maxLines: 5,
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: TextStyle(
                                                          fontFamily:
                                                              'Open Sans',
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: Color(
                                                              0xff000000)),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                width: 100,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      model.terminalName ?? "",
                                                      style: TextStyle(
                                                          fontFamily:
                                                              'Open Sans',
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Color(
                                                              0xff000000)),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          thickness: 3,
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                )
              : Center(
            child: CircularProgressIndicator(),
          );
        }));
  }
}
