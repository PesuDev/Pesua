import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pesu/src/session_effectiveness/model/session_effectiveness.dart';
import 'package:pesu/src/session_effectiveness/viewmodel/session_effectiveness_viewmodel.dart';
import 'package:provider/provider.dart';

import '../../../utils/constants/color_consts.dart';
import '../../../utils/constants/custom_widgets.dart';
import '../../../utils/services/bottom_navigaton_provider.dart';
import '../../../utils/view/widget.dart';
import '../../dashboard_module/view/dashboard_page.dart';

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
    sessionEffectivenessViewmodel?.feedbackDetails(timeTableTemplateDetailsId: '2c9d24fd-a1bc-11e7-8ecc-79e925fb7f88', BatchId: 26, mode: 2,
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
    dates();
    days();

  }



  int? selectedRadio;
  int? timeRadio;
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
var todayDays;

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }  //int? value=0;
  String day='';
  String month='';
  String year='';
  String weakday='';
  String todayDate='';
  void dates(){
    // var today = DateTime.now();
    // var dateFormat = DateFormat('dd-MM-yyyy');
    // String currentDate = dateFormat.format(today);
    var date = new DateTime.now();
    String datetime4 = DateFormat(DateFormat.DAY).format(date);
    String datetime5 = DateFormat(DateFormat.MONTH).format(date);
    String datetime6 = DateFormat(DateFormat.YEAR).format(date);
    String datetime7 = DateFormat(DateFormat.WEEKDAY).format(date);


   // var dateParse = DateTime.parse(date);

   // var formattedDate = "${dateParse.day}-${dateParse.month.toString()}-${dateParse.year}";
    setState(() {
     day=datetime4;
      month=datetime5;
      year=datetime6;
      weakday=datetime7;
      todayDate=day+"-"+month+"-"+year+" "+weakday;
      print('jaa$todayDate');

    });
  }


   days(){
     todayDays=DateFormat('EEEE').format(DateTime.now()).toString().toLowerCase()=="monday"?1:
    DateFormat('EEEE').format(DateTime.now()).toString().toLowerCase()=="tuesday"?2:
    DateFormat('EEEE').format(DateTime.now()).toString().toLowerCase()=="wednesday"?3:
    DateFormat('EEEE').format(DateTime.now()).toString().toLowerCase()=="thursday"?4:
    DateFormat('EEEE').format(DateTime.now()).toString().toLowerCase()=="friday"?5:
    DateFormat('EEEE').format(DateTime.now()).toString().toLowerCase()=="saturday"?6:
    DateFormat('EEEE').format(DateTime.now()).toString().toLowerCase()=="sunday"?7:0;

  }

  List<String> time=[];




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,

        appBar: sideNavAppBar("Session Effectiveness"),
        bottomNavigationBar:    Consumer<BottomNavigationProvider>(
          builder: (context, value, child) {
            return BottomNavigationBar(
                currentIndex: value.selectedIndex,
                fixedColor: appThemeColor,
                items:CustomWidgets.getNavBarItems(),
                selectedFontSize: 10,
                unselectedFontSize: 10,
                type: BottomNavigationBarType.fixed,
                onTap: (index) {

                  value.selectBottomIndex(bottomIndex: index);
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => DashboardScreen()));
                }

            );
          },
        ),
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
                        SizedBox(height: 5,),
                        Text(
                          '$todayDate',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,fontSize: 17,
                          ),),
                        SizedBox(height: 10,),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey)
                          ),
                          height: 34,
                          child: DropdownButtonFormField<String>(
                              decoration: InputDecoration.collapsed(hintText: ''),

                              hint: Padding(
                                padding: const EdgeInsets.only(left: 10,top: 5),
                                child: Text(data.sessionEffectivenessModel?.stuentsubjectlist?[0].subjectName??""),
                              ),
                              value:subject,
                              items: data.sessionEffectivenessModel?.stuentsubjectlist?.map((item) => DropdownMenuItem<String>(
                                value: item.subjectName,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 7,left: 10),
                                  child: Text(item.subjectName.toString(),),
                                ),
                              ))
                                  .toList(),
                              onChanged: (item) {
                                print("Oye");
                                time=[];
                                setState(() {
                                  subject=item;

                               for(var dataVal in data.sessionEffectivenessModel!.timetableList!){
                                    if(dataVal.day==todayDays &&dataVal.subjectName==item){
print("data ${dataVal}");

                                      return time.add(dataVal.startTiming.toString());

                                    }

                               }
                                  //  time =  data.sessionEffectivenessModel?.timetableList?.map((itemValueTera){
                                  //   if(itemValueTera.day==1 &&itemValueTera.subjectName==item){
                                  //     print("subject>>${itemValueTera.subjectName}");
                                  //     print("item>>${item}");
                                  //
                                  //       print("dedo>>${itemValueTera.startTiming}");
                                  //       return itemValueTera.startTiming;
                                  //
                                  //   }else{
                                  //
                                  //   }
                                  //
                                  //
                                  // }).toList();
                              var subjectCodeList=   data.sessionEffectivenessModel?.stuentsubjectlist?.map((itemValue){
                              if(item==itemValue.subjectName){
                              return itemValue.subjectCode.toString();
                          }


                          });
                                  print("TeimeMera>>${time}");
                                  print("subjectCode>>${subjectCodeList}");
                                  // for(var data in timeTable!){
                                  //   if(data !=null){
                                  //     time=time.!add(data.toString());
                                  //   }
                                  // }


                                  for (var subjectData in subjectCodeList!){
                                      if(subjectData !=null){
                                      subjectCode=subjectData;
                                      }
                                    }
                                  time.clear();


                                });
                                print("Hoye");
                                print("sesso${sessionTime}");
                                print("tii${time}");

                              },
                            icon: Icon(Icons.keyboard_arrow_down),
                            iconSize: 15,
                              ),
                        ),

                        SizedBox(
                          height: 15,
                        ),


                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            subjectCode !=null?
                            Text(
                          "${subjectCode}",

                              style: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.w600),):Text(data.sessionEffectivenessModel?.stuentsubjectlist?[0].subjectCode??""),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width/1.5,
                              child:
                                  subject !=null?
                              Text(
                                "${subject}" ,style: TextStyle(
                                fontSize: 15,fontWeight: FontWeight.w500,color: Colors.black
                              ),
                                maxLines: 2,
                              ):Text(data.sessionEffectivenessModel?.stuentsubjectlist?[0].subjectName??"",style:TextStyle(
                                      fontSize: 15,fontWeight: FontWeight.w400,color: Colors.black
                                  ) ,),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),

                        Text("Please select a session",style: TextStyle(
                            fontWeight: FontWeight.w700,fontSize: 15,
                        ),),
                        SizedBox(height: 10,),
                    time.length>0?    Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey)
                          ),
                          height: 34,
                          child: DropdownButtonFormField<String>(
                              decoration: InputDecoration.collapsed(hintText: ''),

                              hint: Padding(
                                padding: const EdgeInsets.only(top: 5, left: 10),
                                child:

                                Text("data")
                              ),

                              items:
                            time.map((droptime) => DropdownMenuItem<String>(
                              value: droptime,
                              child:

                              Text(
                              "${droptime.toString()}"
                              ),
                            )
                              ,).toList(),
                              onChanged: (item) {
                                // _timeBottomSheet();

                              }
                              ,icon: Icon(Icons.keyboard_arrow_down),
                            iconSize: 15,
                              ),
                        ):Container(),
                        data.sessionEffectivenessModel!.timetableList !=null && time.length>0 ?
                       Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Please provide Session Effectiveness Feedback Below",style: TextStyle(
                                    fontSize: 14
                                  ),),
                                  SizedBox(height: 10,),
                                  Row(
                                    children: [
                                      RotatedBox(
                                          quarterTurns: 7,
                                          child: Text("Learning Effectiveness",style: TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.w600),)),
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
                                                        fontWeight: FontWeight.w700,fontSize: 15),),
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
                                                        fontWeight: FontWeight.w700,fontSize: 15),),
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
                                                        fontWeight:FontWeight.w700,fontSize: 15),),
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
                                                        fontWeight: FontWeight.w700,fontSize: 15),),
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
                                  Center(child: Text("Session Effectiveness",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14),))
                                ],
                              ),
                            ),
                            SizedBox(height: 40,),

                            GestureDetector(
                              onTap: ()async{
                                await sessionEffectivenessViewmodel?.feedbackDetails(
                                timeTableTemplateDetailsId: data.sessionEffectivenessModel?.subjectlist?[0].timeTableTemplateDetailsId ??'',
                                BatchId: data.sessionEffectivenessModel?.subjectlist?[0].batchId ??0,
                                mode: 2,
                                //subjectCode: data.sessionEffectivenessModel?.subjectlist?[0].subjectCode??'',
                                 subjectCode: subjectCode??'',
                                action: 39,
                                BatchClassId: data.sessionEffectivenessModel?.subjectlist?[0].batchClassId ??0,
                                isLocallySavedData: 'FALSE',
                                subjectId:data.sessionEffectivenessModel?.subjectlist?[0].subjectId ??0 ,
                                ClassId: data.sessionEffectivenessModel?.subjectlist?[0].classId ??0,
                                ClassBatchSectionId: data.sessionEffectivenessModel?.subjectlist?[0].classBatchSectionId ??0,
                                DepartmentId: data.sessionEffectivenessModel?.subjectlist?[0].departmentId ??0,
                                status: selectedRadio??0,
                                randomNum: 0.0780400788501232,
                                ProgramId: data.sessionEffectivenessModel?.subjectlist?[0].programId ??0);

                              },
                              onDoubleTap: (){

                              },
                              child: Container(
                                height: 34,
                                color: Color(0xff337ab7),
                                width: double.infinity,
                                child: Center(
                                    child: Text(
                                      "Submit",
                                      style: TextStyle(
                                          fontSize: 15,fontWeight: FontWeight.w400,color: Colors.white),
                                      textAlign: TextAlign.center,


                                    )),
                              ),
                            ),
                            SizedBox(height: 20,),
                            Text("Note :",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 14),),
                            SizedBox(height: 10,),
                            Text("Please mark the area on the grid that accurately reflects today's session.",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 14),),
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

                            SizedBox(height: 70,),
                          ],
                        ):
                       Container(
                         margin: EdgeInsets.only(top: 10),
                         width: MediaQuery.of(context).size.width/1,
                         child: Text("Session not started yet. Please try after session has started",style: TextStyle(
                           fontSize: 14,color: Colors.red
                         ),),
                       ),
                      ],
                    )

            ),
          )

              : Center(child: CircularProgressIndicator());
        })

    );

  }

  void _timeBottomSheet() {

    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return
            new Container(
             // color: Colors.black,
              child: ListView(
                children: [
                  ListTile(
                    leading: Radio(
                        value: 8,
                        groupValue: timeRadio,
                        onChanged: (int? val){
                          setState(() {
                            timeRadio=val;


                          });
                          print(timeRadio);
                          // print(val);

                        }),
                    title: Text('Time',style: TextStyle(color: Colors.black),),
                  ),
                  ListTile(
                    leading: Radio(
                        value: 9,
                        groupValue: timeRadio,
                        onChanged: (int? val){
                          setState(() {
                            timeRadio=val;


                          });
                          print(timeRadio);
                          // print(val);

                        }),
                    title: Text('Time',style: TextStyle(color: Colors.black),),
                  ),
                ],
              ),
            );
        });



  }

}

