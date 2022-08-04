import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pesu/src/my_profile/model/profile_detail/-model.dart';

import 'package:pesu/src/my_profile/profile_viewmodel/profile_viewmodel.dart';
import 'package:pesu/utils/view/widget.dart';
import 'package:provider/provider.dart';


class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);


  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  ProfileViewmodel? profileViewmodel;
  var uInt8list;










  @override
  void initState() {
    super.initState();
    profileViewmodel=Provider.of<ProfileViewmodel>(context,listen: false);
    profileViewmodel!.getProfileDetails(action: 4,mode: 7,userId: "0163f09a-84d8-43c0-b853-b9846c0e1799",
        randomNum:0.824022142978994,callMethod:'background', isProfileRequest: true);
    profileViewmodel!.getProfileDetailsData(action: 27, mode: 1, userId: "PES1202002878", randomNum: 0.5799475622899326, callMethod: 'background', loginId: "PES1202002878",
        searchUserId: "7b14a7f5-13a7-4c1c-a17d-42e7ac9a147f", userType: 1, userRoleId: '9edf9870-4ff9-4a05-828e-815af70cf760');



  }








  bool edit = false;
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: sideNavAppBar("My Profile"),
      body:Consumer<ProfileViewmodel>(
          builder: (context, data, child) {


            return data.profileModel!=null && data.profileDetailModel!=null?


           SingleChildScrollView(
             child: Container(
               color: Colors.grey[200],
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Column(
                     children: [
                       Container(
                         width: MediaQuery.of(context).size.width,
                         color: Colors.white,
                         child: Row(
                           children: [
                             Container(
                               padding: EdgeInsets.only(
                                   left: 15, top: 20, right: 35, bottom: 20),
                               child:

                                   data.profileModel!.photo!=null ?
                                   CircleAvatar(
                                     backgroundImage: NetworkImage(data
                                         .profileModel!.photo !=
                                         null
                                         ? "${data
                                         .profileModel!.photo }"
                                         : ""),
                                    // backgroundColor: Colors.white,
                                     radius: 50,
                                   ):
                                   CircleAvatar(
                                   backgroundColor: Colors.grey[200],
                                   radius: 60,
                                   child: ClipRRect(
                                     borderRadius: BorderRadius.circular(10.0),
                                     child: Icon(
                                       Icons.perm_identity_rounded,
                                       size: 80,
                                     ),
                                   )),
                             ),
                             Container(
                               width: MediaQuery.of(context).size.width / 1.8,
                               padding: EdgeInsets.only(top: 8, right: 8, bottom: 8),
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Text(
                                     data.profileModel?.name??"",

                                     //"Student401",
                                     style: TextStyle(color: Color(0xff163269), fontSize: 18),
                                   ),
                                   Row(
                                     children: [
                                       Text('PESU ID : ',style: TextStyle(color: Color(0xff999999),fontSize: 16,fontWeight: FontWeight.w400),),
                                       Text(
                                         data.profileModel?.loginId??"",
                                         style: TextStyle(color: Color(0xff333333),fontSize: 16),
                                       ),
                                     ],
                                   ),
                                   Row(
                                     children: [
                                       Text('SRN: ',style: TextStyle(color: Color(0xff999999),fontSize: 16,fontWeight: FontWeight.w400),),
                                       Text(
                                         data.profileModel?.departmentId??"",
                                         style: TextStyle(color: Color(0xff333333),fontSize: 16),
                                       ),
                                     ],
                                   ),

                                   Text("${data.profileModel?.program??""} | ${data.profileModel?.branch??""}",
                                     style: TextStyle(color: Color(0xff999999),fontSize: 16,fontWeight: FontWeight.w400),),

                                   Text(data.profileModel?.className??"",

                                       style: TextStyle(color: Color(0xff999999),fontSize: 16,fontWeight: FontWeight.w400),),

                                 ],
                               ),
                             )
                           ],
                         ),
                       ),
                       SizedBox(
                         height: 10,
                       ),
                       Container(
                         color: Colors.white,
                         padding: EdgeInsets.only(
                           top: 12,
                           right: 12,
                           left: 16,
                         ),
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Row(
                               mainAxisAlignment: MainAxisAlignment.end,
                               children: [
                                 InkWell(
                                   onTap: () {
                                     setState(() {
                                       if (edit == false) {
                                         edit = true;
                                       } else if (edit == true) {
                                         edit = false;
                                       }
                                       print('$edit');
                                     });
                                   },
                                   child: Container(
                                     padding: EdgeInsets.only(
                                         top: 5, bottom: 5, left: 12, right: 12),
                                     decoration: BoxDecoration(
                                       borderRadius: BorderRadius.circular(12),
                                       color: (edit == false)
                                           ? Colors.blueGrey
                                           : Colors.orangeAccent,
                                       /*    boxShadow: [
                                    BoxShadow(
                                        color: Colors.blueGrey, spreadRadius: 3),
                                  ],*/
                                     ),
                                     child: Text(
                                       (edit == false) ? "Edit" : "Cancel",
                                       style: TextStyle(
                                           color: Colors.white,
                                           fontSize: 16,
                                           fontWeight: FontWeight.bold),
                                     ),
                                   ),
                                 ),
                               ],
                             ),
                             Container(
                                 padding: EdgeInsets.only(top: 10, bottom: 10),
                                 child: Text(
                                   "Email ID",
                                   style: TextStyle(color: Colors.black45,fontSize: 18),
                                 )),
                             (edit == false)
                                 ? Text(data.profileModel?.email??"",
                               style: TextStyle(fontSize: 18),)
                             //ON CLICK OF EDIT
                                 : Container(
                                 height: 30,
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(0),
                                   color: Colors.white,
                                   // boxShadow: [
                                   //   BoxShadow(
                                   //       offset: Offset(2, 2),
                                   //       blurRadius: 6,
                                   //       color: Colors.blue)
                                   // ],
                                   border: Border.all(color: Colors.blueAccent),
                                 ),
                                 child: TextFormField(
                                   decoration: InputDecoration(
                                     border: InputBorder.none,
                                     hintText: data.profileModel!.email,
                                   ),
                                 )),
                             Container(
                                 padding: EdgeInsets.only(top: 20, bottom: 10),
                                 child: Text(
                                   "Contact No",
                                   style: TextStyle(color: Colors.black45,fontSize: 18),
                                 )),
                             (edit == false)
                                 ? Text(data.profileModel?.phone??"",
                               style: TextStyle(fontSize: 18),)
                             //ON CLICK OF EDIT
                                 : Container(
                                 height: 30,
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(0),
                                   color: Colors.white,
                                   // boxShadow: [
                                   //   BoxShadow(
                                   //       offset: Offset(2, 2),
                                   //       blurRadius: 6,
                                   //       color: Colors.blue)
                                   // ],
                                   border: Border.all(color: Colors.blueAccent),
                                 ),
                                 child: TextFormField(
                                   decoration: InputDecoration(
                                     border: InputBorder.none,
                                     hintText: data.profileModel!.phone,
                                   ),
                                 )),
                             (edit == true)
                                 ? Padding(
                               padding: const EdgeInsets.only(
                                   left: 8.0, right: 8.0, bottom: 15, top: 25),
                               child: Container(
                                 width: MediaQuery.of(context).size.width,
                                 padding: EdgeInsets.all(5),
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(15),
                                   color: Colors.blue,
                                   boxShadow: [
                                     BoxShadow(
                                         color: Colors.blue, spreadRadius: 3),
                                   ],
                                 ),
                                 child: InkWell(
                                   onTap: () {
                                     _updateBottomSheet();
                                   },
                                   child: Text(
                                     "Update",
                                     textAlign: TextAlign.center,
                                     style: TextStyle(
                                         color: Colors.white,
                                         fontWeight: FontWeight.bold),
                                   ),
                                 ),
                               ),
                             )
                                 : Container(
                               height: 10,
                             ),
                             Container(
                               padding: EdgeInsets.only(left: 5, bottom: 20),
                               child: Column(
                                 children: [
                                   Divider(
                                     color: Colors.grey[450],
                                     thickness: 1,
                                   ),
                                   InkWell(
                                     onTap: () {
                                       changePasswordPopUp();
                                     },
                                     child: Row(
                                       children: [
                                         Icon(
                                           Icons.vpn_key_outlined,
                                           size: 18,
                                         ),
                                         Container(
                                             padding: EdgeInsets.only(left: 8),
                                             child: Text("Change Password",style: TextStyle(fontSize: 18),)),
                                       ],
                                     ),
                                   ),
                                   Divider(
                                     color: Colors.grey[450],
                                     thickness: 1,
                                   ),
                                   InkWell(
                                     onTap: () {
                                       _logOutBottomSheet();
                                     },
                                     child: Row(
                                       children: [
                                         Icon(
                                           Icons.logout,
                                           size: 18,
                                         ),
                                         Container(
                                             padding: EdgeInsets.only(left: 8),
                                             child: Text("Logout",style: TextStyle(fontSize: 18))),
                                       ],
                                     ),
                                   ),
                                 ],
                               ),
                             ),
                           ],
                         ),
                       ),
                     ],
                   ),



                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,

                     children: [
                       Container(
                           padding:
                           EdgeInsets.only(top: 12, right: 12, left: 16,),
                           child: Text(
                             "OtherInformation",
                             style: TextStyle(
                                 fontSize: 18,
                                 fontWeight: FontWeight.bold,
                                 color: Colors.black),
                           )),
                       Container(
                         margin: EdgeInsets.only(top: 10),
                         width: double.infinity,
                         color: Colors.white,
                         child: Padding(
                           padding: const EdgeInsets.only(top: 12, left: 16,),
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Row(
                                 children: [

                                   Text("SSLC Marks :",
                                     style: TextStyle(color: Colors.grey, fontSize: 18),
                                   ),
                                   Text(
                                     data.profileDetailModel?.sTUDENTINFO?.sSLCMarksObtained??"hhhh",

                                     //"Student401",
                                     style: TextStyle(color: Colors.black, fontSize: 18),
                                   ),
                                 ],
                               ),
                               Row(
                                 children: [

                                   Text("PUC Marks :",
                                     style: TextStyle(color: Colors.grey, fontSize: 18),
                                   ),
                                   Text(
                                     data.profileDetailModel?.sTUDENTINFO?.pUCMarksObtained??"",

                                     //"Student401",
                                     style: TextStyle(color: Colors.black, fontSize: 18),
                                   ),
                                 ],
                               ), Row(
                                 children: [

                                   Text("Date Of Birth :",
                                     style: TextStyle(color: Colors.grey, fontSize: 18),
                                   ),
                                   Text(
                                     data.profileDetailModel?.sTUDENTINFO?.dateOfBirth??"",

                                     //"Student401",
                                     style: TextStyle(color: Colors.black, fontSize: 18),
                                   ),
                                 ],
                               ), Row(
                                 children: [

                                   Text("Blood Group:",
                                     style: TextStyle(color: Colors.grey, fontSize: 18),
                                   ),
                                   Text(
                                     data.profileDetailModel?.sTUDENTINFO?.bloodGroup??"",

                                     //"Student401",
                                     style: TextStyle(color: Colors.black, fontSize: 18),
                                   ),
                                 ],
                               ),
                             ],
                           ),
                         ),
                       ),

                       //Qualifying Examination

                       Container(
                           padding:
                           EdgeInsets.only(top: 12, right: 12, left: 16,),
                           child: Text(
                             "Qualifying Examination",
                             style: TextStyle(
                                 fontSize: 18,
                                 fontWeight: FontWeight.bold,
                                 color: Colors.black),
                           )),
                       Container(
                         margin: EdgeInsets.only(top: 10),
                         height: MediaQuery.of(context).size.height/15,
                         color: Colors.white,
                         width: double.infinity,
                         child: Padding(
                           padding: const EdgeInsets.only(top: 5,left: 16),
                           child: Row(
                             children: [
                               Column(
                                 children: [
                                   Text("EXAM",
                                     style: TextStyle(color: Colors.grey, fontSize: 18),
                                   ),
                                   SizedBox(height: 5,),
                                   Text(
                                     data.profileDetailModel?.sTUDENTINFO?.entranceExam??"",

                                     //"Student401",
                                     style: TextStyle(color: Colors.black, fontSize: 18),
                                   ),

                                 ],
                               ),Spacer(),VerticalDivider(color: Colors.grey, thickness: 1,),
                               Column(
                                 children: [
                                   Text("Rank",
                                     style: TextStyle(color: Colors.grey, fontSize: 18),
                                   ),
                                   SizedBox(height: 5,),
                                   Text(
                                     data.profileDetailModel?.sTUDENTINFO?.rank??"",

                                     //"Student401",
                                     style: TextStyle(color: Colors.black, fontSize: 18),
                                   ),

                                 ],
                               ),Spacer(),VerticalDivider(color: Colors.grey, thickness: 1,),
                               Padding(
                                 padding: const EdgeInsets.only(right: 50),
                                 child: Column(
                                   children: [
                                     Text("Score",
                                       style: TextStyle(color: Colors.grey, fontSize: 18),
                                     ),
                                     SizedBox(height: 5,),
                                     Text(
                                       data.profileDetailModel?.sTUDENTINFO?.entranceExamScore??"",

                                       //"Student401",
                                       style: TextStyle(color: Colors.black, fontSize: 18),
                                     ),

                                   ],
                                 ),
                               ),
                             ],
                           ),
                         ),
                       ),

                       // Parent Details

                       Container(
                           padding:
                           EdgeInsets.only(top: 12, right: 12, left: 16,),
                           child: Text(
                             "Parent Detail",
                             style: TextStyle(
                                 fontSize: 18,
                                 fontWeight: FontWeight.bold,
                                 color: Colors.black),
                           )),

                       Container(
                         margin: EdgeInsets.only(top: 10),
                         width: double.infinity,
                         color: Colors.white,
                         child: Padding(
                           padding: const EdgeInsets.only(top: 12, left: 16,),
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Row(
                                 children: [

                                   Text("Name :",
                                     style: TextStyle(color: Colors.grey, fontSize: 18),
                                   ),
                                   Text(
                                     data.profileDetailModel?.sTUDENTINFO?.fatherName??"",

                                     //"Student401",
                                     style: TextStyle(color: Colors.black, fontSize: 18),
                                   ),
                                 ],
                               ),SizedBox(height: 5,),
                               Row(
                                 children: [

                                   Text("Mobile :",
                                     style: TextStyle(color: Colors.grey, fontSize: 18),
                                   ),
                                   Text(
                                     data.profileDetailModel?.sTUDENTINFO?.fatherMobileNo??"",

                                     //"Student401",
                                     style: TextStyle(color: Colors.black, fontSize: 18),
                                   ),
                                 ],
                               ),SizedBox(height: 5,),
                               Row(
                                 children: [

                                   Text("Email :",
                                     style: TextStyle(color: Colors.grey, fontSize: 18),
                                   ),
                                   Text(
                                     data.profileDetailModel?.sTUDENTINFO?.fatherEmail??"",

                                     //"Student401",
                                     style: TextStyle(color: Colors.black, fontSize: 18),
                                   ),
                                 ],
                               ),SizedBox(height: 5,),
                               Row(
                                 children: [

                                   Text("Occupation:",
                                     style: TextStyle(color: Colors.grey, fontSize: 18),
                                   ),
                                   Text(
                                     data.profileDetailModel?.sTUDENTINFO?.fatherOccupation??"",

                                     //"Student401",
                                     style: TextStyle(color: Colors.black, fontSize: 18),
                                   ),
                                 ],
                               ),SizedBox(height: 5,),
                               Row(
                                 children: [

                                   Text("Qualification:",
                                     style: TextStyle(color: Colors.grey, fontSize: 18),
                                   ),
                                   Text(
                                     data.profileDetailModel?.sTUDENTINFO?.fatherQualification??"",

                                     //"Student401",
                                     style: TextStyle(color: Colors.black, fontSize: 18),
                                   ),
                                 ],
                               ),SizedBox(height: 5,),
                               Row(
                                 children: [

                                   Text("Designation:",
                                     style: TextStyle(color: Colors.grey, fontSize: 18),
                                   ),
                                   Text(
                                     data.profileDetailModel?.sTUDENTINFO?.fatherDesignation??"",

                                     //"Student401",
                                     style: TextStyle(color: Colors.black, fontSize: 18),
                                   ),
                                 ],
                               ),SizedBox(height: 5,),
                               Row(
                                 children: [

                                   Text("Employer:",
                                     style: TextStyle(color: Colors.grey, fontSize: 18),
                                   ),
                                   Text(
                                     data.profileDetailModel?.sTUDENTINFO?.fatherEmployerDetails??"",

                                     //"Student401",
                                     style: TextStyle(color: Colors.black, fontSize: 18),
                                   ),
                                 ],
                               ),SizedBox(height: 5,),
                               Divider(
                                 color: Colors.grey,
                                 thickness: 1,
                               ),
                               Text("Mother",style: TextStyle(color: Colors.black, fontSize: 18),),SizedBox(height: 5,),
                               Row(
                                 children: [

                                   Text("Name :",
                                     style: TextStyle(color: Colors.grey, fontSize: 18),
                                   ),
                                   Text(
                                     data.profileDetailModel?.sTUDENTINFO?.motherName??"",

                                     //"Student401",
                                     style: TextStyle(color: Colors.black, fontSize: 18),
                                   ),
                                 ],
                               ),SizedBox(height: 5,),
                               Row(
                                 children: [

                                   Text("Mobile :",
                                     style: TextStyle(color: Colors.grey, fontSize: 18),
                                   ),
                                   Text(
                                     data.profileDetailModel?.sTUDENTINFO?.motherMobileNo??"",

                                     //"Student401",
                                     style: TextStyle(color: Colors.black, fontSize: 18),
                                   ),
                                 ],
                               ),SizedBox(height: 5,),
                               Row(
                                 children: [

                                   Text("Email :",
                                     style: TextStyle(color: Colors.grey, fontSize: 18),
                                   ),
                                   Text(
                                     data.profileDetailModel?.sTUDENTINFO?.motherEmail??"",

                                     //"Student401",
                                     style: TextStyle(color: Colors.black, fontSize: 18),
                                   ),
                                 ],
                               ),SizedBox(height: 5,),
                               Row(
                                 children: [

                                   Text("Occupation:",
                                     style: TextStyle(color: Colors.grey, fontSize: 18),
                                   ),
                                   Text(
                                     data.profileDetailModel?.sTUDENTINFO?.motherOccupation??"",

                                     //"Student401",
                                     style: TextStyle(color: Colors.black, fontSize: 18),
                                   ),
                                 ],
                               ),SizedBox(height: 5,),
                               Row(
                                 children: [

                                   Text("Qualification:",
                                     style: TextStyle(color: Colors.grey, fontSize: 18),
                                   ),
                                   Text(
                                     data.profileDetailModel?.sTUDENTINFO?.motherQualification??"",

                                     //"Student401",
                                     style: TextStyle(color: Colors.black, fontSize: 18),
                                   ),
                                 ],
                               ),SizedBox(height: 5,),
                               Row(
                                 children: [

                                   Text("Designation:",
                                     style: TextStyle(color: Colors.grey, fontSize: 18),
                                   ),
                                   Text(
                                     data.profileDetailModel?.sTUDENTINFO?.motherDesignation??"",

                                     //"Student401",
                                     style: TextStyle(color: Colors.black, fontSize: 18),
                                   ),
                                 ],
                               ),SizedBox(height: 5,),
                               Row(
                                 children: [

                                   Text("Employer:",
                                     style: TextStyle(color: Colors.grey, fontSize: 18),
                                   ),
                                   Text(
                                     data.profileDetailModel?.sTUDENTINFO?.motherEmployerDetails??"",

                                     //"Student401",
                                     style: TextStyle(color: Colors.black, fontSize: 18),
                                   ),
                                 ],
                               ),SizedBox(height: 5,),
                             ],
                           ),
                         ),
                       ),

                       //Address

                       Container(
                           padding:
                           EdgeInsets.only(top: 12, right: 12, left: 16,),
                           child: Text(
                             "Address",
                             style: TextStyle(
                                 fontSize: 18,
                                 fontWeight: FontWeight.bold,
                                 color: Colors.black),
                           )),
                       Container(
                         margin: EdgeInsets.only(top: 10),
                         color: Colors.white,
                         width: double.infinity,
                         child: Padding(
                           padding: const EdgeInsets.only(left: 16,top: 10,bottom: 20),
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Text("Present Address",
                                 style: TextStyle(color: Colors.grey, fontSize: 18),
                               ),
                               SizedBox(height: 5,),
                               Text(
                                 data.profileDetailModel?.sTUDENTINFO?.permanentAddress??"",

                                 //"Student401",
                                 style: TextStyle(color: Colors.black, fontSize: 18),
                               ),
                               SizedBox(height: 5,),
                               Divider(color: Colors.grey,thickness: 1,),
                               Text("Permanent Address",
                                 style: TextStyle(color: Colors.grey, fontSize: 18),
                               ),
                               SizedBox(height: 5,),
                               Text(
                                 data.profileDetailModel?.sTUDENTINFO?.localAddress??"",

                                 //"Student401",
                                 style: TextStyle(color: Colors.black, fontSize: 18),
                               ),

                             ],
                           ),
                         ),
                       ),



                     ],
                   )

                 ],
               ),
             ),
           ):CircularProgressIndicator();

          }
      )
    );
  }



  void changePasswordPopUp() {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
              contentPadding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              content: Container(
                height: MediaQuery.of(context).size.height / 1.8,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: new BorderRadius.only(
                          topLeft: const Radius.circular(7.0),
                          topRight: const Radius.circular(7.0),
                        ),
                        color: Colors.blue,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.vpn_key_outlined,
                            size: 20,
                            color: Colors.white,
                          ),
                          Container(
                              padding: EdgeInsets.only(left: 8),
                              child: Text(
                                "Change Password",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              )),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Current Password"),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              padding: EdgeInsets.only(
                                  left: 8, top: 0, bottom: 0, right: 8),
                              height: 30,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                /* boxShadow: [
                                  BoxShadow(
                                      offset: Offset(2, 2),
                                      blurRadius: 6,
                                      color: Colors.grey)
                                ],*/
                                border: Border.all(color: Colors.grey),
                              ),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Enter Your Current Password",
                                    hintStyle: TextStyle(fontSize: 13)),
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          Text("Current Password"),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              padding: EdgeInsets.only(
                                  left: 8, top: 0, bottom: 0, right: 8),
                              height: 30,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                /* boxShadow: [
                                  BoxShadow(
                                      offset: Offset(2, 2),
                                      blurRadius: 6,
                                      color: Colors.grey)
                                ],*/
                                border: Border.all(color: Colors.grey),
                              ),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Enter Your Current Password",
                                    hintStyle: TextStyle(fontSize: 13)),
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          Text("Current Password"),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              padding: EdgeInsets.only(
                                  left: 8, top: 0, bottom: 0, right: 8),
                              height: 30,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                /* boxShadow: [
                                  BoxShadow(
                                      offset: Offset(2, 2),
                                      blurRadius: 6,
                                      color: Colors.grey)
                                ],*/
                                border: Border.all(color: Colors.grey),
                              ),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Enter Your Current Password",
                                    hintStyle: TextStyle(fontSize: 13)),
                              )),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.grey[500],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            padding: EdgeInsets.only(
                                top: 2, bottom: 2, left: 10, right: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.grey),
                              color: Colors.white,
                            ),
                            child: Text(
                              "Cancel",
                              style: TextStyle(
                                  color: Colors.grey[500],
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5, right: 8),
                          child: Container(
                            padding: EdgeInsets.only(
                                top: 2, bottom: 2, left: 10, right: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.blue),
                              color: Colors.blue,
                            ),
                            child: Text(
                              "Save Changes",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ));
        });
  }

  void _updateBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return new Container(
            height: MediaQuery.of(context).size.height * 0.20,
            color: Color(0xFF737373),
            //could change this to Color(0xFF737373),
            //so you don't have to change MaterialApp canvasColor
            child: new Container(
                padding: EdgeInsets.only(top: 20, left: 20),
                decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(30.0),
                        topRight: const Radius.circular(30.0))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    new Text(
                      "Update Details",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    new Text(
                      "Are you sure you want to update details?",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            color: Colors.white,
                            padding: EdgeInsets.only(
                                top: 8.0, bottom: 8.0, left: 18, right: 18),
                            child: Text(
                              "No",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        VerticalDivider(
                          color: Colors.grey[500],
                          thickness: 2,
                          width: 2,
                        ),
                        Container(
                          color: Colors.white,
                          padding: EdgeInsets.only(
                              top: 8.0, bottom: 8.0, left: 18, right: 18),
                          child: Text(
                            "yes",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    )
                  ],
                )),
          );
        });
  }

  void _logOutBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return new Container(
            height: MediaQuery.of(context).size.height * 0.20,
            color: Color(0xFF737373),
            child: new Container(
                padding: EdgeInsets.only(top: 20, left: 20),
                decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(30.0),
                        topRight: const Radius.circular(30.0))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    new Text(
                      "Log Out",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    new Text(
                      "Are you sure you want to logout?",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            color: Colors.white,
                            padding: EdgeInsets.only(
                                top: 8.0, bottom: 8.0, left: 18, right: 18),
                            child: Text(
                              "No",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        VerticalDivider(
                          color: Colors.grey[500],
                          thickness: 2,
                          width: 2,
                        ),
                        Container(
                          color: Colors.white,
                          padding: EdgeInsets.only(
                              top: 8.0, bottom: 8.0, left: 18, right: 18),
                          child: Text(
                            "yes",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    )
                  ],
                )),
          );
        });
  }
}
