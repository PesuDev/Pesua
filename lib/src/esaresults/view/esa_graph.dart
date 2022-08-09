import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:pesu/src/esaresults/model/graph_model.dart';
import 'package:pesu/src/esaresults/viewmodel/graph_viewmodel.dart';
import 'package:pesu/utils/constants/color_consts.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../utils/services/app_routes.dart';
import '../viewmodel/Esa_viewmodel.dart';

class EsaGraph extends StatefulWidget {
  EsaGraph({Key? key}) : super(key: key);

  @override
  _EsaGraphState createState() => _EsaGraphState();
}

class _EsaGraphState extends State<EsaGraph> {
  late GraphViewModel viewModel;
  late List<GraphModel> mydata= [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async{
    viewModel = Provider.of<GraphViewModel>(context, listen: false);
    viewModel.getGraphData(
      action: 7,
      mode: 4,
      usn: 'PES1202101943',
      subjectCode: 'UM21MB641A',
      randomNum: 0.19526425584906115,
    );
    // List<GraphModel> permanentData =GraphModel.fromJson as List<GraphModel>;
    // setState(() {
    //   mydata=permanentData;
    //   loading=false;
    //
    // });

  }
 //  List<charts.Series<GraphModel, String>> _mymethod(){
 //    return[
 //      charts.Series<GraphModel,String>(
 //        data: mydata,
 //        id: 'sales',
 //        domainFn: (GraphModel graphmodel,_)=>graphmodel.data!.,
 //
 //      )
 //    ];
 // }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text("ESA Graph"),
          titleSpacing: 0,
          backgroundColor: appThemeColor,
        ),
        body: Consumer<GraphViewModel>(builder: (context, data, child) {
          return data.graphModel != null
              ? Container(
                  margin: EdgeInsets.fromLTRB(15, 8, 15, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("UE12CS087 : Database Management System"),
                      ListTileTheme.merge(
                        dense: true,
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Container(
                                height: MediaQuery.of(context).size.height / 2,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 30),
                                child: Text("hasdgs")
                                // charts.BarChart(
                                //   series,
                                //   animate: true,
                                // ),
                                // SfCartesianChart(
                                //     primaryXAxis: CategoryAxis(),
                                //     primaryYAxis: NumericAxis(minimum: 0, maximum: 40, interval: 10),
                                //     tooltipBehavior: _tooltip,
                                //     series: <ChartSeries<_ChartData, String>>[
                                //       BarSeries<_ChartData, String>(
                                //           dataSource: data,
                                //           xValueMapper: (_ChartData data, _) => data.x,
                                //           yValueMapper: (_ChartData data, _) => data.y,
                                //           name: 'Gold',
                                //           color: Color.fromRGBO(8, 142, 255, 1))
                                //     ])
                              );

                            }),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(15, 3, 15, 0),
                        child: Column(
                          children: [
                            Text("Summary"),
                            Text("Your Grade: B"),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              : Container();
        }));
  }
}
