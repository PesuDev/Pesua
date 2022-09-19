import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    sessionEffectivenessViewmodel!.getSessionDetail(action: 39, mode: 4, userId: 'bac97ff1-1c7e-4a64-b225-cdb77839a9c0', randomNum: 0.17770127727820895, dayNumber: 3);
    sessionEffectivenessViewmodel!.feedbackDetails(timeTableTemplateDetailsId: '2c9d24fd-a1bc-11e7-8ecc-79e925fb7f88', BatchId: 26, mode: 2,
        subjectCode: 'UM21MB651B', action: 39, BatchClassId: 1498, isLocallySavedData: 'FALSE', subjectId: 15436,
        ClassId: 2, ClassBatchSectionId: 4367, DepartmentId: 18, status: 4,
        randomNum: 0.0780400788501232, userId: 'a354eafc-9c32-48c8-bcb8-09fccb614e8e', ProgramId: 7);

    //selectedRadio;
    // selectValue;

  }
  String dropdownvalue = 'Business ForeCasting';
  String dropdownvalues = '1330';

  int? selectedRadio;
  var selectValue=false;
  var grid1=false;
  var grid2=false;
  var grid3=false;
  var grid4=false;
  var selectColor=Colors.blue;
  var unselectColor=Colors.white;

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }  //int? value=0;


  // setSelectedRadio(int val) {
  //   setState(() {
  //     selectedRadio = val;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: sideNavAppBar("Session Effectiveness"),

      body:
      Consumer<SessionEffectivenessViewmodel>(builder: (context, data, child) {

        return data.sessionEffectivenessModel != null &&
        data.sessionEffectivenessModel?.stuentsubjectlist !=null &&
        data.sessionEffectivenessModel?.subjectlist !=null &&
        data.sessionEffectivenessModel?.timetableList !=null &&
        data.sessionEffectivenessModel?.timetableList?[0].timeTableTemplateDetailsId !=null
            ?

        Container(
          margin: EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.sessionEffectivenessModel?.timetableList?[0].currentDate ??
                  "",
                //  data.sessionEffectivenessModel?.currentDate ??"",
                  // "24-May-2022 Tuesday",
                  style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),),
                // DropdownButton(
                //   isExpanded: true,
                //   value: dropdownvalue,
                //   icon: const Icon(Icons.keyboard_arrow_down),
                //   items: items.map((String items) {
                //     return DropdownMenuItem(
                //       value: items,
                //       child: Text(items),
                //     );
                //   }).toList(),
                //   // After selecting the desired option,it will
                //   // change button value to selected value
                //   onChanged: (String? newValue) {
                //     setState(() {
                //       dropdownvalue = newValue!;
                //     });
                //   },
                // ),
                DropdownButtonFormField<String>(
                    value: data.sessionEffectivenessModel?.timetableList?[0].subjectName,
                    items: data.items
                        .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    ))
                        .toList(),
                    onChanged: (item) {
                      // setState(() {
                      //   selectedItem = item;
                      //   selectedBatch = data.esaModel4
                      //       ?.cGPASEMESTERWISE?[0].batchClassId;
                      // });
                      //setState(() => selectedItem = item,batch=data.esaModel2?.studentSemesterWise?[0].batchClassId.toString());
                      // log("SEMMMMM${selectedItem}");
                      // log("MMMM${selectedBatch}");
                     // _submittedRefreshList();
                    }),

                SizedBox(
                  height: 15,
                ),


                Row(
                  children: [
                    Text(
                      data.sessionEffectivenessModel?.timetableList?[0].subjectCode ??
                          "",

                      style: TextStyle(color: Colors.grey),),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      data.sessionEffectivenessModel?.timetableList?[0].subjectName ??
                          "",                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),

                Text("Please select a session",style: TextStyle(
                    fontWeight: FontWeight.bold
                ),),
                Container(//color: Colors.amber,
                  // decoration: BoxDecoration(
                  //   border: Border.all(color: Colors.black),
                  //   borderRadius: BorderRadius.circular(8)
                  // ),
                  child:
                  // DropdownButton(
                  //   alignment: Alignment.center,
                  //   isExpanded: true,
                  //   // Initial Value
                  //   value: dropdownvalues,
                  //   // Down Arrow Icon
                  //   icon: const Icon(Icons.keyboard_arrow_down),
                  //   // Array list of items
                  //   items: items1.map((String items1 ) {
                  //     return DropdownMenuItem(
                  //       value: items1,
                  //       child: Text(items1),
                  //     );
                  //   }).toList(),
                  //   // After selecting the desired option,it will
                  //   // change button value to selected value
                  //   onChanged: (String? newValue) {
                  //     setState(() {
                  //       dropdownvalues = newValue!;
                  //     });
                  //   },
                  // ),
                  DropdownButtonFormField<String>(
                      value: data.sessionEffectivenessModel?.timetableList?[0].startTiming,
                      items: data.items1
                          .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      ))
                          .toList(),
                        onChanged: (item) {
                        // setState(() {
                        //   selectedItem = item;
                        //   selectedBatch = data.esaModel4
                        //       ?.cGPASEMESTERWISE?[0].batchClassId;
                        // });
                        //setState(() => selectedItem = item,batch=data.esaModel2?.studentSemesterWise?[0].batchClassId.toString());
                        // log("SEMMMMM${selectedItem}");
                        // log("MMMM${selectedBatch}");
                        // _submittedRefreshList();
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
                      await sessionEffectivenessViewmodel!.feedbackDetails(
                          timeTableTemplateDetailsId: data.sessionEffectivenessModel?.subjectlist?[0].timeTableTemplateDetailsId ??'',
                          BatchId: data.sessionEffectivenessModel?.subjectlist?[0].batchId ??0,
                          mode: 2,
                          subjectCode: data.sessionEffectivenessModel?.subjectlist?[0].subjectCode??'',
                          action: 39,
                          BatchClassId: data.sessionEffectivenessModel?.subjectlist?[0].batchClassId ??0,
                          isLocallySavedData: 'FALSE',
                          subjectId:data.sessionEffectivenessModel?.subjectlist?[0].subjectId ??0 ,
                          ClassId: data.sessionEffectivenessModel?.subjectlist?[0].classId ??0,
                          ClassBatchSectionId: data.sessionEffectivenessModel?.subjectlist?[0].classBatchSectionId ??0,
                          DepartmentId: data.sessionEffectivenessModel?.subjectlist?[0].departmentId ??0,
                          status: selectedRadio??0,
                          randomNum: 0.0780400788501232,
                          userId: 'a354eafc-9c32-48c8-bcb8-09fccb614e8e',
                          ProgramId: data.sessionEffectivenessModel?.subjectlist?[0].programId ??0);
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
            ),
          ),
        )

        : Center(child: Text('hiiii'));
      })

    );

  }
}

