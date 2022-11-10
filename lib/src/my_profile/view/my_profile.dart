
import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:pesu/src/my_profile/model/update_detail_model.dart';
import 'package:pesu/src/my_profile/model/update_password_model.dart';
import 'package:pesu/src/my_profile/profile_viewmodel/profile_viewmodel.dart';
import 'package:pesu/utils/constants/sp_constants.dart';
import 'package:pesu/utils/view/widget.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import '../../../utils/constants/custom_widgets.dart';
import '../../../utils/services/app_routes.dart';
import '../../../utils/services/sharedpreference_utils.dart';
import '../../login/view/login.dart';


class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  ProfileViewmodel? profileViewmodel;
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  UpdatePasswordModel? updatePasswordModel;
  SharedPreferenceUtil preferenceUtil=SharedPreferenceUtil();



  final _formKey = GlobalKey<FormState>();
  final _formKey1 = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();


    profileViewmodel = Provider.of<ProfileViewmodel>(context, listen: false);
    profileViewmodel!.getProfileDetails(
        action: 4,
        mode: 7,
        randomNum: 0.824022142978994,
        callMethod: 'background',
        isProfileRequest: true);
    profileViewmodel!.getProfileDetailsData(
      action: 27,
      mode: 1,
      // userId: "PES1202002878",
      randomNum: 0.5799475622899326,
      callMethod: 'background',
      // loginId: "PES1202002878",
      searchUserId: "7b14a7f5-13a7-4c1c-a17d-42e7ac9a147f",
      userType: 1,
      // userRoleId: '9edf9870-4ff9-4a05-828e-815af70cf760'
    );




  }


  bool edit = false;
  bool show = false;
  String _errorMessage = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset:false,

        backgroundColor: Colors.grey[200],
        appBar:AppBar(
          elevation: 0,
          backgroundColor: Color(0xff0091cd),
          leading:  BackButton(
            onPressed: (){
              Navigator.pushNamed(
                  context,
                  AppRoutes.Dashboard);
            },
          ),
          title: Text("My Profile"),
        ),


        body:Consumer<ProfileViewmodel>(builder: (context, data, child) {
          String? base64Image = (data.profileModel?.photo);
          final UriData? mydata = Uri.parse(base64Image.toString()).data;
          Uint8List? myImage = mydata?.contentAsBytes();


          return data.profileModel != null && data.profileDetailModel != null

              ? SingleChildScrollView(
            child: Container(
              color: Colors.grey[200],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    color: Color(0xff0091CD),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 20, top: 20, left: 16),
                      child:
                      Row(
                        children: [
                          myImage != null
                              ? ClipOval(


                                child: Image.memory(
                            myImage,
                            gaplessPlayback: true,
                            height: 100,
                            width: 100,
                                  fit: BoxFit.fill,


                          ),

                              )
                              :
                          Icon(Icons.account_circle_sharp,size: 100,color: Colors.white,),


                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width /
                                1.8,
                            padding: EdgeInsets.only(
                                top: 8, right: 8, bottom: 8),
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data.profileModel?.name ?? "",

                                  //"Student401",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,fontWeight: FontWeight.w300),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'PESU ID : ',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight:
                                          FontWeight.w300),
                                    ),
                                    Text(
                                      data.profileModel?.loginId ??
                                          "",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,fontWeight: FontWeight.w300),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'SRN: ',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight:
                                          FontWeight.w300),
                                    ),
                                    Text(
                                      data.profileModel
                                          ?.departmentId ??
                                          "",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,fontWeight: FontWeight.w300),
                                    ),
                                  ],
                                ),
                                Text(
                                  "${data.profileModel?.program ?? ""} | ${data.profileModel?.branch ?? ""}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300),
                                ),
                                Text(
                                  data.profileModel?.className ?? "",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Form(
                    key: _formKey1,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Container(
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
                                  emailController.text=data.profileModel?.email ??"";
                                  phoneController.text=data.profileModel?.phone ??"";
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
                                      top: 5,
                                      bottom: 5,
                                      left: 12,
                                      right: 12),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(12),
                                    color: (edit == false)
                                        ? Color(0xff0091cd)
                                        : Color(0xfff36b15),
                                    /*    boxShadow: [
                                  BoxShadow(
                                      color: Colors.blueGrey, spreadRadius: 3),
                                ],*/
                                  ),
                                  child: Text(
                                    (edit == false) ? "Edit" : "Cancel",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                              padding:
                              EdgeInsets.only(top: 10, bottom: 10),
                              child: Text(
                                "Email ID",
                                style: TextStyle(
                                    color: Color(0xff999999),
                                    fontSize: 14),
                              )),
                          (edit == false)
                              ? Text(
                            data.profileModel?.email ?? "",
                            style: TextStyle(fontSize: 14),
                          )
                              :  TextFormField(
                            // autofocus: true,
                            controller: emailController,
                            decoration: new InputDecoration(
                              contentPadding: EdgeInsets.only(
                                  top: 1, left: 4, bottom: 1, right: 4),
                              // hintText: data.profileModel?.email,
                              hintStyle: TextStyle(
                                fontFamily: "Nunito",
                                fontSize: 14,
                                color: Colors.black,
                              ),
                              border: new OutlineInputBorder(
                                borderRadius:
                                new BorderRadius.circular(5.0),
                                borderSide: new BorderSide(
                                  color: Color(0xffCFD8DC),
                                ),
                              ),
                            ),
                            onChanged: (val) {
                              validateEmail(val);
                              setState(() {

                              });

                            },
                          ),
                          (edit==true)?
                          Padding(
                            padding: const EdgeInsets.only(top:5),
                            child: Text(_errorMessage, style: TextStyle(color: Colors.red),),
                          ):Text(""),

                          Container(
                              padding:
                              EdgeInsets.only(top: 5, bottom: 10),
                              child: Text(
                                "Contact No",
                                style: TextStyle(
                                    color: Color(0xff999999),
                                    fontSize: 14),
                              )),
                          (edit == false)
                              ? Text(
                            data.profileModel?.phone ?? "",
                            style: TextStyle(fontSize: 14),
                          )

                              :  TextFormField(
                            validator: (String? value) {
                              if (value!.length<10) {
                                return 'Please Enter Valid Number';
                              }
                              else if(value .length==10){
                                _formKey1.currentState?.deactivate();
                              }
                            },
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],                            maxLength: 10,
                            //autofocus: true,
                            controller: phoneController,
                            decoration: new InputDecoration(
                              contentPadding: EdgeInsets.only(
                                  top: 1, left: 4, bottom: 1, right: 4),
                              // hintText: data.profileModel?.phone,
                              hintStyle: TextStyle(
                                fontFamily: "Nunito",
                                fontSize: 16,
                                color: Colors.black,
                              ),
                              counterText: "",

                              border: new OutlineInputBorder(
                                borderRadius:
                                new BorderRadius.circular(5.0),
                                borderSide: new BorderSide(
                                  color: Colors.blueAccent,
                                ),
                              ),
                            ),
                            onChanged: (text) {
                              setState(() {
                                if(phoneController.text.length==10){
                                  FocusScope.of(context).requestFocus(new FocusNode());
                                }
                              });
                            },
                          ),

                          (edit == true)
                              ? Padding(
                            padding: const EdgeInsets.only(
                                left: 8.0,
                                right: 8.0,
                                bottom: 15,
                                top: 25),
                            child: Container(
                              width: MediaQuery.of(context)
                                  .size
                                  .width,
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(15),
                                color: Colors.blue,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.blue,
                                      spreadRadius: 3),
                                ],
                              ),
                              child: InkWell(
                                onTap: () {
                                  if (_formKey1.currentState != null) {
                                    _formKey1.currentState?.validate();

                                    if(!EmailValidator.validate(emailController.text, true)){
                                      setState(() {
                                        CustomWidgets.getToast(message: "Email is Invalid", color:  Color(0xff273746));

                                      });
                                    }
                                    else if(EmailValidator.validate(emailController.text, false)&&phoneController.text.length==10){
                                      // updateDetailPopUp();
                                      //_updateBottomSheet();
                                      _updatePopupDialog();
                                    }

                                  }

                                },
                                child: Text(
                                  "Update",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight:
                                      FontWeight.bold),
                                ),
                              ),
                            ),
                          )
                              : Container(
                            height: 10,
                          ),
                          Container(
                            padding:
                            EdgeInsets.only(left: 5, bottom: 20),
                            child: Column(
                              children: [
                                (edit==false)?
                                Divider(
                                  color: Colors.grey[450],
                                  thickness: 1,
                                ):Container(),
                                InkWell(
                                  onTap: () {
                                    changePasswordPopUp();
                                  },
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.edit,
                                        size: 18,
                                      ),
                                      Container(
                                          padding:
                                          EdgeInsets.only(left: 8),
                                          child: Text(
                                            "Change Password",
                                            style:
                                            TextStyle(fontSize: 16),
                                          )),
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
                                        Icons.lock_open_rounded,
                                        size: 16,
                                      ),
                                      Container(
                                          padding:
                                          EdgeInsets.only(left: 8),
                                          child: Text("Logout",
                                              style: TextStyle(
                                                  fontSize: 18))),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          padding: EdgeInsets.only(
                            top: 12,
                            right: 12,
                            left: 16,
                          ),
                          child: Text(
                            "Other Information",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Colors.black),
                          )),
                      Container(
                        margin: EdgeInsets.only(top: 10,),
                        width: double.infinity,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 12,
                            left: 16,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "SSLC Marks :",
                                    style: TextStyle(
                                        color: Color(0xff9B9B9B), fontSize: 14),
                                  ),
                                  Text(
                                    data.profileDetailModel?.sTUDENTINFO
                                        ?.sSLCMarksObtained ??
                                        "hhhh",

                                    //"Student401",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "PUC Marks :",
                                    style: TextStyle(
                                        color: Color(0xff9B9B9B), fontSize: 14),
                                  ),
                                  Text(
                                    data.profileDetailModel?.sTUDENTINFO
                                        ?.pUCMarksObtained ??
                                        "",

                                    //"Student401",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Date Of Birth :",
                                    style: TextStyle(
                                        color: Color(0xff9B9B9B), fontSize: 14),
                                  ),
                                  Text(
                                    data.profileDetailModel?.sTUDENTINFO
                                        ?.dateOfBirth ??
                                        "",

                                    //"Student401",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Blood Group:",
                                    style: TextStyle(
                                        color: Color(0xff9B9B9B), fontSize: 14),
                                  ),
                                  Text(
                                    data.profileDetailModel?.sTUDENTINFO
                                        ?.bloodGroup ??
                                        "",

                                    //"Student401",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10,),
                            ],
                          ),
                        ),
                      ),

                      //Qualifying Examination

                      Container(
                          padding: EdgeInsets.only(
                            top: 12,
                            right: 12,
                            left: 16,
                          ),
                          child: Text(
                            "Qualifying Examination",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Colors.black),
                          )),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        height: MediaQuery.of(context).size.height / 15,
                        color: Colors.white,
                        width: double.infinity,
                        child: Padding(
                          padding:
                          const EdgeInsets.only(top: 5, left: 16),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "Exam",
                                    style: TextStyle(
                                        color: Color(0xff9B9B9B), fontSize: 14),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    data.profileDetailModel?.sTUDENTINFO
                                        ?.entranceExam ??
                                        "",

                                    //"Student401",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14),
                                  ),
                                ],
                              ),
                              Spacer(),
                              VerticalDivider(
                                color: Colors.grey,
                                thickness: 1,
                              ),
                              Column(
                                children: [
                                  Text(
                                    "Rank",
                                    style: TextStyle(
                                        color: Color(0xff9B9B9B), fontSize: 14),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    data.profileDetailModel?.sTUDENTINFO
                                        ?.rank ??
                                        "",

                                    //"Student401",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14),
                                  ),
                                ],
                              ),
                              Spacer(),
                              VerticalDivider(
                                color: Colors.grey,
                                thickness: 1,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 50),
                                child: Column(
                                  children: [
                                    Text(
                                      "Score",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      data.profileDetailModel?.sTUDENTINFO
                                          ?.entranceExamScore ??
                                          "",

                                      //"Student401",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14),
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
                          padding: EdgeInsets.only(
                            top: 12,
                            right: 12,
                            left: 16,
                          ),
                          child: Text(
                            "Parent Details",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Colors.black),
                          )),

                      Container(
                        margin: EdgeInsets.only(top: 10),
                        width: double.infinity,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 12,
                            left: 16,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Father",
                                style: TextStyle(
                                    color:Colors.black, fontSize: 18),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      "Name :",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 14),
                                    ),
                                    Text(
                                      data.profileDetailModel?.sTUDENTINFO
                                          ?.fatherName ??
                                          "",

                                      //"Student401",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Mobile :",
                                    style: TextStyle(
                                        color: Color(0xff9B9B9B), fontSize: 14),
                                  ),
                                  InkWell(
                                    onTap: (){
                                      UrlLauncher.launch('tel:+${data.profileDetailModel?.sTUDENTINFO?.fatherMobileNo.toString()}');
                                    },
                                    child: Text(
                                      data.profileDetailModel?.sTUDENTINFO
                                          ?.fatherMobileNo ??
                                          "",

                                      //"Student401",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 14),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Email :",
                                    style: TextStyle(
                                        color: Color(0xff9B9B9B), fontSize: 14),
                                  ),
                                  InkWell(
                                    onTap: (){
                                      UrlLauncher.launch('mailto:${data.profileDetailModel?.sTUDENTINFO?.fatherEmail}');

                                    },
                                    child: Text(
                                      data.profileDetailModel?.sTUDENTINFO
                                          ?.fatherEmail ??
                                          "",

                                      //"Student401",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 14),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Occupation:",
                                    style: TextStyle(
                                        color: Color(0xff9B9B9B), fontSize: 14),
                                  ),
                                  Text(
                                    data.profileDetailModel?.sTUDENTINFO
                                        ?.fatherOccupation ??
                                        "",

                                    //"Student401",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Qualification:",
                                    style: TextStyle(
                                        color: Color(0xff9B9B9B), fontSize: 14),
                                  ),
                                  Text(
                                    data.profileDetailModel?.sTUDENTINFO
                                        ?.fatherQualification ??
                                        "",

                                    //"Student401",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Designation:",
                                    style: TextStyle(
                                        color: Color(0xff9B9B9B), fontSize: 14),
                                  ),
                                  Text(
                                    data.profileDetailModel?.sTUDENTINFO
                                        ?.fatherDesignation ??
                                        "",

                                    //"Student401",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Employer:",
                                    style: TextStyle(
                                        color: Color(0xff9B9B9B), fontSize: 14),
                                  ),
                                  Text(
                                    data.profileDetailModel?.sTUDENTINFO
                                        ?.fatherEmployerDetails ??
                                        "",

                                    //"Student401",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Divider(
                                color: Colors.grey,
                                thickness: 1,
                              ),
                              Text(
                                "Mother",
                                style: TextStyle(
                                    color:Colors.black, fontSize: 18),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Name :",
                                    style: TextStyle(
                                        color: Color(0xff9B9B9B), fontSize: 14),
                                  ),
                                  Text(
                                    data.profileDetailModel?.sTUDENTINFO
                                        ?.motherName ??
                                        "",

                                    //"Student401",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Mobile :",
                                    style: TextStyle(
                                        color: Color(0xff9B9B9B), fontSize: 14),
                                  ),
                                  InkWell(
                                    onTap: (){
                                      UrlLauncher.launch('tel:+${data.profileDetailModel?.sTUDENTINFO?.motherMobileNo.toString()}');

                                    },
                                    child: Text(
                                      data.profileDetailModel?.sTUDENTINFO
                                          ?.motherMobileNo ??
                                          "",

                                      //"Student401",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 14),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Email :",
                                    style: TextStyle(
                                        color: Color(0xff9B9B9B), fontSize: 14),
                                  ),
                                  InkWell(
                                    onTap: (){
                                      UrlLauncher.launch('mailto:+${data.profileDetailModel?.sTUDENTINFO?.motherEmail.toString()}');

                                    },
                                    child: Text(
                                      data.profileDetailModel?.sTUDENTINFO
                                          ?.motherEmail ??
                                          "",

                                      //"Student401",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 14),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Occupation:",
                                    style: TextStyle(
                                        color:Color(0xff9B9B9B), fontSize: 14),
                                  ),
                                  Text(
                                    data.profileDetailModel?.sTUDENTINFO
                                        ?.motherOccupation ??
                                        "",

                                    //"Student401",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Qualification:",
                                    style: TextStyle(
                                        color:Color(0xff9B9B9B), fontSize: 14),
                                  ),
                                  Text(
                                    data.profileDetailModel?.sTUDENTINFO
                                        ?.motherQualification ??
                                        "",

                                    //"Student401",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Designation:",
                                    style: TextStyle(
                                        color:Color(0xff9B9B9B), fontSize: 14),
                                  ),
                                  Text(
                                    data.profileDetailModel?.sTUDENTINFO
                                        ?.motherDesignation ??
                                        "",

                                    //"Student401",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Employer:",
                                    style: TextStyle(
                                        color: Color(0xff9B9B9B), fontSize: 14),
                                  ),
                                  Text(
                                    data.profileDetailModel?.sTUDENTINFO
                                        ?.motherEmployerDetails ??
                                        "",

                                    //"Student401",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                            ],
                          ),
                        ),
                      ),

                      //Address

                      Container(
                          padding: EdgeInsets.only(
                            top: 12,
                            right: 12,
                            left: 16,
                          ),
                          child: Text(
                            "Address",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Colors.black),
                          )),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        color: Colors.white,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 16, top: 10, bottom: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Present Address",
                                style: TextStyle(
                                    color: Color(0xff9B9B9B), fontSize: 14),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                data.profileDetailModel?.sTUDENTINFO
                                    ?.permanentAddress ??
                                    "",

                                //"Student401",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 14),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Divider(
                                color: Colors.grey,
                                thickness: 1,
                              ),
                              Text(
                                "Permanent Address",
                                style: TextStyle(
                                    color:Color(0xff9B9B9B), fontSize: 14),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                data.profileDetailModel?.sTUDENTINFO
                                    ?.localAddress ??
                                    "",

                                //"Student401",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 14),
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
          )
              : Center(child: CircularProgressIndicator());
        }));
  }

  void changePasswordPopUp() {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: AlertDialog(
                  contentPadding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  content: Container(
                    height: MediaQuery.of(context).size.height / 1.9,
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
                                Icons.lock_outline,
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
                              Text("Current Password",
                                style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                              Container(
                                margin: EdgeInsets.only(
                                  top: 3,
                                ),
                                child: TextFormField(
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  validator: (String? value) {
                                    if (value!.trim().isEmpty) {
                                      return "Please Enter Current Password";
                                    } else {
                                      return null;
                                    }
                                  },
                                  //autofocus: true,
                                  controller: currentPasswordController,
                                  decoration: new InputDecoration(
                                    contentPadding: EdgeInsets.only(
                                        top: 1, left: 4, bottom: 1, right: 4),
                                    hintText: "Enter Your Current Password",
                                    hintStyle: TextStyle(
                                      fontFamily: "Nunito",
                                      fontSize: 16,
                                      color: Colors.grey,
                                    ),
                                    border: new OutlineInputBorder(
                                      borderRadius:
                                      new BorderRadius.circular(5.0),
                                      borderSide: new BorderSide(
                                        color: Color(0xffCFD8DC),
                                      ),
                                    ),
                                  ),
                                  onChanged: (text) {
                                    setState(() {});
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text("New Password", style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
                              Container(
                                margin: EdgeInsets.only(top: 3),
                                child: TextFormField(
                                  autovalidateMode: AutovalidateMode.onUserInteraction,

                                  validator: (String? value) {
                                    if (value!.trim().isEmpty) {
                                      return "Please Enter New Password";
                                    } else if(value.length<6 ) {
                                      return "Please Enter at least 6 characters";
                                    }
                                    else if(value.length>20){
                                      return "Password length more than 20 characters";
                                    }else{
                                      return null;
                                    }
                                  },
                                  //autofocus: true,
                                  controller: newPasswordController,
                                  decoration: new InputDecoration(
                                    contentPadding: EdgeInsets.only(
                                        top: 1, left: 4, bottom: 1, right: 4),
                                    hintText: "Enter New Password",
                                    hintStyle: TextStyle(
                                      fontFamily: "Nunito",
                                      fontSize: 16,
                                      color: Colors.grey,
                                    ),
                                    border: new OutlineInputBorder(
                                      borderRadius:
                                      new BorderRadius.circular(5.0),
                                      borderSide: new BorderSide(
                                        color: Color(0xffCFD8DC),
                                      ),
                                    ),
                                  ),
                                  onChanged: (text) {
                                    setState(() {});
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Confirm Password", style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
                              Container(
                                margin: EdgeInsets.only(top: 3),
                                child:
                                TextFormField(
                                  autovalidateMode: AutovalidateMode.onUserInteraction,

                                  validator: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Please Re-enter Confirm Password';
                                    } else if (value.trim() !=
                                        newPasswordController.text) {
                                      return 'Password Does not match';
                                    }
                                  },
                                 // autofocus: true,
                                  controller: confirmPasswordController,
                                  decoration: new InputDecoration(
                                    contentPadding: EdgeInsets.only(
                                        top: 1, left: 4, bottom: 1, right: 4),
                                    hintText: "Enter Confirm Password",
                                    hintStyle: TextStyle(
                                      fontFamily: "Nunito",
                                      fontSize: 16,
                                      color: Colors.grey,
                                    ),
                                    border: new OutlineInputBorder(
                                      borderRadius:
                                      new BorderRadius.circular(5.0),
                                      borderSide: new BorderSide(
                                        color: Color(0xffCFD8DC),
                                      ),
                                    ),
                                  ),
                                  onChanged: (text) {
                                    setState(() {});
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.grey[500],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).pop();
                                  currentPasswordController.clear();
                                  confirmPasswordController.clear();
                                  newPasswordController.clear();

                                },
                                child: Container(
                                  padding: EdgeInsets.only(
                                      top: 7, bottom: 7, left: 10, right: 10),
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
                              InkWell(
                                onDoubleTap: (){

                                },
                                onTap: () async {
                                  var oldPassword =await preferenceUtil.getString(sp_password);
                                  if (_formKey.currentState != null) {
                                    _formKey.currentState?.validate();
                                   if(oldPassword==newPasswordController.text){
                                    CustomWidgets.getToast(message: "New password can't be same as old password", color:  Color(0xff273746));

                                  }
                                   else if(oldPassword==currentPasswordController.text){
                                      await profileViewmodel
                                          ?.getUpdatePasswordDetails1(action: 10, mode: 1, randomNum: 0.47685889613355137, oldPass: currentPasswordController.text, newPass:  newPasswordController.text,
                                          newPass1: confirmPasswordController.text);
                                      Navigator.pop(context);
                                      CustomWidgets.getToast(message: "Password updated", color:  Color(0xff273746));
                                      Navigator.pushReplacementNamed(
                                          context, AppRoutes.myProfile);
                                   } else if(oldPassword==newPasswordController.text){
                                        CustomWidgets.getToast(message: "New password can't be same as old password", color:  Color(0xff273746));

                                    }

                                    else if(currentPasswordController.text.isEmpty && newPasswordController.text.isEmpty && confirmPasswordController.text.isEmpty ){
                                      CustomWidgets.getToast(message: "Please fill all required details", color:  Color(0xff273746));

                                    }else if(newPasswordController.text !=confirmPasswordController.text){
                                     CustomWidgets.getToast(message: "New password and confirm password not matched", color:  Color(0xff273746));

                                   }
                                    else{
                                      CustomWidgets.getToast(message: "Old password not matched", color:  Color(0xff273746));

                                    }



                                  }
                                },
                                child: Container(
                                  padding: EdgeInsets.only(
                                      top: 7, bottom: 7, left: 10, right: 10),
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
                        ),
                      ],
                    ),
                  )),
            ),
          );
        });
  }





  void _updatePopupDialog() {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))
              ),
            contentPadding: EdgeInsets.only(top: 15,left: 20,right: 20),
            content: Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              height: MediaQuery.of(context).size.height/5,
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: new
                Column(
                 // mainAxisAlignment: MainAxisAlignment.start,
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
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              style: TextStyle(color: Color(0xff00366F),fontSize: 14),
                            ),
                          ),
                        ),
                        VerticalDivider(
                          color: Colors.grey[500],
                          thickness: 2,
                          width: 2,
                        ),
                        GestureDetector(
                          onDoubleTap: (){

                          },
                          onTap: ()async{

                            await profileViewmodel?.getUpdateDetails1(
                                action: 12,
                                mode: 2,
                                email: emailController.text,
                                phone: phoneController.text,
                                randomNum: 0.03338104178082224
                            );
                            Navigator.pushReplacementNamed(
                                context, AppRoutes.myProfile);
                            CustomWidgets.getToast(message: "Detail updated successfully", color:  Color(0xff273746));


                          },
                          child: Container(
                            color: Colors.white,
                            padding: EdgeInsets.only(
                                top: 8.0, bottom: 8.0, left: 18, right: 18),
                            child: Text(
                              "yes",
                              style: TextStyle(color: Color(0xff00366F),fontSize: 14),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )

          );
        });
  }
  void _logOutBottomSheet() {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))
              ),
           // contentPadding: EdgeInsets.all(0),
              contentPadding: EdgeInsets.only(top: 15,left: 20,right: 20),

              content: Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              height: MediaQuery.of(context).size.height/5,
              child: Padding(
                padding: const EdgeInsets.only(left: 20,top: 20,right: 10),
                child: new
                Column(
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
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () async{
                            Navigator.pop(context);
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
                          child: GestureDetector(
                            onTap: () async{
                              final provider =
                              Provider.of<GoogleSignInProvider>(context, listen: false);
                              provider.logout();
                              CustomWidgets.showLoaderDialog(context: context,message: 'Logging out....');
                              CustomWidgets.getToast(message: "Logged out successfully", color:  Color(0xff464646));
                              Navigator.pop(context);

                              Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  AppRoutes.login,
                                      (route) => false);
                              await SharedPreferenceUtil()
                                  .clearAll();
                            },
                            child: Text(
                              "yes",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                )

              ),
            )

          );
        });
  }

  void validateEmail(String val) {
    if(val.isEmpty){
      setState(() {
        _errorMessage = "Email can not be empty";
      });
    }else if(!EmailValidator.validate(val, true)){
      setState(() {
        _errorMessage = "Invalid Email Address";
      });
    }else{
      setState(() {

        _errorMessage = "";
      });
    }
  }






}










