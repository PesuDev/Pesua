import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:pesu/utils/constants/color_consts.dart';


class EsaGraph extends StatefulWidget {
  EsaGraph({Key? key}) : super(key: key);

  @override
  _EsaGraphState createState() => _EsaGraphState();
}

class _EsaGraphState extends State<EsaGraph> {
  final List<BarChartModel> data = [
    BarChartModel(
      year: "2014",
      financial: 250,
      color: charts.ColorUtil.fromDartColor(Colors.blueGrey),
    ),
    BarChartModel(
      year: "2015",
      financial: 300,
      color: charts.ColorUtil.fromDartColor(Colors.red),
    ),
    BarChartModel(
      year: "2016",
      financial: 100,
      color: charts.ColorUtil.fromDartColor(Colors.green),
    ),
    BarChartModel(
      year: "2017",
      financial: 450,
      color: charts.ColorUtil.fromDartColor(Colors.yellow),
    ),
    BarChartModel(
      year: "2018",
      financial: 630,
      color: charts.ColorUtil.fromDartColor(Colors.lightBlueAccent),
    ),
    BarChartModel(
      year: "2019",
      financial: 950,
      color: charts.ColorUtil.fromDartColor(Colors.pink),
    ),
    BarChartModel(
      year: "2020",
      financial: 400,
      color: charts.ColorUtil.fromDartColor(Colors.purple),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    List<charts.Series<BarChartModel, String>> series = [
      charts.Series(
        id: "financial",
        data: data,
        domainFn: (BarChartModel series, _) => series.year,
        measureFn: (BarChartModel series, _) => series.financial,
        colorFn: (BarChartModel series, _) => series.color,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title:  Text("ESA Graph"),
        titleSpacing: 0,
        backgroundColor: appThemeColor,
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(15, 8, 15, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("UE12CS087 : Database Management System"),
            Container(
              height: MediaQuery.of(context).size.height/2,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
              child:
                  charts.BarChart(
                    series,
                    animate: true,
                  ),

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
      ),

    );
  }
}
class BarChartModel {
  final String year;
  int financial;
  final charts.Color color;
  
  BarChartModel({required this.year, required this.financial,required this.color});
}
