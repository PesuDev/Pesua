import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
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

  //
  // Future<void> _submittedRefreshList() async {
  //   _viewModel.getSubjectData(
  //     action: 7,
  //     mode: 7,
  //     BatchClassId: 61,
  //     // BatchClassId: _viewModel.esaModel2?.studentSemesterWise?[0].batchClassId ?? 0,
  //     //selectedBatch,
  //     //  _viewModel.esaModel2?.studentSemesterWise?[0].batchClassId,
  //     ClassBatchSectionId: 2,
  //     ClassessId: 2,
  //     ClassName: selectedItem.toString(),
  //     isFinalised: 1,
  //     randomNum: 0.2195043762231128,
  //   );
  // }

  @override
  void initState() {
    super.initState();
    _viewModel = Provider.of<EsaViewModel>(context, listen: false);
    _viewModel.getESAData(
      action: 7,
      mode: 6,
      // userId : 'PES1201700290',
      randomNum: 0.9575638746600124,
    );
    _viewModel.getSubjectData(
      action: 7,
      mode: 7,
      BatchClassId: 61,
      //_viewModel.esaModel2?.studentSemesterWise?[index].batchClassId ?? 0,
      //selectedBatch,
      //  _viewModel.esaModel4?.cGPASEMESTERWISE?[0].batchClassId,
      ClassBatchSectionId: 2,
      ClassessId: 2,
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
    return Scaffold(
      body: Consumer<EsaViewModel>(builder: (context, data, child) {
        return data.esaModel2 != null &&
                data.esaModel2!.studentCGPAWISE!.isNotEmpty &&
                data.esaModel4 != null &&
                data.esaModel4!.rESULTS!.isNotEmpty

            ? SafeArea(
                child: SingleChildScrollView(
                  child: Column(children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 2, 0, 0),
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
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff9B9B9B),
                                  fontFamily: 'Open Sans',
                                ),
                              ),
                              Text(
                                ("${data.esaModel2?.studentCGPAWISE?[0].earnedCredits.toString()}/${data.esaModel2?.studentCGPAWISE?[0].credits.toString()}") ??
                                    "116/116",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff333333),
                                  fontFamily: 'Open Sans',
                                ),
                              ),
                            ],
                          ),
                          // const VerticalDivider(
                          //   width: 20,
                          //   thickness: 8,
                          //   indent: 20,
                          //   endIndent: 0,
                          //   color: Colors.red,
                          // ),
                          Column(
                            children: [
                              Text(
                                "Current CGPA",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff9B9B9B),
                                  fontFamily: 'Open Sans',
                                ),
                              ),
                              Text(
                                data.esaModel2?.studentCGPAWISE?[0].cGPA
                                        .toString() ??
                                    "116/116",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff000000),
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
                        padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
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
                                    dataSource:
                                        data.esaModel2?.studentCGPAWISE ?? [],
                                    xValueMapper: (StudentCGPAWISE sales,
                                            _) =>
                                        int.tryParse(sales.cGPA.toString()),
                                    yValueMapper:
                                        (StudentCGPAWISE sales, _) =>
                                            int.tryParse(
                                                sales.credits.toString()),
                                    dataLabelSettings:
                                        DataLabelSettings(isVisible: true,

                                        ),
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
                                Text(
                                  "CGPA",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff666666),
                                    fontFamily: 'Open Sans',
                                  ),
                                ),
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
                      margin: EdgeInsets.fromLTRB(5, 10, 5, 0),
                      decoration: BoxDecoration(
                        // color: const Color(0xff7c94b6),
                        border: Border.all(
                          color: Colors.grey,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: ListView.builder(
                          itemCount:
                          data.esaModel2?.studentCGPAWISE?.length ?? 0,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(left: 8),
                              child: DropdownButtonFormField<String>(
                                  value: data
                                      .esaModel2?.studentSemesterWise?[0].className.toString(),
                                  items: data.items
                                      .map((item) =>
                                      DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(item),

                                      ))
                                      .toList(),
                                  onChanged: (item) async {
                                    var batchId;
                                    var classesId;

                                    setState(() {
                                      selectedItem = item;
                                      for (var subjectData in data.esaModel2!
                                          .studentSemesterWise!) {
                                        if (subjectData.className == item) {
                                          batchId = subjectData.batchClassId;
                                          classesId = subjectData.classessId;
                                        }
                                      }
                                    });
                                    print("batchId${batchId}");
                                    print("classesId${classesId}");

                                    await _viewModel.dynamicGetSubjectData(
                                        action: 7,
                                        mode: 7,
                                        BatchClassId: batchId,
                                        ClassBatchSectionId: 2,
                                        ClassessId: classesId,
                                        ClassName: selectedItem.toString(),
                                        isFinalised: 1,
                                        randomNum: 0.2195043762231128,
                                       );
                                    // log("SEMMMMM${selectedItem}");
                                    // log("MMMM${selectedBatch}");
                                  }),
                            );
                          },
                        shrinkWrap: true,
                          )
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      color: Color(0xffFFFFFF),
                      margin: EdgeInsets.only(top:10),
                      child: ListTileTheme.merge(
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount:
                                data.esaModel4?.cGPASEMESTERWISE?.length,
                            itemBuilder: (context, index) {
                              return Column(children: [
                                Container(
                                  color: Colors.cyan[100],
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
                                            fontWeight: FontWeight.w400,
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
                                                fontSize: 15,
                                                fontWeight: FontWeight.normal,
                                                color: Color(0xff9B9B9B),
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
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xff9B9B9B),
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
                                                fontSize: 15,
                                                fontWeight: FontWeight.normal,
                                                color: Color(0xff9B9B9B),
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
                                                fontWeight: FontWeight.w400,
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
                                                  Row(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets.only(left:
                                                                8.0,top: 8,bottom: 8),
                                                        child: Text(
                                                          "${data.esaModel4?.rESULTS?[index].subjectCode ?? ""} ",style: TextStyle(
                                                          fontSize: 16,
                                                          color: Color(0xff9B9B9B),
                                                          fontWeight: FontWeight.w300,
                                                          overflow: TextOverflow.ellipsis,

                                                        ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Text(
                                                          "- ${data.esaModel4?.rESULTS?[index].subjectName ?? ""}",style: TextStyle(
                                                          fontSize: 16,
                                                          color: Color(0xff333333),
                                                          fontWeight: FontWeight.w400,
                                                          overflow: TextOverflow.ellipsis,

                                                        ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),

                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 20),
                                                    child: Row(
                                                      children: [
                                                        Column(
                                                          children: [
                                                            Text("Credits",style: TextStyle(
                                                                fontWeight: FontWeight.w300,
                                                                fontSize: 16,
                                                                color: Color(0xff9B9B9B)
                                                            ),),
                                                            Text(
                                                              ("${data.esaModel4?.rESULTS?[index].earnedCredit.toString()}/${data.esaModel4?.rESULTS?[index].credits.toString()}") ??
                                                                  "SGPA",style: TextStyle(
                                                              fontWeight: FontWeight.w400,
                                                              fontSize: 16,
                                                              color: Color(0xff333333)
                                                            ),
                                                            ),
                                                          ],
                                                        ),
                                                        Spacer(),
                                                        Column(
                                                          children: [
                                                            Text("Grade",style: TextStyle(
                                                                fontWeight: FontWeight.w300,
                                                                fontSize: 16,
                                                                color: Color(0xff9B9B9B)
                                                            ),),
                                                            Text(data
                                                                    .esaModel4
                                                                    ?.rESULTS?[
                                                                        index]
                                                                    .grade ??
                                                                "data",style: TextStyle(
                                                                fontWeight: FontWeight.w400,
                                                                fontSize: 16,
                                                                color: Color(0xff000000)
                                                            ),),
                                                          ],
                                                        ),
                                                        Spacer(),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  right: 20),
                                                          child:
                                                              TextButton.icon(
                                                            onPressed: null,
                                                            icon: const Icon(
                                                                Icons
                                                                    .bar_chart),
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
                                fontWeight: FontWeight.w700,
                                fontSize: 14),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Disclaimer:",
                                style: TextStyle(
                                    color: Color(0xffff0000),
                                    fontFamily: 'Open Sans',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14),
                              ),
                              Flexible(
                                child: Text(
                                  "In case of any discrepancies please contact Controller of Examination,PES University",
                                  style: TextStyle(
                                      color: Color(0xff666666),
                                      fontFamily: 'Open Sans',
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14),
                                ),
                              ),
                            ],
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
    );
  }
}

class SalesData {
  final String month;
  final double sales;

  SalesData(this.month, this.sales);
}
