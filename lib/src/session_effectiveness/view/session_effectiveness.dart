import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pesu/src/session_effectiveness/model/session_effectiveness.dart';
import 'package:pesu/src/session_effectiveness/viewmodel/session_effectiveness_viewmodel.dart';
import 'package:provider/provider.dart';

import '../../../utils/view/widget.dart';

class SessionEffect extends StatefulWidget {
  const SessionEffect({Key? key}) : super(key: key);

  @override
  State<SessionEffect> createState() => _SessionEffectState();
}

class _SessionEffectState extends State<SessionEffect> {
  SessionEffectivenessViewmodel? sessionEffectivenessViewmodel;




  @override
  void initState() {
    super.initState();
    sessionEffectivenessViewmodel = Provider.of<SessionEffectivenessViewmodel>(context, listen: false);
    sessionEffectivenessViewmodel!.getSessionDetail(
      action: 39, mode: 4,
      randomNum: 0.17770127727820895,
      dayNumber: DateFormat('EEEE').format(DateTime.now()).toString().toLowerCase()=="monday"?1:
      DateFormat('EEEE').format(DateTime.now()).toString().toLowerCase()=="tuesday"?2:
      DateFormat('EEEE').format(DateTime.now()).toString().toLowerCase()=="wednesday"?3:
      DateFormat('EEEE').format(DateTime.now()).toString().toLowerCase()=="thursday"?4:
      DateFormat('EEEE').format(DateTime.now()).toString().toLowerCase()=="friday"?5:
      DateFormat('EEEE').format(DateTime.now()).toString().toLowerCase()=="saturday"?6:
      DateFormat('EEEE').format(DateTime.now()).toString().toLowerCase()=="sunday"?7:0,
    );
    sessionEffectivenessViewmodel!.feedbackDetails(timeTableTemplateDetailsId: '2c9d24fd-a1bc-11e7-8ecc-79e925fb7f88', BatchId: 26, mode: 2,
        subjectCode: 'UM21MB651B', action: 39,
        BatchClassId: 1498,
        isLocallySavedData: 'FALSE',
        subjectId: 15436,
        ClassId: 2,
        ClassBatchSectionId: 4367,
        DepartmentId: 18,
        status: 4,
        randomNum: 0.0780400788501232,
        ProgramId: 7);

    //selectedRadio;
    // selectValue;

  }


  int? selectedRadio;
  var selectValue=false;
  var grid1=false;
  var grid2=false;
  var grid3=false;
  var grid4=false;
  var selectColor=Colors.blue;
  var unselectColor=Colors.white;
var subject;
var subjectCode;
var sessionTime;
  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }  //int? value=0;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,

        appBar: sideNavAppBar("Session Effectiveness"),

        body:
        Consumer<SessionEffectivenessViewmodel>(builder: (context, data, child) {

          return data.sessionEffectivenessModel != null
              ?

          Container(
            margin: EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child:
   Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(

                              "${DateTime.now()}",
                          //  data.sessionEffectivenessModel?.currentDate ??"",
                          // "24-May-2022 Tuesday",
                          style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),),
                        DropdownButtonFormField<String>(
                            value: subject,
                            items: data.sessionEffectivenessModel?.stuentsubjectlist?.map((item) => DropdownMenuItem<String>(
                              value: item.subjectName,
                              child: Text(item.subjectName.toString()),
                            ))
                                .toList(),
                            onChanged: (item) {
                              print("Oye");
                              setState(() {
                                subject=item;
var subjectCodeList=   data.sessionEffectivenessModel?.stuentsubjectlist?.map((itemValue){
  if(item==itemValue.subjectName){
return itemValue.subjectCode.toString();
  }

});
for (var subjectData in subjectCodeList!){
  if(subjectData !=null){
    subjectCode=subjectData;
  }
}
                              });
                              print("Hoye");
                              print(">>>>  $subjectCode");

                            }),

                        SizedBox(
                          height: 15,
                        ),


                        Row(
                          children: [
                            Text(

                                  "$subjectCode",

                              style: TextStyle(color: Colors.grey),),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              subject ??
                                  "",                    ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),

                        Text("Please select a session",style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),),
                        Container(
                          child:

                          DropdownButtonFormField<String>(
                              value: sessionTime,
                              items: data.items1
                                  .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(item),
                              ))
                                  .toList(),
                              onChanged: (item) {
                                setState(() {
                                  sessionTime=item;
                                });
                              }),
                        ),

                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Please provide Session Effectiveness Feedback Below"),
                              SizedBox(height: 10,),
                              Row(
                                children: [
                                  RotatedBox(
                                      quarterTurns: 7,
                                      child: Text("Learning Effectiveness")),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            height: 130,
                                            width: 170,
                                            //color: Colors.amber,
                                            decoration: BoxDecoration(
                                              border: Border.all(color: Colors.black),
                                              color: grid1==true?selectColor:unselectColor,
                                              borderRadius: BorderRadius.only(topLeft:Radius.circular(10)),
                                              // color: Colors.amber

                                            ),
                                            child:
                                            Column(
                                              children: [
                                                SizedBox(height: 30,),
                                                Text("Low/High",style: TextStyle(
                                                    fontWeight: FontWeight.bold,fontSize: 18),),
                                                Radio(
                                                    value: 1,
                                                    groupValue: selectedRadio,
                                                    onChanged: (int? val){
                                                      selectedRadio=val;
                                                      setState(() {
                                                        grid1=true;
                                                        grid2=false;
                                                        grid3=false;
                                                        grid4=false;

                                                      });
                                                      print(selectedRadio);
                                                      // print(val);

                                                    })

                                              ],
                                            ),
                                          ),
                                          Container(

                                            height: 130,
                                            width: 170,
                                            //color: Colors.amber,
                                            decoration: BoxDecoration(
                                              border: Border.all(color: Colors.black),
                                              color: grid2==true?selectColor:unselectColor,

                                              borderRadius: BorderRadius.only(topRight:Radius.circular(10)),

                                              //color: Colors.amber

                                            ),
                                            child:Column(
                                              children: [
                                                SizedBox(height: 30,),
                                                Text("High/High",style: TextStyle(
                                                    fontWeight: FontWeight.bold,fontSize: 18),),
                                                Radio(
                                                    value: 2,
                                                    groupValue:selectedRadio,
                                                    onChanged: (int? val){
                                                      selectedRadio=val;
                                                      setState(() {
                                                        grid2=true;
                                                        grid1=false;
                                                        grid3=false;
                                                        grid4=false;

                                                      });
                                                      print(selectedRadio);

                                                    })

                                              ],
                                            ),

                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            height: 130,
                                            width: 170,
                                            //color: Colors.amber,
                                            decoration: BoxDecoration(
                                              border: Border.all(color: Colors.black),
                                              color: grid3==true?selectColor:unselectColor,
                                              borderRadius: BorderRadius.only(bottomLeft:Radius.circular(10)),

                                              // color: Colors.amber

                                            ),
                                            child: Column(
                                              children: [
                                                SizedBox(height: 30,),
                                                Text("Low/Low",style: TextStyle(
                                                    fontWeight: FontWeight.bold,fontSize: 18),),
                                                Radio(
                                                    value: 3,
                                                    groupValue:selectedRadio,
                                                    onChanged: (int? val){
                                                      selectedRadio=val;
                                                      setState(() {
                                                        grid3=true;
                                                        grid2=false;
                                                        grid1=false;
                                                        grid4=false;

                                                      });
                                                      print(selectedRadio);

                                                    })

                                              ],
                                            ),

                                          ),
                                          Container(
                                            height: 130,
                                            width: 170,
                                            //color: Colors.amber,
                                            decoration: BoxDecoration(
                                              border: Border.all(color: Colors.black),
                                              color: grid4==true?selectColor:unselectColor,
                                              borderRadius: BorderRadius.only(bottomRight:Radius.circular(10)),

                                              //color: Colors.amber
                                            ),
                                            child:Column(
                                              children: [
                                                SizedBox(height: 30,),
                                                Text("High/Low",style: TextStyle(
                                                    fontWeight: FontWeight.bold,fontSize: 18),),
                                                Radio(
                                                    value:4,
                                                    groupValue:selectedRadio,
                                                    onChanged: (int? val){
                                                      selectedRadio=val;
                                                      setState(() {
                                                        grid4=true;
                                                        grid2=false;
                                                        grid3=false;
                                                        grid1=false;

                                                      });
                                                      print(selectedRadio);

                                                    })
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),


                                ],
                              ),
                              SizedBox(height: 10,),
                              Center(child: Text("Session Effectiveness"))
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10,right: 30,top: 30),
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: ()async{
                              // await sessionEffectivenessViewmodel!.feedbackDetails(
                              //     timeTableTemplateDetailsId: data.sessionEffectivenessModel?.subjectlist?[index].timeTableTemplateDetailsId ??'',
                              //     BatchId: data.sessionEffectivenessModel?.subjectlist?[index].batchId ??0,
                              //     mode: 2,
                              //     subjectCode: data.sessionEffectivenessModel?.subjectlist?[index].subjectCode??'',
                              //     action: 39,
                              //     BatchClassId: data.sessionEffectivenessModel?.subjectlist?[index].batchClassId ??0,
                              //     isLocallySavedData: 'FALSE',
                              //     subjectId:data.sessionEffectivenessModel?.subjectlist?[index].subjectId ??0 ,
                              //     ClassId: data.sessionEffectivenessModel?.subjectlist?[index].classId ??0,
                              //     ClassBatchSectionId: data.sessionEffectivenessModel?.subjectlist?[index].classBatchSectionId ??0,
                              //     DepartmentId: data.sessionEffectivenessModel?.subjectlist?[index].departmentId ??0,
                              //     status: selectedRadio??0,
                              //     randomNum: 0.0780400788501232,
                              //     ProgramId: data.sessionEffectivenessModel?.subjectlist?[index].programId ??0);
                            },
                            child: Text("Submit"),),
                        ),
                        SizedBox(height: 20,),
                        Text("Note :",style: TextStyle(fontWeight: FontWeight.bold),),
                        SizedBox(height: 10,),
                        Text("Please mark the area on the grid that accurately reflects today's session.",style: TextStyle(fontWeight: FontWeight.normal),),
                        SizedBox(height: 10,),

                        Text("Session Effectiveness vs Learning Effectiveness",style: TextStyle(fontWeight: FontWeight.bold),),
                        SizedBox(height: 5,),
                        RichText(
                            text: TextSpan(
                                children: [
                                  TextSpan(text:"Low/Low:",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black), ),
                                  TextSpan(text:"Low Session Effectiveness and Low Learning (Ineffective Teaching, Hard Concepts).",style: TextStyle(fontWeight: FontWeight.normal,color: Colors.black), ),
                                ]

                            )),
                        SizedBox(height: 10,),
                        RichText(
                            text: TextSpan(
                                children: [
                                  TextSpan(text:"High/Low:",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black), ),
                                  TextSpan(text:"High Session Effectiveness and Low Learning (Low Attention Span, Non Interesting Subject, Fatigue, Tough Concepts).",style: TextStyle(fontWeight: FontWeight.normal,color: Colors.black), ),
                                ]

                            )),
                        SizedBox(height: 10,),
                        RichText(
                            text: TextSpan(
                                children: [
                                  TextSpan(text:"Low/High:",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black), ),
                                  TextSpan(text:"Low Session Effectiveness and High Learning (Self Learning, Peer based Learning, Books, Media).",style: TextStyle(fontWeight: FontWeight.normal,color: Colors.black), ),
                                ]

                            )),   SizedBox(height: 10,),
                        RichText(
                            text: TextSpan(
                                children: [
                                  TextSpan(text:"High/High:",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black), ),
                                  TextSpan(text:"High Session Effectiveness and High Learning (Elevated Teaching Quality, Creative Methodologies, Great Learning Experience, Interesting and Relevant Subject).",style: TextStyle(fontWeight: FontWeight.normal,color: Colors.black), ),
                                ]

                            )),



                      ],
                    )

            ),
          )

              : Center(child: Text('hiiii'));
        })

    );

  }
}

