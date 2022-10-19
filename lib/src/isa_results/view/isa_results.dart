import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pesu/utils/services/app_routes.dart';
import 'package:pesu/utils/view/widget.dart';
import 'package:provider/provider.dart';

import '../../../utils/constants/sp_constants.dart';
import '../../../utils/services/sharedpreference_utils.dart';
import '../viewmodel/isaViewModel.dart';

class ISAResults extends StatefulWidget {
  bool isFromDashboard;
ISAResults({required this.isFromDashboard});

  @override
  State<ISAResults> createState() => _ISAResultsState();
}

class _ISAResultsState extends State<ISAResults> {
  bool isSemSelected = false;
  String? dropDownTitle;
  late IsaViewModel isaViewModel;
  late IsaViewModel _isaViewModel;
  var classBatch;
  var classBatchData;
  var classBatchData1;
List dropDownData=[];
  @override
  void initState() {
    super.initState();
    initMethod();
drop();
  }
  SharedPreferenceUtil util = SharedPreferenceUtil();

  initMethod()async{
    isaViewModel = Provider.of<IsaViewModel>(context, listen: false);
    isaViewModel.getIsaDropDownDetails(
        action: 6,
        mode: 5,
        whichObjectId: "clickHome_pesuacademy_myresults",
        title: "ISA Results", deviceType: 1,
        serverMode: 0,
        redirectValue: "redirect:/a/ad",
        randomNum: 0.1629756694316884);
    _isaViewModel = Provider.of<IsaViewModel>(context, listen: false);
    _isaViewModel.getIsaResultDetails(
        action: 6,
        mode: 10,
        batchClassId: 1400,
        classBatchSectionId: 4164,
        fetchId: "1400-4164",
        randomNum: 0.4054309131337863);
    classBatchData= await util.getString(sp_className);

    print(">>>>> $classBatch");
  }
  drop()async{
    classBatchData=  await util.getString(sp_className);
    classBatchData1 = classBatchData.toString().substring(0,5);
    print("object${classBatchData1}");
  }


  Widget build(BuildContext context) {
    return Scaffold(
        appBar: widget.isFromDashboard?sideNavAppBarForDashboard("ISA Results"):sideNavAppBar("ISA Results"),
        body: SingleChildScrollView(
          child: Consumer<IsaViewModel>(builder: (context, model, child) {
            if(model.isaDropDownModel != null &&
                model.isaDropDownModel!.length != 0 &&
                model.isaResultModel != null){
              dropDownData=model.isaDropDownModel!.map((e) => e.className).toSet().toList();
            }
            return Container(
              child: model.isaDropDownModel != null &&
                      model.isaDropDownModel!.length != 0 &&
                      model.isaResultModel != null
                  ?  Container(
                      padding: EdgeInsets.only(
                          top: 15, left: 15, right: 15, bottom: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 35,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.blueGrey)
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButtonFormField<String>(
                                  decoration: InputDecoration.collapsed(hintText: ''),
                                  hint: Padding(
                                    padding: const EdgeInsets.only(top:7,left: 10),
                                    child: Text("$classBatchData1"),
                                  ),
                                  value: classBatch,
                                  items:dropDownData?.map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 7,left: 5),

                                      child: Text(item.toString(),),
                                    ),
                                  )).toSet()
                                      .toList(),
                                  onChanged: (item) {
                                    print("Oye");
                                    var batchClassId;
                                    var classBatchSectionId;
                                    setState(() {
                                      classBatch=item;
                                      for (var subjectData in model.isaDropDownModel!){
                                        if(subjectData.className==item){
                                          batchClassId=subjectData.batchClassId;
                                          classBatchSectionId = subjectData.classBatchSectionId;
                                        }
                                      }
                                    });
                                    _isaViewModel.dynamicGetIsaResultDetails(
                                      action: 6,
                                      mode: 10,
                                      batchClassId: batchClassId,
                                      classBatchSectionId: classBatchSectionId,
                                      fetchId: "1400-4164",                                    randomNum: 0.26757885412517934,  );
                                    print("Hoye");
                                  }),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.7,
                            child: resultDetails(),
                          )
                        ],
                      ),
                    )


                  : Center(child: CircularProgressIndicator()),
            );
          }),
        ));
  }

  void _semBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Consumer<IsaViewModel>(builder: (context, model, child) {
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
    return Consumer<IsaViewModel>(builder: (context, model, child) {
      var subjectName=model.isaResultModel?.map((e) => e.subjectName).toSet().toList();
      return ListView.builder(
          itemCount: subjectName?.length,
          itemBuilder: (context, int i) {
            /*List<int> items = model.isaResultModel?[i].subjectId as List<int>;
            print("jjjjjjjjjjjjjjjjjjjjjj $items}");*/
            String? titleCode = model.isaResultModel?[i].subjectCode;
      //     var subjectCode = model.isaResultModel?.map((e) => e.subjectCode).toSet().toList();

print("Oye single subject ${subjectName}");

            return Container(
              padding: EdgeInsets.only(bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.centerLeft,
                    color: Colors.lightBlue,
                    padding:
                        EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8),
                    child: RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: titleCode,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16,
                                  color: Colors.white60)),
                          TextSpan(
                              text: ' - ' +
                                  (model.isaResultModel?[i].subjectName ??
                                      'Design and Analysis of Algorithm '),
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 16,
                                  color: Color(0xffFFFFFF))),
                        ],
                      ),
                    ),
                  ),
                  ListView.separated(
                      separatorBuilder: (context, index) {
                        return Divider(
                          color: Colors.black26,
                          height: 0.05,
                        );
                      },
                      itemCount: model.isaResultModel?.length ?? 0,
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemBuilder: (context1, int j) {
                        return (titleCode ==
                                model.isaResultModel?[j].subjectCode)
                            ? Container(
                                padding: EdgeInsets.only(left: 4, top: 7),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.7,
                                        padding: EdgeInsets.only(right: 5),
                                        child: Text(
                                          model.isaResultModel?[j].iSAMaster ??
                                              "",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                              color: Color(0xff333333)),
                                          textAlign: TextAlign.left,
                                        )),
                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                6.5,
                                        child: Text(
                                            "${model.isaResultModel?[j].marks}/${model.isaResultModel?[j].maxISAMarks}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w300,
                                                fontSize: 14,
                                                color: Color(0xff333333)),
                                            textAlign: TextAlign.left)),
                                    InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, AppRoutes.isaResultsGraph);
                                      },
                                      child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              6.5,
                                          child: Icon(
                                            Icons.bar_chart,
                                            color: Colors.black,
                                          )),
                                    )
                                  ],
                                ),
                              )
                            : Container();
                      }),
              SizedBox(
                height: 10,
              )
                ],
              ),
            );
          });
    });
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
