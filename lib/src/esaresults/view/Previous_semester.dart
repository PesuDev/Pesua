import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PreviousSem extends StatefulWidget {
  const PreviousSem({Key? key}) : super(key: key);

  @override
  _PreviousSemState createState() => _PreviousSemState();
}

class _PreviousSemState extends State<PreviousSem> {
  List<SalesData> data = [
    SalesData('Jan', 34),
    SalesData('FEB', 43),
    SalesData('MAR', 134),
    SalesData('APR', 314),
    SalesData('MAY', 341),
  ];
  List<String> items = ['Sem-1','Sem-2','Sem-3','Sem-4'];
  String? selectedItem = 'Sem-1';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xffFFFFFF),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(15, 10, 15, 0),
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
                      Text("Earned Credits"),
                      Text("116/116"),
                    ],
                  ),
                    const VerticalDivider(
                      width: 20,
                      thickness: 8,
                      indent: 20,
                      endIndent: 0,
                      color: Colors.black,
                    ),
                    Column(
                      children: [
                        Text("Earned Credits"),
                        Text("116/116"),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 10),
                  child: Column(
                    // mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SfCartesianChart(
                          primaryXAxis: CategoryAxis(),
                          title: ChartTitle(text: "Students Marks Graph"),
                          legend: Legend(isVisible: true),
                          tooltipBehavior: TooltipBehavior(enable: true),
                          series: <ChartSeries<SalesData, String>>[
                            LineSeries <SalesData, String>(
                                dataSource: data,
                                xValueMapper: (SalesData sales, _) => sales.month,
                                yValueMapper: (SalesData sales, _) => sales.sales,
                             //   dataLabelSettings: DataLabelSettings(isVisible: true)
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
                          Text("CGPA"),
                          SizedBox(
                            width: 20,
                          ),
                          TextButton.icon(
                            onPressed: null,
                            icon: const Icon(Icons.bar_chart),
                            label: Text(""),
                          ),
                          Text("CGPA")
                        ],
                      )
                    ],
                  ),
                ),
              ),
Container(
  margin: EdgeInsets.fromLTRB(15, 20, 15, 0),
  decoration: BoxDecoration(
    // color: const Color(0xff7c94b6),
    border: Border.all(
        color: Colors.grey,
        width: 1,
    ),
    borderRadius: BorderRadius.circular(5),
  ),
  child: Padding(
    padding: EdgeInsets.only(left: 8),
    child: DropdownButtonFormField<String>(
        value: selectedItem,
          items: items.map((item) => DropdownMenuItem<String>(
            value: item,
              child: Text(item,style: TextStyle(fontFamily: 'Nunito')),)
          ).toList(),
        onChanged: (item) => setState(() => selectedItem= item),

    ),
  ),
),
              SizedBox(
                height: 5,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(15, 10, 15, 0),
                color: Colors.cyanAccent,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Dec 2021"),
                      Divider(
                        thickness: 3,
                      ),
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text("Grade"),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Text("Grade"),
                            ],
                          ),
                          Text("Grade"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(15, 20, 15, 0),
                color: Color(0xffFFFFFF),
                child: Column(
                  children: [
                    ListTileTheme.merge(
                      dense: true,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 15,
                        itemBuilder: (context, index) {
                          return Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "PES1234556g-Python Problem Solving",
                                  maxLines: 1,
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: [
                                        Text("Grade"),
                                        Text("A"),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text("Grade"),
                                        Text("A"),
                                      ],
                                    ),
                                    TextButton.icon(
                                      onPressed: null,
                                      icon: const Icon(Icons.bar_chart),
                                      label: Text(""),
                                    ),
                                  ],
                                ),
                                Divider(
                                  thickness: 3,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(15, 10, 15, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("*TAL-To be announced later"),
                          Text(
                              "*NMS-Not Meeting Standars.The student must get in touch with the controller of Examinations")
                        ],
                      ),
                    )
                  ],
                ),
              )
        ]
          ),
        ),
      ),
    );
  }
}

class SalesData {
  final String month;
  final double sales;

  SalesData(this.month, this.sales);
}