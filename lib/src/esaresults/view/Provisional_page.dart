import 'package:flutter/material.dart';

class ProvisionalPage extends StatefulWidget {
  const ProvisionalPage({Key? key}) : super(key: key);

  @override
  _ProvisionalPageState createState() => _ProvisionalPageState();
}

class _ProvisionalPageState extends State<ProvisionalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       // backgroundColor: Color(0xffFFFFFF),
      body: SafeArea(
        child:
        SingleChildScrollView(
          child: Column(
            children: [
              Container(

                margin: EdgeInsets.fromLTRB(15, 10, 15, 0),
                decoration: BoxDecoration(
                  color: Colors.cyanAccent,
                  border: Border.all(
                    color: Color(0xffFFFFFF),
                    width: 8,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "SRN:PES1234556g",
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          "SRN:PES1234556g",
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    Text("Sem 1"),
                    Divider(
                      thickness: 3,
                    ),
                    Text(
                        "Provisional Results of B.Tech - All: 1st Semester(Assesment-Aug.to Dec.2022"),
                    Divider(
                      thickness: 3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("SRN:PES1234556g"),
                        Text("SRN:PES1234556g"),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height/1.6,
                margin: EdgeInsets.fromLTRB(15, 20, 15, 0),
                color: Color(0xffFFFFFF),
                child: Column(
                  children: [
                    ListTileTheme.merge(
                      dense: true,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "PES1234556g - Python for Computational Problem Solving",
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
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
