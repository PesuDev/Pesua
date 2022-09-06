import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:developer';
import '../model/esa_model.dart';
import '../viewmodel/Esa_viewmodel.dart';

class PreviousSem extends StatefulWidget {
  const PreviousSem({Key? key}) : super(key: key);

  @override
  _PreviousSemState createState() => _PreviousSemState();
}

class _PreviousSemState extends State<PreviousSem> {
  late EsaViewModel _viewModel;
  var batch;

  Future<void> _submittedRefreshList() async {
    _viewModel.getSubjectData(
      action: 7,
      mode: 7,
      BatchClassId: 744,
      //selectedBatch,
      //  _viewModel.esaModel2?.studentSemesterWise?[0].batchClassId,
      ClassBatchSectionId: 2,
      ClassessId: 2,
      UserId: '08f61824-1338-46c8-81b2-1a73c3060c09',
      usn: 'PES1UG19EC199',
      ClassName: selectedItem.toString(),
      isFinalised: 1,
      randomNum: 0.2195043762231128,
    );
  }

  @override
  void initState() {
    super.initState();
    _viewModel = Provider.of<EsaViewModel>(context, listen: false);
    _viewModel.getESAData(
      action: 7,
      mode: 6,
      userId: 'PES1201900924',
      randomNum: 0.9575638746600124,
    );
    _viewModel.getSubjectData(
      action: 7,
      mode: 7,
      BatchClassId: 744,
      //selectedBatch,
      //  _viewModel.esaModel4?.cGPASEMESTERWISE?[0].batchClassId,
      ClassBatchSectionId: 2,
      ClassessId: 2,
      UserId: '08f61824-1338-46c8-81b2-1a73c3060c09',
      usn: 'PES1UG19EC199',
      ClassName: selectedItem.toString(),
      isFinalised: 1,
      randomNum: 0.2195043762231128,
    );
  }

  List<SalesData> data1 = [
    SalesData('Jan', 400),
    SalesData('FEB', 43),
    SalesData('MAR', 134),
    SalesData('APR', 314),
    SalesData('MAY', 341),
  ];

  String? selectedItem = "Sem-1";
  int? selectedBatch;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _submittedRefreshList,
      child: Scaffold(
        body: Consumer<EsaViewModel>(builder: (context, data, child) {
          return data.esaModel2 != null &&
                  data.esaModel2!.studentCGPAWISE!.isNotEmpty &&
                  data.esaModel4 != null &&
                  data.esaModel4!.rESULTS!.isNotEmpty ? SafeArea(
                  child: SingleChildScrollView(
                    child: Column(children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(15, 10, 15, 0),
                        decoration: BoxDecoration(
                          color: Color(0xffFFFFFF),
                          border: Border.all(
                            color: Color(0xffFFFFFF),
                            width: 8,
                          ),
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "Earned Credits",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff000000),
                                    fontFamily: 'Open Sans',
                                  ),
                                ),
                                Text(
                                  ("${data.esaModel2?.studentCGPAWISE?[0].earnedCredits.toString()}/${data.esaModel2?.studentCGPAWISE?[0].credits.toString()}") ??
                                      "116/116",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: Color(0xff666666),
                                    fontFamily: 'Open Sans',
                                  ),
                                ),
                              ],
                            ),
                            const VerticalDivider(
                              width: 20,
                              thickness: 8,
                              indent: 20,
                              endIndent: 0,
                              color: Colors.black,
                            ),
                            Column(
                              children: [
                                Text(
                                  "Current CGPA",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff000000),
                                    fontFamily: 'Open Sans',
                                  ),
                                ),
                                Text(
                                  data.esaModel2?.studentCGPAWISE?[0].cGPA
                                          .toString() ??
                                      "116/116",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: Color(0xff666666),
                                    fontFamily: 'Open Sans',
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // Container(
                      //   padding: const EdgeInsets.all(10),
                      //   width: double.infinity,
                      //   height: 200,
                      //   child: LineChart(
                      //     LineChartData(
                      //       borderData: FlBorderData(show: false),
                      //       lineBarsData: [
                      //         LineChartBarData(
                      //           spots: dummyData2,
                      //           isCurved: true,
                      //           barWidth: 3,
                      //           colors: [
                      //             Colors.orange,
                      //           ],
                      //         ),
                      //         // The blue line
                      //         LineChartBarData(
                      //           spots: dummyData3,
                      //           isCurved: false,
                      //           barWidth: 3,
                      //           colors: [
                      //             Colors.blue,
                      //           ],
                      //         )
                      //       ],
                      //     ),
                      //   ),
                      // ),

                      Container(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(15, 15, 15, 10),
                          child: Column(
                            // mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SfCartesianChart(
                                  primaryXAxis: CategoryAxis(),
                                  title:
                                      ChartTitle(text: "Students Marks Graph"),
                                  // legend: Legend(isVisible: true),
                                  tooltipBehavior:
                                      TooltipBehavior(enable: true),
                                  series: <ChartSeries>[
                                    LineSeries<StudentCGPAWISE, dynamic>(
                                      dataSource: data.esaModel2?.studentCGPAWISE ?? [],
                                      xValueMapper: (StudentCGPAWISE sales, _) =>
                                          int.tryParse(sales.cGPA.toString()),
                                      yValueMapper: (StudentCGPAWISE sales, _) =>
                                          int.tryParse(sales.credits.toString()),
                                         dataLabelSettings: DataLabelSettings(isVisible: true),
                                    )
                                  ]),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton.icon(
                                    onPressed: null,
                                    icon: const Icon(Icons.bar_chart),
                                    label: Text(""),
                                  ),
                                  Text("CGPA",style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff666666),
                                    fontFamily: 'Open Sans',
                                  ),),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  TextButton.icon(
                                    onPressed: null,
                                    icon: const Icon(Icons.bar_chart),
                                    label: Text(""),
                                  ),
                                  Text(
                                    "SGPA",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff666666),
                                      fontFamily: 'Open Sans',
                                    ),
                                  ),

                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(15, 20, 15, 0),
                        decoration: BoxDecoration(
                          // color: const Color(0xff7c94b6),
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 8),
                          child: DropdownButtonFormField<String>(
                              value: data
                                  .esaModel2?.studentSemesterWise?[0].className,
                              items: data.items
                                  .map((item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(item),
                                      ))
                                  .toList(),
                              onChanged: (item) {
                                setState(() {
                                  selectedItem = item;
                                  selectedBatch = data.esaModel4
                                      ?.cGPASEMESTERWISE?[0].batchClassId;
                                });
                                //setState(() => selectedItem = item,batch=data.esaModel2?.studentSemesterWise?[0].batchClassId.toString());
                                // log("SEMMMMM${selectedItem}");
                                // log("MMMM${selectedBatch}");
                                _submittedRefreshList();
                              }),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(15, 10, 15, 0),
                        child: ListTileTheme.merge(
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount:
                                  data.esaModel4?.cGPASEMESTERWISE?.length,
                              itemBuilder: (context, index) {
                                return Column(children: [
                                  Container(
                                    color: Colors.cyan[400],
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            data
                                                    .esaModel4
                                                    ?.cGPASEMESTERWISE?[index]
                                                    .description ??
                                                "",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xff000000),
                                              fontFamily: 'Open Sans',
                                            ),
                                          ),
                                        ),
                                        Divider(
                                          thickness: 3,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Text(
                                                "SGPA:",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color(0xff000000),
                                                  fontFamily: 'Open Sans',
                                                ),
                                              ),
                                              Text(
                                                (data
                                                        .esaModel4
                                                        ?.cGPASEMESTERWISE?[
                                                            index]
                                                        .sGPA
                                                        .toString() ??
                                                    ""),
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xff000000),
                                                  fontFamily: 'Open Sans',
                                                ),
                                              ),
                                              Spacer(),
                                              Text(
                                                "Credits :",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color(0xff000000),
                                                  fontFamily: 'Open Sans',
                                                ),
                                              ),
                                              Text(
                                                ("${data.esaModel4?.cGPASEMESTERWISE?[index].earnedCredits.toString()}/${data.esaModel4?.cGPASEMESTERWISE?[0].credits.toString()}") ??
                                                    "SGPA",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xff000000),
                                                  fontFamily: 'Open Sans',
                                                ),
                                              ),
                                              Spacer(),
                                              Text(
                                                "CGPA :",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color(0xff000000),
                                                  fontFamily: 'Open Sans',
                                                ),
                                              ),
                                              Text(
                                                (data
                                                        .esaModel4
                                                        ?.cGPASEMESTERWISE?[0]
                                                        .cGPA
                                                        .toString() ??
                                                    ""),
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color(0xff000000),
                                                  fontFamily: 'Open Sans',
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                      // height: 120,
                                      color: Colors.white,
                                      child: ListTileTheme.merge(
                                          child: ListView.builder(
                                              shrinkWrap: true,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              itemCount: data
                                                  .esaModel4?.rESULTS?.length,
                                              itemBuilder: (context, index) {
                                                return Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(
                                                        "${data.esaModel4?.rESULTS?[index].subjectCode ?? ""} : ${data.esaModel4?.rESULTS?[index].subjectName ?? ""}",
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 20),
                                                      child: Row(
                                                        children: [
                                                          Column(
                                                            children: [
                                                              Text("Credits"),
                                                              Text(
                                                                ("${data.esaModel4?.rESULTS?[index].earnedCredit.toString()}/${data.esaModel4?.rESULTS?[index].credits.toString()}") ??
                                                                    "SGPA",
                                                              ),
                                                            ],
                                                          ),
                                                          Spacer(),
                                                          Column(
                                                            children: [
                                                              Text("Grade"),
                                                              Text(data
                                                                      .esaModel4
                                                                      ?.rESULTS?[
                                                                          index]
                                                                      .grade ??
                                                                  "data"),
                                                            ],
                                                          ),
                                                          Spacer(),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    right: 20),
                                                            child:    TextButton.icon(
                                                              onPressed: null,
                                                              icon: const Icon(Icons.bar_chart),
                                                              label: Text(""),
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
                                              }))),
                                  SizedBox(
                                    height: 15,
                                  ),
                                ]);
                              }),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(15, 10, 15, 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "*TAL-To be announced later",
                              style: TextStyle(
                                  color: Color(0xff000000),
                                  fontFamily: 'Open Sans',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14),
                            ),
                            Text(
                              "*NMS-Not Meeting Standars.The student must get in touch with the controller of Examinations",
                              style: TextStyle(
                                  color: Color(0xff000000),
                                  fontFamily: 'Open Sans',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14),
                            )
                          ],
                        ),
                      )
                    ]),
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        }),
      ),
    );
  }
}

class SalesData {
  final String month;
  final double sales;

  SalesData(this.month, this.sales);
}
