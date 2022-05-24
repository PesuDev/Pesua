import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoutesCampus extends StatefulWidget {
  const RoutesCampus({Key? key}) : super(key: key);

  @override
  State<RoutesCampus> createState() => _RoutesCampusState();
}
//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
class _RoutesCampusState extends State<RoutesCampus> {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10,top: 10,right: 10,bottom: 10),
child: SingleChildScrollView(
  child:   Column(
  mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
          Text(
        "ROUTES",
        style: TextStyle(
          fontSize: 20,
          color: Colors.red,
        ),
      ),
      SizedBox(height: 10,),
      Divider(
        height: 1,
      ),
      SizedBox(height: 10,),
  ListTileTheme.merge(
    child: ListTileTheme.merge(
      dense: false,
      child: ListView.builder(
        physics:NeverScrollableScrollPhysics(),
      itemCount: 10,
      shrinkWrap: true,
      itemBuilder: (context,index){

      return ExpansionTile(title: Text("ROUTES 'A' : SEATING 40"),
    childrenPadding: EdgeInsets.only(left: 10),
      tilePadding: EdgeInsets.only(left: 0),
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text("CHARGES: Rs.2000 per annum"),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Driver: Shiva"),
            Container(

              child: TextButton.icon(onPressed: (){}, icon: Icon(Icons.phone), label: Text("+918867741487")),
            ),

          ],
        ),
        Table(
          defaultVerticalAlignment:TableCellVerticalAlignment.middle,
            border: TableBorder(
              //horizontalInside: BorderSide(width: 3, color: Colors.blue, style: BorderStyle.solid),
          //    verticalInside: BorderSide(style: BorderStyle.solid,width: 3, color: Colors.blue,),
              bottom: BorderSide(style: BorderStyle.solid,width: 2, color: Colors.blue,),
              left: BorderSide(style: BorderStyle.solid,width: 2, color: Colors.blue,),
              right: BorderSide(style: BorderStyle.solid,width: 2, color: Colors.blue,),
            ),

          children: [
            TableRow(

    decoration: BoxDecoration(
      color: Colors.blueAccent,
      border: Border.all(color: Colors.blueAccent),
    ),
           children: [
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Text(
                   'BOARDING POINT',
                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white)
               ),
             ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Text(
                   'TIMINGS',
                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white)
               ),
             )
           ]

            ),
            TableRow( children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTileTheme.merge(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount:14,
                      itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Javatpoint'),
                      );
                    },

                    ),
                  ),

                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTileTheme.merge(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount:14,
                      itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Javatpoint'),
                      );
                    },

                    ),
                  ),
                ],
              ),




            ]),


          ],
        ),
        // DataTable(
        //     columns: [
        //
        //   DataColumn(
        //
        //       label: Text(
        //       'BOARDING POINT',
        //       style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white)
        //   )),
        //   DataColumn(label: Text(
        //       'TIMINGS',
        //       style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white)
        //   )),
        // ], rows: [
        //
        //   DataRow(cells: [
        //
        //     DataCell(Text('1')),
        //     DataCell(Text('Stephen')),
        //
        //   ]),
        //
        // ])
      ],

      );
    }),
    ),
  ),

    ],
  ),
),
    );
  }
}
