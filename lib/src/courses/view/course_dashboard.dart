import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pesu/src/courses/view/individual_sub_Screen.dart';
import 'package:pesu/utils/services/app_routes.dart';
import 'package:pesu/utils/view/widget.dart';

class CourseDashboard extends StatefulWidget {
  const CourseDashboard({Key? key}) : super(key: key);

  @override
  _CourseDashboardState createState() => _CourseDashboardState();
}

class _CourseDashboardState extends State<CourseDashboard> {
  final GlobalKey _menuKey = GlobalKey();
  bool isSemSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: sideNavAppBar("My Courses"),
      body: Container(
        padding: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 3),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                print("set $isSemSelected");
                isSemSelected = true;
                print("reset $isSemSelected");
                _semBottomSheet();
              },
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(2, 2),
                        blurRadius: 8,
                        color: (isSemSelected == true)
                            ? Colors.blue
                            : Colors.white)
                  ],
                  border: Border.all(
                      color: (isSemSelected == true)
                          ? Colors.blueAccent
                          : Colors.grey),
                  borderRadius: BorderRadius.circular(2),
                ),
                child: Container(
                  color: Colors.white,
                  padding:
                      EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "SEM 3",
                        style: TextStyle(fontSize: 18),
                      ),
                      Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height * 0.7,
              padding: EdgeInsets.only(top: 8, bottom: 8),
              child: ListView.builder(itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      height: 100,
                      child: Card(
                        elevation:5,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10,bottom: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  padding: EdgeInsets.only(top: 5),
                                  width: 40,
                                  child: Icon(Icons.ac_unit)),
                              Container(
                                padding: EdgeInsets.only(left: 10),
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("UE20CS251"),
                                        PopupMenuButton(
                                          child: Icon(Icons.more_vert),
                                          itemBuilder: (context) {
                                            return List.generate(1, (index) {
                                              return PopupMenuItem(
                                                padding: EdgeInsets.only(
                                                    top: 0, bottom: 0, right: 0, left: 0),
                                                child: InkWell(
                                                  onTap: () {
                                                    Navigator.pushNamed(
                                                        context, AppRoutes.individualSub);
                                                  },
                                                  child: Container(
                                                    padding: EdgeInsets.only(
                                                        top: 20,
                                                        bottom: 20,
                                                        right: 10,
                                                        left: 15),
                                                    child: Text(
                                                      'View Details',
                                                      style: TextStyle(fontSize: 14),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                    Text("Design and analysis of algorithms"),
                                    Divider(
                                      color: Colors.grey,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            children: <TextSpan>[
                                              TextSpan(
                                                  text: 'Type:',
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.normal,
                                                      fontSize: 14,
                                                      color: Colors.grey)),
                                              TextSpan(
                                                  text: ' CC',
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 14,
                                                      color: Colors.blueGrey)),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 50),
                                          child: RichText(
                                            text: TextSpan(
                                              children: <TextSpan>[
                                                TextSpan(
                                                    text: 'Credits:',
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.normal,
                                                        fontSize: 14,
                                                        color: Colors.grey)),
                                                TextSpan(
                                                    text: ' 4',
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 14,
                                                        color: Colors.blueGrey)),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                  ],
                );
              }),
            )
          ],
        ),
      ),
    );
  }

  void _semBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return new Container(
            color: Color(0xFF737373),
            //could change this to Color(0xFF737373),
            //so you don't have to change MaterialApp canvasColor
            child: new Container(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                decoration: new BoxDecoration(
                    color: Colors.black45,
                    borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(30.0),
                        topRight: const Radius.circular(30.0))),
                child: Column(
                  children: [
                    new Text(
                      "SEM 3",
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                    Divider(
                      color: Colors.white,
                      indent: 12.0,
                      endIndent: 12.0,
                    ),
                    new Text(
                      "SEM 4",
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                  ],
                )),
          );
        });
  }
}
