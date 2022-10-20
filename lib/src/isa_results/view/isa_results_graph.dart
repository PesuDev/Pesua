import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pesu/src/isa_results/model/isaGraphModel.dart';
import 'package:pesu/src/isa_results/model/isa_dropdown_model.dart';
import 'package:pesu/src/isa_results/viewmodel/isaViewModel.dart';
import 'package:pesu/utils/view/widget.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class IsaResultGraph extends StatefulWidget {
 int? subjectId;

  String subjectCode;
  String subjectName;
  IsaResultGraph({required this.subjectCode,
    this.subjectId,required this.subjectName});

  @override
  State<IsaResultGraph> createState() => _IsaResultGraphState();
}

class _IsaResultGraphState extends State<IsaResultGraph> {
  late IsaViewModel? isaViewModel;
  List<_SalesData> data = [
    _SalesData('Jan', 35),
    _SalesData('Feb', 28),
    _SalesData('Mar', 34),
    _SalesData('Apr', 32),
    _SalesData('May', 40)
  ];

  @override
  void initState() {
    super.initState();
    isaViewModel = Provider.of<IsaViewModel>(context, listen: false);
    isaViewModel?.getIsaGraphDetails(
        action: 6,
        mode: 8,
        subjectId: widget.subjectId,
        fetchId:"1400-4164",
        subjectCode: widget.subjectCode,
        subjectName: widget.subjectName,
        randomNum: 0.5177486893384107);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: sideNavAppBar("ISA Results graph"),
      body: Consumer<IsaViewModel>(builder: (context, model, child) {
        return Container(
          padding: EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text("${widget.subjectCode} - ${widget.subjectName}"),
              ),
              //https://www.digitalocean.com/community/tutorials/flutter-bar-charts GO TO THIS LINK
              /*   Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height * 0.5,
              ),*/
              SfCartesianChart(
                  backgroundColor: Colors.white,
                  primaryXAxis:
                      CategoryAxis(title: AxisTitle(text: 'Students')),
                  primaryYAxis: NumericAxis(
                    title: AxisTitle(text: 'Marks'),
                  ),
                  isTransposed: true,
                  tooltipBehavior: TooltipBehavior(enable: true),
                  series: <ChartSeries<Data, int>>[
                    BarSeries<Data, int>(
                        dataSource: model.isaGraphModel?.data ?? [],
                        xValueMapper: (Data isaGraph, _) => isaGraph.x,
                        yValueMapper: (Data isaGraph, _) => isaGraph.y,
                        name: 'Sales',
                        // Enable data label
                        dataLabelSettings: DataLabelSettings(isVisible: true))
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

/*class _ChartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: _MyHomePage(),
    );
  }
}*/

class MyHomePage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<_SalesData> data = [
    _SalesData('Jan', 35),
    _SalesData('Feb', 28),
    _SalesData('Mar', 34),
    _SalesData('Apr', 32),
    _SalesData('May', 40)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Syncfusion Flutter chart'),
        ),
        body: Column(children: [
          //Initialize the chart widget
          SfCartesianChart(
              primaryXAxis: CategoryAxis(title: AxisTitle(text: 'Students')),
              primaryYAxis: NumericAxis(
                title: AxisTitle(text: 'Marks'),
              ),
              // Chart title

              // title: ChartTitle(text: 'Half yearly sales analysis'),
              // Enable legend
              // legend: Legend(isVisible: true),
              // Enable tooltip
              isTransposed: true,
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <ChartSeries<_SalesData, String>>[
                BarSeries<_SalesData, String>(
                    dataSource: data,
                    xValueMapper: (_SalesData sales, _) => sales.year,
                    yValueMapper: (_SalesData sales, _) => sales.sales,
                    name: 'Sales',
                    // Enable data label
                    dataLabelSettings: DataLabelSettings(isVisible: true))
              ]),
        ]));
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
