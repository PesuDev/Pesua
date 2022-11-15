import 'dart:async';
import 'dart:developer';
import 'dart:ffi';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pesu/src/isa_results/model/isaGraphModel.dart';
import 'package:pesu/src/isa_results/model/isa_dropdown_model.dart';
import 'package:pesu/src/isa_results/model/isa_graph_formatter.dart';

import 'package:pesu/src/isa_results/viewmodel/isaViewModel.dart';
import 'package:pesu/utils/view/widget.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import '../../../utils/constants/cheking_network.dart';

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
  bool _connectionStatus = true;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;



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



  @override
  void initState() {
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
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
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return _connectionStatus == true
        ?      Scaffold(
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
      model.isaGraphFormatterModel !=null?
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
          ]):CircularProgressIndicator(),


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
        return Center(child: Container(child: CircularProgressIndicator(),));
        }
      }),
    ):WillPopScope(onWillPop: () {return exit(0);
    }, child: NoNetworkWidget());
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
