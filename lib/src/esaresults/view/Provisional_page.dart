import 'package:flutter/material.dart';
import 'package:pesu/utils/services/app_routes.dart';

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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                decoration: BoxDecoration(
                  color: Colors.cyan[100],
                  border: Border.all(
                    color: Color(0xffFFFFFF),
                    width: 8,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'SRN:',
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 15,
                                        fontFamily: 'Open Sans',
                                        color: Color(0xff9B9B9B))),
                                TextSpan(
                                    text: 'PES1234556g',
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 16,
                                        fontFamily: 'Open Sans',
                                        color: Color(0xff000000))),
                              ],
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'SRN:',
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 15,
                                        color: Color(0xff9B9B9B))),
                                TextSpan(
                                    text: 'PES1234556g',
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 16,
                                        color: Color(0xff000000))),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "Sem 1",
                        style: TextStyle(
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                            color: Color(0xff9B9B9B)),
                      ),
                      Divider(
                        thickness: 3,
                      ),
                      Text(
                        "Provisional Results of B.Tech - All: 1st Semester(Assesment-Aug.to Dec.2022",
                        style: TextStyle(
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                            color: Color(0xff666666)),
                      ),
                      Divider(
                        thickness: 3,
                      ),
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'SRN:',
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 15,
                                        color: Color(0xff9B9B9B))),
                                TextSpan(
                                    text: 'PES1234556g',
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 16,
                                        color: Color(0xff000000))),
                              ],
                            ),
                          ),
                          Spacer(),
                          RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'SRN:',
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 15,
                                        color: Color(0xff9B9B9B))),
                                TextSpan(
                                    text: 'PES1234556g',
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 16,
                                        color: Color(0xff000000))),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // SizedBox(
              //   height: 10,
              // ),
              Container(
                margin: EdgeInsets.fromLTRB(15, 5, 15, 0),
                color: Color(0xffFFFFFF),
                child: Column(
                  children: [
                    ListTileTheme.merge(
                      dense: true,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 2,
                        itemBuilder: (context, index) {
                          return Container(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: 'PES1234556g -',
                                            style: TextStyle(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 14,
                                                color: Color(0xff9B9B9B))),
                                        TextSpan(
                                            text:
                                                'Python for Computational Problem Solving',
                                            style: TextStyle(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 16,
                                                color: Color(0xff000000))),
                                      ],
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            "Grade",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                              color: Color(0xff666666),

                                              fontFamily: 'Open Sans',
                                            ),
                                          ),
                                          Text(
                                            "A",
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff000000),
                                              fontFamily: 'Open Sans',
                                            ),
                                          ),
                                        ],
                                      ),
                                      TextButton.icon(
                                        onPressed:   () {
                                          Navigator.pushNamed(context, AppRoutes.esaGraph);
                                        },
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
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(15, 10, 15, 25),
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
