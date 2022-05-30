import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SessionEffect extends StatefulWidget {
  const SessionEffect({Key? key}) : super(key: key);

  @override
  State<SessionEffect> createState() => _SessionEffectState();
}

class _SessionEffectState extends State<SessionEffect> {
  String dropdownvalue = 'Business ForeCasting';
  String dropdownvalues = '1330';

  // List of items in our dropdown menu
  var items = [
    'Business ForeCasting',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  var items1 = [
    '1330',
    '1340',
    '1350',

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: Text("Session Effectiveness"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("24-May-2022 Tuesday",style: TextStyle(
                fontWeight: FontWeight.bold
              ),),
              DropdownButton(
                isExpanded: true,


                // Initial Value
                value: dropdownvalue,

                // Down Arrow Icon
                icon: const Icon(Icons.keyboard_arrow_down),

                // Array list of items
                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                // After selecting the desired option,it will
                // change button value to selected value
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvalue = newValue!;
                  });
                },
              ),
              SizedBox(
                height: 15,
              ),


              Row(
                children: [
                  Text("UM21MB651B",style: TextStyle(color: Colors.grey),),
                  SizedBox(
                    width: 5,
                  ),
                  Text("Business ForeCasting"),
                ],
              ),
              SizedBox(
                height: 10,
              ),

              Text("Please select a session",style: TextStyle(
                  fontWeight: FontWeight.bold
              ),),
              DropdownButton(
                isExpanded: true,


                // Initial Value
                value: dropdownvalues,

                // Down Arrow Icon
                icon: const Icon(Icons.keyboard_arrow_down),

                // Array list of items
                items: items1.map((String items1 ) {
                  return DropdownMenuItem(
                    value: items1,
                    child: Text(items1),
                  );
                }).toList(),
                // After selecting the desired option,it will
                // change button value to selected value
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvalues = newValue!;
                  });
                },
              ),

              Container(
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
                                   borderRadius: BorderRadius.only(topLeft:Radius.circular(10)),
                                   // color: Colors.amber

                                  ),
                                  child:
                                  Column(
                                    children: [
                                      SizedBox(height: 30,),
                                      Text("Low/High",style: TextStyle(
                                          fontWeight: FontWeight.bold,fontSize: 18),),
                                      Radio(value: "value", groupValue: "groupValue",
                                          onChanged: (value){
                                        setState(() {

                                        });

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
                                    borderRadius: BorderRadius.only(topRight:Radius.circular(10)),

                                    //color: Colors.amber

                                  ),
                                  child:Column(
                                    children: [
                                      SizedBox(height: 30,),
                                      Text("High/High",style: TextStyle(
                                          fontWeight: FontWeight.bold,fontSize: 18),),
                                      Radio(value: "value", groupValue: "groupValue",
                                          onChanged: (value){
                                            setState(() {

                                            });

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
                                    borderRadius: BorderRadius.only(bottomLeft:Radius.circular(10)),

                                    // color: Colors.amber

                                  ),
                                  child: Column(
                                    children: [
                                      SizedBox(height: 30,),
                                      Text("Low/Low",style: TextStyle(
                                          fontWeight: FontWeight.bold,fontSize: 18),),
                                      Radio(value: "value", groupValue: "groupValue",
                                          onChanged: (value){
                                            setState(() {

                                            });

                                          })

                                    ],
                                  ),

                                ),Container(
                                  height: 130,
                                  width: 170,
                                  //color: Colors.amber,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.only(bottomRight:Radius.circular(10)),

                                    //color: Colors.amber

                                  ),
                                  child:Column(
                                    children: [
                                      SizedBox(height: 30,),
                                      Text("High/Low",style: TextStyle(
                                          fontWeight: FontWeight.bold,fontSize: 18),),
                                      Radio(value: "value", groupValue: "groupValue",
                                          onChanged: (value){
                                            setState(() {

                                            });

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
                  onPressed: (){},
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
      ),
    );

  }
}

