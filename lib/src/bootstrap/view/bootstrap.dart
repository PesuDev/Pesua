import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pesu/utils/view/widget.dart';

class BootStrap extends StatefulWidget {
  const BootStrap({Key? key}) : super(key: key);

  @override
  State<BootStrap> createState() => _BootStrapState();
}

class _BootStrapState extends State<BootStrap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: sideNavAppBar("BootStrap"),
      backgroundColor:Colors.white.withOpacity(0.9),
      body: Container(
        margin: EdgeInsets.fromLTRB(15, 10, 15, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: 30,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 3),
                    child: Text("Your Group: GREEN", style: TextStyle(
                        fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w600,
                        color: Color(0xffFFFFFF)
                    ),))),
            Container(
              height: 30,
              margin: EdgeInsets.fromLTRB(15, 5, 15, 0),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(2)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("DATE", style: TextStyle(
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w600,
                            color: Color(0xffFFFFFF)
                        ),),
                        Text("ACTIVITY", style: TextStyle(
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w600,
                            color: Color(0xffFFFFFF)
                        ),),
                        Text("SUBGROUP", style: TextStyle(
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w600,
                            color: Color(0xffFFFFFF)
                        ),),
                      ],
                    ),
                  ),
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
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: 100,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("UE21EC141B",maxLines: 5,textAlign: TextAlign.start, style: TextStyle(
                                        fontFamily: 'Open Sans',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: Color(0xff000000)
                                    ),),
                                  ],
                                ),
                              ),
                              Container(
                                width: 100,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("UE21EC141B",maxLines: 5,textAlign: TextAlign.start, style: TextStyle(
                                        fontFamily: 'Open Sans',
                                        fontSize: 14,
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
                                    Text("4", style: TextStyle(
                                        fontFamily: 'Open Sans',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff000000)
                                    ),),
                                  ],
                                ),
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
            ),
          ],
        ),
      ),
    );
  }
}
