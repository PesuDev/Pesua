import 'dart:developer';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:pesu/src/esaresults/model/previous_sem_graph.dart';
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
var graphType=0;
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
    _viewModel.getESADataForGraph(
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
  String? selectedItem = "Sem-1";
  int? selectedBatch;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<EsaViewModel>(builder: (context, data, child) {

        return data.lengthData!>=0 &&
               data.lengthData4 !>=0

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
          data.esaGraphModeData !=null?           graphType==0?       graphUi( data.esaGraphModeData):graphType==1?graphUiForCgpa(data.esaGraphModeData):graphType==2?
                            graphUiForSgpa(data.esaGraphModeData):graphUi(data.esaGraphModeData)
                        :CircularProgressIndicator()    ,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton.icon(
                                  onPressed: (){
                                    setState(() {
                                      if(graphType==1){
                                        graphType=0;
                                      }
                                      else {
                                        graphType = 1;
                                      }

                                    });
                                  },
                                  icon: Icon(Icons.bar_chart,
                                  color: graphType==0 || graphType==1? Colors.blueAccent:Colors.grey,
                                  ),
                                  label: Text("CGPA",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff666666),
                                      fontFamily: 'Open Sans',
                                  ),
                                ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                TextButton.icon(
                                  onPressed: (){
                                    setState(() {
                                      if(graphType==2){
                                        graphType=0;
                                      }
                                      else {
                                        graphType = 2;
                                      }

                                    });
                                  },
                                  icon:  Icon(Icons.bar_chart,

                                  color: graphType==0 || graphType==2? Colors.orangeAccent:Colors.grey,
                                  ),
                                  label: Text("SGPA",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff666666),
                                      fontFamily: 'Open Sans',
                                  ),
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
                                    }
                                    );
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
                                    _viewModel.getESADataForGraph(
                                      randomNum: 0.9575638746600124,
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
            :Center(
              child: data.esaModel2!=null && data.esaModel2!.studentSemesterWise!.isEmpty && data.esaModel2!.studentCGPAWISE!.isEmpty && data.esaModel4!=null && data.esaModel4!.rESULTS!.isEmpty && data.esaModel4!.cGPASEMESTERWISE!.isEmpty?Text("No Data Available",
          style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20
          ),
        ):CircularProgressIndicator(),
            );
      }),
    );
  }

  Widget graphUi( esaGraphModel? dataGraph){
    return Container(

      height: MediaQuery.of(context).size.height/2.5,
      child: Card(
        elevation: 3,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
          child: LineChart(

                 LineChartData(
                     titlesData: FlTitlesData(
                         topTitles:AxisTitles.lerp(AxisTitles(axisNameSize: 14,
                             axisNameWidget: Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Text("Semester"),
                             )
                         ),AxisTitles(axisNameSize: 14,
                             axisNameWidget: Text("Semester")
                         ),6) ,
                         rightTitles: AxisTitles.lerp(AxisTitles(axisNameSize: 14,
                             axisNameWidget: Text("GPA")
                         ),AxisTitles(axisNameSize: 14,
                             axisNameWidget: Text("GPA")
                         ),6)
                     ),
lineBarsData: [
  LineChartBarData(
    isCurved: false,
               color: Colors.blueAccent,

               dotData: FlDotData(show: true),
               spots: dataGraph!.studentSemester!.map((points)=>FlSpot(double.parse(points.classessId.toString()),
                   double.parse(points.cGPA !=null ?points.cGPA.toString():"0"))).toList()

  ),
  LineChartBarData(
               isCurved: false,
               color: Colors.orange,
               dotData: FlDotData(show: true),
               spots: dataGraph!.studentSemester!.map((points)=>FlSpot(double.parse(points.classessId.toString()), double.parse(points.sGPA !=null ?points.sGPA.toString():"0"))).toList()

  ),

]
                 ),
                 swapAnimationDuration: Duration(seconds: 1),
               ),
        ),
      ),

    );
  }

  Widget graphUiForCgpa( esaGraphModel? dataGraph){
    return Container(
      height: MediaQuery.of(context).size.height/2.5,
      child: Card(
        elevation: 3,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
          child: LineChart(

            LineChartData(
                titlesData: FlTitlesData(
                    topTitles:AxisTitles.lerp(AxisTitles(axisNameSize: 14,
                        axisNameWidget: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Semester"),
                        )
                    ),AxisTitles(axisNameSize: 14,
                        axisNameWidget: Text("Semester")
                    ),6) ,
                    rightTitles: AxisTitles.lerp(AxisTitles(axisNameSize: 14,
                        axisNameWidget: Text("GPA")
                    ),AxisTitles(axisNameSize: 14,
                        axisNameWidget: Text("GPA")
                    ),6)
                ),
                   lineBarsData: [
                     LineChartBarData(
                         isCurved: false,
                         color: Colors.blueAccent,
                         dotData: FlDotData(show: true),
                         spots: dataGraph!.studentSemester!.map((points)=>FlSpot(double.parse(points.classessId.toString()),

                             double.parse(points.cGPA !=null ?points.cGPA.toString():"0"))).toList()

                     ),


                   ]
               ),
               swapAnimationDuration: Duration(seconds: 1),
             ),
        ),
      ),

    );
  }

  Widget graphUiForSgpa( esaGraphModel? dataGraph){
    return Container(
      height: MediaQuery.of(context).size.height/2.5,
      child: Card(
        elevation: 3,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
          child: LineChart(

            LineChartData(
                titlesData: FlTitlesData(
                    topTitles:AxisTitles.lerp(AxisTitles(axisNameSize: 14,
                        axisNameWidget: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Semester"),
                        )
                    ),AxisTitles(axisNameSize: 14,
                        axisNameWidget: Text("Semester")
                    ),6) ,
                    rightTitles: AxisTitles.lerp(AxisTitles(axisNameSize: 14,
                        axisNameWidget: Text("GPA")
                    ),AxisTitles(axisNameSize: 14,
                        axisNameWidget: Text("GPA")
                    ),6)
                ),

                      lineBarsData: [

                        LineChartBarData(
                            isCurved: false,
                            color: Colors.orange,
                            dotData: FlDotData(show: true),
                            spots: dataGraph!.studentSemester!.map((points)=>FlSpot(double.parse(points.classessId.toString()),

                                double.parse(points.sGPA !=null ?points.sGPA.toString():"0"))).toList()

                        ),

                      ]
                  ),
                  swapAnimationDuration: Duration(seconds: 1),
                ),
        ),
      ),
    );
  }
}
