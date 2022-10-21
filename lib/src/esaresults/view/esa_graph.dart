import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pesu/src/esaresults/model/graph_model.dart';
import 'package:pesu/src/esaresults/viewmodel/graph_viewmodel.dart';
import 'package:pesu/utils/constants/color_consts.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class EsaGraph extends StatefulWidget {
  String subjectCode;

  EsaGraph({required this.subjectCode});

  @override
  _EsaGraphState createState() => _EsaGraphState();
}

class _EsaGraphState extends State<EsaGraph> {
  late GraphViewModel viewModel;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    viewModel = Provider.of<GraphViewModel>(context, listen: false);
    viewModel.getGraphData(
      action: 7,
      mode: 4,
      subjectCode: '${widget.subjectCode}',
      randomNum: 0.19526425584906115,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ESA Graph"),
        titleSpacing: 0,
        backgroundColor: appThemeColor,
      ),
      body: Consumer<GraphViewModel>(builder: (context, model, child) {
        return (model.graphModel != null)
            ? Container(
                padding: EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text("${widget.subjectCode}"
                          " ${model.graphModel?.subjectName}"),
                    ),
                    Card(
                      elevation: 3,
                      child: SfCartesianChart(
                          backgroundColor: Colors.white,
                          primaryXAxis:
                              CategoryAxis(title: AxisTitle(text: 'Grade')),
                          primaryYAxis: NumericAxis(
                            title: AxisTitle(text: 'Marks'),
                          ),
                          isTransposed: true,
                          tooltipBehavior: TooltipBehavior(enable: true),
                          series: <ChartSeries<Data, String>>[
                            BarSeries<Data, String>(
                                dataSource: model.graphModel?.data ?? [],
                                xValueMapper: (Data data, _) => data.grade,
                                yValueMapper: (Data data, _) => data.y,
                                // Enable data label
                                dataLabelSettings: DataLabelSettings(
                                  isVisible: true,
                                ))
                          ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
                      child: Text("Summary",style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          fontFamily:
                          'Open Sans',
                          color: Color(0xff333333)
                      ),),
                    ),
                    Container(
                        height:18,
                        child: ListTileTheme.merge(
                          dense: true,
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: model.graphModel!.data!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text("Your Score :",style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      fontFamily:
                                      'Open Sans',
                                      color: Color(0xff333333)
                                    ),),
                                    Text(model.graphModel?.data?[index].grade
                                            .toString() ??
                                        "-1"),
                                  ],
                                );
                              }),
                        ))
                  ],
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              );
      }),
    );
  }
}
