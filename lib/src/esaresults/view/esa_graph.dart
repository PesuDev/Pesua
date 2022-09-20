import 'dart:async';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:pesu/src/esaresults/model/graph_model.dart';
import 'package:pesu/src/esaresults/viewmodel/graph_viewmodel.dart';
import 'package:pesu/utils/constants/color_consts.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class EsaGraph extends StatefulWidget {
  EsaGraph({Key? key}) : super(key: key);

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
      subjectCode: 'UM21MB641A',
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
        return Container(
          padding: EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text("UE20CS251 - ${model.graphModel?.subjectName}"),
              ),
              SfCartesianChart(
                  backgroundColor: Colors.white,
                  primaryXAxis: CategoryAxis(title: AxisTitle(text: 'Grade')),
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
                        name: 'Grade - d Marks -1',
                        // Enable data label
                        dataLabelSettings: DataLabelSettings(
                          isVisible: true,
                        ))
                  ]),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
                child: Text("Summary"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    children: [Text("Your Score"), Text("-1")],
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Column(
                    children: [Text("Average"), Text("24")],
                  )
                ],
              )
            ],
          ),
        );
      }),
    );
  }
}
