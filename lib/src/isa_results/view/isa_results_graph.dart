import 'dart:developer';
import 'dart:ffi';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pesu/src/isa_results/model/isaGraphModel.dart';
import 'package:pesu/src/isa_results/model/isa_dropdown_model.dart';
import 'package:pesu/src/isa_results/model/isa_graph_formatter.dart';

import 'package:pesu/src/isa_results/viewmodel/isaViewModel.dart';
import 'package:pesu/utils/view/widget.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class IsaResultGraph extends StatefulWidget {
 int? subjectId;
 String? classBatchSectionId;
 int? iSAMarksMasterId;
 int? batchClassId;
  String subjectCode;
  String subjectName;
  IsaResultGraph({required this.subjectCode,
    this.subjectId,required this.subjectName, required this.classBatchSectionId,required this.batchClassId,required this.iSAMarksMasterId});


  @override
  State<IsaResultGraph> createState() => _IsaResultGraphState();
}

class _IsaResultGraphState extends State<IsaResultGraph> {


  late IsaViewModel? isaViewModel;



  @override
  void initState() {
    var passid=("${widget.batchClassId}-${widget.classBatchSectionId}-${widget.iSAMarksMasterId}");
    print("mypass${passid}");

    super.initState();
    isaViewModel = Provider.of<IsaViewModel>(context, listen: false);
    isaViewModel?.getIsaGraphDetails(
        action: 6,
        mode: 8,
        subjectId: widget.subjectId,
        fetchId: passid,
        subjectCode: widget.subjectCode,
        subjectName: widget.subjectName,
        randomNum: 0.5177486893384107);
    // isaViewModel?.getIsaResultDetails(
    //     action: 6,
    //     mode: 10,
    //     batchClassId: 1400,
    //     classBatchSectionId: 4164,
    //     fetchId: "1400-4164",
    //     randomNum: 0.4054309131337863);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: sideNavAppBar("ISA Results graph"),
      body: Consumer<IsaViewModel>(builder: (context, model, child) {

        if(model.isaGraphFormatterModel !=null){

// ISAGraphFormatterModel dataVal=ISAGraphFormatterModel();
print("Graph status>>>>  ${model.isaGraphFormatterModel?.last.y}");
          // List<GraphISA> graphData = [
          //   GraphISA(x: "76-88",
          //       colorCode: Color(0xffEBB47A),
          //       y: model.isaGraphModel!.gRAPHSTATUS!.map((e) => e.i7688Rgba1221822356).toString()),
          //
          //   GraphISA(x: "88-100",
          //       colorCode: Color(0xff057d10),
          //       y: model.isaGraphModel!.gRAPHSTATUS!.map((e) => e.i88100Rgba512516).toString())
          // ];
          // log("Data $graphData");
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
          series: <ChartSeries<ISAGraphFormatterModel, String>>[
            BarSeries<ISAGraphFormatterModel, String>(
                dataSource:model.isaGraphFormatterModel!.toList()??[],
                xValueMapper: (ISAGraphFormatterModel graph, _) =>graph.x,
                yValueMapper:  (ISAGraphFormatterModel graph, _) =>int.parse(graph.y.toString()),
                name: 'Sales',
                pointColorMapper:(ISAGraphFormatterModel graph, _)=>graph.color ,
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
        }
      else{
        return Container(child: Text("hh"),);
        }
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


class GraphISA {
  GraphISA({required this.colorCode,required this.x,required this.y});

  final String x;
  final String y;
  final Color colorCode;

}
