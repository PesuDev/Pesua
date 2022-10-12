import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pesu/src/esaresults/model/esa_model.dart';
import 'package:pesu/utils/services/app_routes.dart';
import 'package:provider/provider.dart';

import '../../../utils/constants/color_consts.dart';
import '../../../utils/view/widget.dart';
import '../../attendance/model/attendance_arguments.dart';
import '../viewmodel/Esa_viewmodel.dart';

class ProvisionalPage extends StatefulWidget {
  const ProvisionalPage({Key? key}) : super(key: key);

  @override
  _ProvisionalPageState createState() => _ProvisionalPageState();
}

class _ProvisionalPageState extends State<ProvisionalPage> {
  late EsaViewModel _viewModel;

  ESAModel1 fetchdata = ESAModel1();

  @override
  void initState() {
    super.initState();
    _viewModel = Provider.of<EsaViewModel>(context, listen: false);
    _viewModel.getESAResults(
      action: 7,
      mode: 3,
      randomNum: 0.8630615362836671,
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            Container(
              child: Consumer<EsaViewModel>(builder: (context, data, child) {
                return data.esaModel1 != null &&
                        data.esaModel1!.results!.isNotEmpty
                    ? Container(
                        // margin: EdgeInsets.only(top: 10),
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: data.esaModel1?.results?.length ?? 0,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              // ESAModel1 model = data.esaModel1;
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Container(
                                    color:Colors.cyan[100],
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              RichText(
                                                text: TextSpan(
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                        text: 'SRN:',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            fontSize: 15,
                                                            fontFamily:
                                                                'Open Sans',
                                                            color: Color(
                                                                0xff9B9B9B))),
                                                    TextSpan(
                                                        text: data
                                                                .esaModel1
                                                                ?.results?[
                                                                    index]
                                                                .srn ??
                                                            '',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            fontSize: 16,
                                                            fontFamily:
                                                                'Open Sans',
                                                            color: Color(
                                                                0xff000000))),
                                                  ],
                                                ),
                                              ),
                                              RichText(
                                                text: TextSpan(
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                        text: 'PRN:',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            fontSize: 15,
                                                            color: Color(
                                                                0xff9B9B9B))),
                                                    TextSpan(
                                                        text: data
                                                                .esaModel1
                                                                ?.results?[
                                                                    index]
                                                                .subjectCode ??
                                                            '',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400,
                                                            fontSize: 16,
                                                            color: Color(
                                                                0xff9B9B9B))),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 6.0),
                                            child: Text(
                                              data.esaModel1?.results?[index]
                                                      .semester ??
                                                  '',
                                              style: TextStyle(
                                                  fontFamily: 'Open Sans',
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 15,
                                                  color: Color(0xff333333)),
                                            ),
                                          ),
                                          Divider(
                                            thickness: 3,
                                          ),
                                          Text(
                                            data.esaModel1?.results?[index]
                                                    .info ??
                                                '',
                                            style: TextStyle(
                                                fontFamily: 'Open Sans',
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
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
                                                        text: 'SGPA:',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            fontSize: 15,
                                                            color: Color(
                                                                0xff9B9B9B))),
                                                    TextSpan(
                                                        text: 'PES1234556g',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400,
                                                            fontSize: 16,
                                                            color: Color(
                                                                0xff000000))),
                                                  ],
                                                ),
                                              ),
                                              Spacer(),
                                              RichText(
                                                text: TextSpan(
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                        text: 'Credits:',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            fontSize: 15,
                                                            color: Color(
                                                                0xff9B9B9B))),
                                                    TextSpan(
                                                        text: data
                                                                .esaModel1
                                                                ?.results?[
                                                                    index]
                                                                .grade ??
                                                            '',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400,
                                                            fontSize: 16,
                                                            color: Color(
                                                                0xff000000))),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    // margin: EdgeInsets.fromLTRB(15, 5, 15, 0),
                                    color: Color(0xffFFFFFF),
                                    child: Column(
                                      children: [
                                        ListTileTheme.merge(
                                          dense: true,
                                          child: ListView.builder(
                                            shrinkWrap: true,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemCount:
                                                data.esaModel1!.results!.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              // ESAModel1 model = data.esaModel1![index];

                                              return Container(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      RichText(
                                                        text: TextSpan(
                                                          children: <TextSpan>[
                                                            TextSpan(
                                                                text: data
                                                                        .esaModel1
                                                                        ?.results?[
                                                                            index]
                                                                        .subjectCode ??
                                                                    '',
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontSize:
                                                                        14,
                                                                    color: Color(
                                                                        0xff9B9B9B))),
                                                            TextSpan(
                                                                text:
                                                                    '-',
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                    fontSize:
                                                                    14,
                                                                    color: Color(
                                                                        0xff9B9B9B))),
                                                            TextSpan(
                                                                text: data
                                                                        .esaModel1
                                                                        ?.results?[
                                                                            index]
                                                                        .subjectName ??
                                                                    'Python for Computational Problem Solving',
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontSize:
                                                                        16,
                                                                    color: Color(
                                                                        0xff000000))),
                                                          ],
                                                        ),
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          Column(
                                                            children: [
                                                              Text(
                                                                "Grade",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  color: Color(
                                                                      0xff9B9B9B),
                                                                  fontFamily:
                                                                      'Open Sans',
                                                                ),
                                                              ),
                                                              Text(
                                                                data
                                                                        .esaModel1
                                                                        ?.results?[
                                                                            index]
                                                                        .grade ??
                                                                    "A",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color: Color(
                                                                      0xff000000),
                                                                  fontFamily:
                                                                      'Open Sans',
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          TextButton.icon(
                                                            onPressed: () {
                                                              Navigator.pushNamed(
                                                                  context,
                                                                  AppRoutes
                                                                      .esaGraph,arguments: DetailedArguments(subjectCode:  data
                                                                  .esaModel1
                                                                  ?.results?[
                                                              index]
                                                                  .subjectCode));
                                                            },
                                                            icon: const Icon(
                                                                Icons
                                                                    .bar_chart),
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
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20,)
                                ],
                              );
                            }),
                      )
                    : Center(
                        child: CircularProgressIndicator(),
                      );
              }),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(15, 10, 15, 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "*TAL-To be announced later",
                    style: TextStyle(
                        color: Color(0xff000000),
                        fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w700,
                        fontSize: 14),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Disclaimer:",
                        style: TextStyle(
                            color: Color(0xffff0000),
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w600,
                            fontSize: 14),
                      ),
                      Flexible(
                        child: Text(
                          "In case of any discrepancies please contact Controller of Examination,PES University",
                          style: TextStyle(
                              color: Color(0xff666666),
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.normal,
                              fontSize: 14),
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
    );
  }
}
