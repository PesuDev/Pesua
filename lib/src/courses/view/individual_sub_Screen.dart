import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pesu/src/courses/view/course_dashboard.dart';
import 'package:pesu/src/courses/view/individual_unit_screen.dart';
import 'package:pesu/utils/view/widget.dart';

class IndividualSubScreen extends StatefulWidget {
  const IndividualSubScreen({Key? key}) : super(key: key);

  @override
  State<IndividualSubScreen> createState() => _IndividualSubScreenState();
}

class _IndividualSubScreenState extends State<IndividualSubScreen>
    with SingleTickerProviderStateMixin {
  late final _tabController =
      TabController(length: 4, initialIndex: 0, vsync: this);
  bool expand = false;
  @override
  void initState() {}
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Subject"),
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            isScrollable: true,
            controller: _tabController,
            tabs: [
              Tab(
                child: Text("Content"),
              ),
              Tab(
                child: Text("Objectives"),
              ),
              Tab(
                child: Text("Outcomes"),
              ),
              Tab(
                child: Text("References"),
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            Container(
              padding: EdgeInsets.only(top: 8, left: 8, right: 8),
              child: content(),
            ),
            Container(
              padding: EdgeInsets.only(top: 8, left: 8, right: 8),
              child: objectives(),
            ),
            Container(
                padding: EdgeInsets.only(top: 8, left: 8, right: 8),
                child: outcomes()),
            Container(
                padding: EdgeInsets.only(top: 8, left: 8, right: 8),
                child: references()),
          ],
        ),
      ),
    );
  }

  Widget? content() {
    return ListView.separated(
        itemBuilder: (context, i) {
          return Column(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      print("jjjjjj $expand");
                      expand = true;
                      print("jjjjjj $expand");
                    },
                    child: Container(
                        color: Colors.blue,
                        width: MediaQuery.of(context).size.width * 0.1,
                        child: Icon(Icons.add)),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => IndividualUnitScreen()),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 10),
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Unit 1"),
                          Icon(Icons.arrow_forward_ios)
                        ],
                      ),
                    ),
                  )
                ],
              ),
              (expand == true)
                  ? Container(
                      height: 100,
                      color: Colors.blueGrey,
                    )
                  : Container(),
            ],
          );
          /*Column(
            children: [
              ExpansionTile(
                childrenPadding: EdgeInsets.zero,
                backgroundColor: Colors.blueGrey,
                title: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CourseDashboard()),
                    );
                  },
                  child: Container(
                    color: Colors.blueGrey,
                    padding: EdgeInsets.only(
                      top: 8,
                      bottom: 8,
                      left: 5,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Unit $i"),
                        Icon(Icons.arrow_forward_ios)
                      ],
                    ),
                  ),
                ),
                leading: Container(
                  child: Icon(
                    Icons.add,
                  ),
                ),
                trailing: const SizedBox(
                  width: 0,
                ),
                */ /* trailing: Container(
                  color: Colors.blueGrey,
                  padding:
                      EdgeInsets.only(top: 8, bottom: 8, left: 0, right: 8),
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CourseDashboard()),
                        );
                      },
                      child: Icon(Icons.arrow_forward_ios)),
                ),*/ /*
                children: [
                  ListTile(
                    title: Text("Helooo"),
                  )
                ],
              )
            ],
          );*/
        },
        separatorBuilder: (context, i) {
          return Divider();
        },
        itemCount: 5);
  }

  Widget? objectives() {
    return ListView.builder(
        itemCount: 5,
        itemBuilder: (context, int i) {
          return Row(
            children: [
              Icon(Icons.ac_unit_outlined),
              Container(
                width: MediaQuery.of(context).size.width * 0.85,
                padding: EdgeInsets.only(left: 5, top: 5),
                child: Text(
                    "The Flutter TabBar and TabController classes give us convenient APIs that we can use to navigate between tabs, either interactively or programmatically."),
              ),
            ],
          );
        });
  }

  Widget? outcomes() {
    return ListView.builder(
        itemCount: 15,
        itemBuilder: (context, int i) {
          return Row(
            children: [
              Icon(Icons.ac_unit_outlined),
              Container(
                width: MediaQuery.of(context).size.width * 0.85,
                padding: EdgeInsets.only(left: 5, top: 5),
                child: Text(
                    "The Flutter TabBar and TabController classes give us convenient APIs that we can use to navigate between tabs, either interactively or programmatically."),
              ),
            ],
          );
        });
  }

  Widget? references() {
    return Container(
        child: ListView.separated(
            itemBuilder: (context, int i) {
              return Row(
                children: [
                  Icon(
                    Icons.ac_unit_outlined,
                    size: 100,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    padding: EdgeInsets.only(left: 10, top: 5),
                    child: Text(
                        "The Flutter TabBar and TabController classes give us convenient APIs that we can use to navigate between tabs, either interactively or programmatically."),
                  ),
                ],
              );
            },
            separatorBuilder: (context, i) {
              return Divider();
            },
            itemCount: 12));
  }
}
