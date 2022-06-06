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
        title: Text("Seating Info",style: TextStyle(
            fontFamily: 'Open Sans',
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Color(0xffFFFFFF)
        ),),
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: ListView.builder(
            itemCount: 2,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 3, 10, 0),
                    child: Container(
                      color: Colors.cyan,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Assesment",style: TextStyle(
                              fontFamily: 'Open Sans',
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffFFFFFF)
                          ),),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "ISA1 - May 2022 -CBT 1 -First year -Sem 2",style: TextStyle(
                              fontFamily: 'Open Sans',
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffFFFFFF)
                          ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text("Block",style: TextStyle(
                              fontFamily: 'Open Sans',
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffFFFFFF)
                          ),),
                          SizedBox(
                            height: 5,
                          ),
                          Text("Main 200A",style: TextStyle(
                              fontFamily: 'Open Sans',
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffFFFFFF)
                          ),),
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
                        Text("Subject",style: TextStyle(
                            fontFamily: 'Open Sans',
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffFFFFFF)
                        ),),
                        Text("DATE & TIME",style: TextStyle(
                            fontFamily: 'Open Sans',
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffFFFFFF)
                        ),),
                        Text("TERMINAL",style: TextStyle(
                            fontFamily: 'Open Sans',
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffFFFFFF)
                        ),),
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
                                            Text("UE21EC141B",maxLines: 5,textAlign: TextAlign.start,style: TextStyle(
                                                fontFamily: 'Open Sans',
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xff000000)
                                            ),),
                                            Text("Compiler design",maxLines: 5,textAlign: TextAlign.start,style: TextStyle(
                                                fontFamily: 'Open Sans',
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xff666666)
                                            ),),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 100,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("11/May/2022",maxLines: 5,textAlign: TextAlign.start,style: TextStyle(
                                              fontFamily: 'Open Sans',
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xff000000)
                                          ),),
                                          Text("09:00 AM - 12:00 PM ",maxLines: 5,textAlign: TextAlign.start,style: TextStyle(
                                              fontFamily: 'Open Sans',
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xff000000)
                                          ),),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 100,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text("4",style: TextStyle(
                                              fontFamily: 'Open Sans',
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xff000000)
                                          ),),
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
