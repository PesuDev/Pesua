import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pesu/src/isa_results/model/isa_dropdown_model.dart';
import 'package:pesu/utils/services/app_routes.dart';
import 'package:pesu/utils/view/widget.dart';
import 'package:provider/provider.dart';

import '../viewmodel/isa_dropdown_viewModel.dart';

class ISAResults extends StatefulWidget {
  const ISAResults({Key? key}) : super(key: key);

  @override
  State<ISAResults> createState() => _ISAResultsState();
}

class _ISAResultsState extends State<ISAResults> {
  bool isSemSelected = false;
  String? dropDownTitle;
  late IsaDropDownViewModel isaResultsViewModel;
  Isa_downdown_model? isaDropDownModel;
  @override
  void initState() {
    super.initState();
    isaResultsViewModel =
        Provider.of<IsaDropDownViewModel>(context, listen: false);
    isaResultsViewModel.getIsaDropDownDetails(
        action: 6,
        mode: 5,
        whichObjectId: "clickHome_pesuacademy_myresults",
        title: "ISA Results",
        userId: "7b14a7f5-13a7-4c1c-a17d-42e7ac9a147f",
        deviceType: 1,
        serverMode: 0,
        redirectValue: "redirect:/a/ad",
        randomNum: 0.1629756694316884);
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: sideNavAppBar("ISA Results"),
        body: Consumer<IsaDropDownViewModel>(builder: (context, model, child) {
          return Container(
            child: model.isaDropDownModel != null &&
                    model.isaDropDownModel!.length != 0
                ? Container(
                    padding: EdgeInsets.only(
                        top: 15, left: 15, right: 15, bottom: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            print("set $isSemSelected");
                            isSemSelected = true;
                            print("reset $isSemSelected");
                            // _semBottomSheet();
                            showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                  backgroundColor: Colors.black45,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  elevation: 16,
                                  child: Container(
                                    child: ListView.separated(
                                      itemCount:
                                          model.isaDropDownModel?.length ?? 0,
                                      itemBuilder: (context, index) {
                                        print("bbbbbb $dropDownTitle");
                                        return Column(
                                          children: [
                                            _buildRow(model
                                                    .isaDropDownModel?[index]
                                                    .className ??
                                                ""),
                                          ],
                                        );
                                      },
                                      separatorBuilder: (context, index) {
                                        return Divider(
                                          color: Colors.white60,
                                          endIndent: 5.0,
                                          indent: 5.0,
                                        );
                                      },
                                      shrinkWrap: true,
                                    ),
                                  ),
                                );
                              },
                            );
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
                              padding: EdgeInsets.only(
                                  left: 5, right: 5, top: 5, bottom: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    dropDownTitle ??
                                        "${model.isaDropDownModel![0].className}",
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
                          height: MediaQuery.of(context).size.height * 0.7,
                          child: ListView.builder(
                              itemCount: 20,
                              itemBuilder: (context, index) {
                                return resultDetails();
                              }),
                        )
                      ],
                    ),
                  )
                : Center(child: CircularProgressIndicator()),
          );
        }));
  }

  void _semBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Consumer<IsaDropDownViewModel>(
              builder: (context, model, child) {
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
                      ListView.separated(
                        itemCount: 2,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text('2 00}'),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Divider();
                        },
                      )
                    ],
                  )),
            );
          });
        });
  }

  Widget resultDetails() {
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
                    width: MediaQuery.of(context).size.width / 6.5,
                    child: Text("A", textAlign: TextAlign.left)),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.isaResultsGraph);
                  },
                  child: Container(
                      width: MediaQuery.of(context).size.width / 6.5,
                      child: Icon(
                        Icons.bar_chart,
                      )),
                )
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

  Widget _buildRow(
    String name,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            InkWell(
              onTap: () {
                setState(() {
                  dropDownTitle = name;
                });
                Navigator.of(context).pop();
              },
              child: Container(
                padding:
                    EdgeInsets.only(left: 10.0, top: 8, bottom: 8, right: 8),
                child: InkWell(
                  child: Row(
                    children: <Widget>[
                      Center(
                        child: Text(
                          name,
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
