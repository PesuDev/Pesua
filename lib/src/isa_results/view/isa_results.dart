import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pesu/utils/view/widget.dart';

class ISAResults extends StatefulWidget {
  const ISAResults({Key? key}) : super(key: key);

  @override
  State<ISAResults> createState() => _ISAResultsState();
}

class _ISAResultsState extends State<ISAResults> {
  bool isSemSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: sideNavAppBar("ISA Results"),
      body: Container(
        padding: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            assignment()
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

  Widget assignment() {
    return Container(
      padding: EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.centerLeft,
            color: Colors.blue,
            padding: EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8),
            child: RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                      text: 'UE20CS251',
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                          color: Colors.white60)),
                  TextSpan(
                      text: '- Design and Analysis of Algorithm ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white)),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 3, top: 7),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width / 1.7,
                    padding: EdgeInsets.only(right: 5),
                    child: Text(
                      'Assignment',
                      textAlign: TextAlign.left,
                    )),
                Container(
                    width: MediaQuery.of(context).size.width / 6.2,
                    child: Text("A", textAlign: TextAlign.left)),
                Container(
                    width: MediaQuery.of(context).size.width / 6.2,
                    child: Icon(
                      Icons.waterfall_chart_outlined,
                    ))
              ],
            ),
          ),
          Divider(
            color: Colors.grey,
            thickness: 1.0,
          ),
        ],
      ),
    );
  }
}
