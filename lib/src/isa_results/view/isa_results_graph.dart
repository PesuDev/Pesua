import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pesu/utils/view/widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class IsaResultGraph extends StatefulWidget {
  const IsaResultGraph({Key? key}) : super(key: key);

  @override
  State<IsaResultGraph> createState() => _IsaResultGraphState();
}

class _IsaResultGraphState extends State<IsaResultGraph> {
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
      appBar: sideNavAppBar("ISA Results graph"),
      body: Container(
        padding: EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text("UE20CS251 - Design and Analysis of Algorithms"),
            ),
            //https://www.digitalocean.com/community/tutorials/flutter-bar-charts GO TO THIS LINK
            // Container(
            //   color: Colors.white,
            //   height: MediaQuery.of(context).size.height * 0.5,
            // ),
            SfCartesianChart(
                backgroundColor: Colors.white,
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
      ),
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
          /*   Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              //Initialize the spark charts widget
              child: SfSparkLineChart.custom(
                //Enable the trackball
                trackball: SparkChartTrackball(
                    activationMode: SparkChartActivationMode.tap),
                //Enable marker
                marker: SparkChartMarker(
                    displayMode: SparkChartMarkerDisplayMode.all),
                //Enable data label
                labelDisplayMode: SparkChartLabelDisplayMode.all,
                xValueMapper: (int index) => data[index].year,
                yValueMapper: (int index) => data[index].sales,
                dataCount: 5,
              ),
            ),
          )*/
        ]));
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
