import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SeatingInfo extends StatefulWidget {
  const SeatingInfo({Key? key}) : super(key: key);

  @override
  _SeatingInfoState createState() => _SeatingInfoState();
}

class _SeatingInfoState extends State<SeatingInfo> {
  late TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Seating Info"),
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: ListView.builder(
            itemCount: 1,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 3, 10, 0),
                    child: Container(
                      color: Colors.amberAccent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Assesment"),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "ISA1 - May 2022 -CBT 1 -First year -Sem 2",
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text("Block"),
                          SizedBox(
                            height: 5,
                          ),
                          Text("Main 200A"),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.blueAccent,
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Subject"),
                        Text("DATE & TIME"),
                        Text("TERMINAL"),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),

                    color: Color(0xffFFFFFF),
                    child: ListTileTheme.merge(
                      dense: true,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 2,
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Flexible(
                                      child: Container(
                                        width: 100,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("UE21EC141B",maxLines: 5,textAlign: TextAlign.start,),
                                            Text("Compiler design",maxLines: 5,textAlign: TextAlign.start,),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 100,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("UE21EC141B",maxLines: 5,textAlign: TextAlign.start,),
                                          Text("physics labs and computational works stideis",maxLines: 5,textAlign: TextAlign.start,),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 100,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text("4"),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                thickness: 3,
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
