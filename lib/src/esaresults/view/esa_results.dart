import 'package:flutter/material.dart';

import 'Previous_semester.dart';
import 'Provisional_page.dart';

class ESAResults extends StatefulWidget {
  const ESAResults({Key? key}) : super(key: key);

  @override
  _ESAResultsState createState() => _ESAResultsState();
}

class _ESAResultsState extends State<ESAResults> {
  late TabController tabController;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              title: Text("ESA Results"),
            ),
            body: Column(children: [
              Padding(
                  padding: const EdgeInsets.only(top: 28.0),
                  child: Container(
                    color: Colors.cyan,
                    width: double.infinity,
                    margin: EdgeInsets.only(left: 15, right: 15),

                    child: TabBar(
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorPadding: EdgeInsets.all(20),

                      tabs: [
                        Tab(
                          child: Container(
                            child: Text(
                              "Provisional",
                              style: TextStyle(
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.w400,
                              ),
                              maxLines: 1,
                            ),
                          ),
                        ),
                        Tab(
                          child: Container(
                            child: Text(
                              "PreviousSemesters",
                              style: TextStyle(
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.w400,
                              ),
                              maxLines: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),

              Container(
                height: MediaQuery.of(context).size.height/1.29,
                child: TabBarView(
                  children: [
                    ProvisionalPage(),
                    PreviousSem(),
                  ],
                )
              ),
            ])));
  }
}