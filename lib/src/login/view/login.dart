import 'dart:developer';
import 'dart:io';

import 'package:avoid_keyboard/avoid_keyboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pesu/src/dashboard_module/view/dashboard_page.dart';
import 'dart:math' as math;

import 'package:pesu/src/login/model/forget_password_model.dart';
import 'package:pesu/src/login/model/login_response_model.dart';
import 'package:pesu/src/login/viewmodel/login_viewmodel.dart';
import 'package:pesu/utils/constants/sp_constants.dart';
import 'package:pesu/utils/services/sharedpreference_utils.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/constants/custom_widgets.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isObscure = true;
  late LoginViewModel _viewModel;
  late TextEditingController passwordController = TextEditingController();
  late TextEditingController usernameController = TextEditingController();
  late TextEditingController forgetPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _viewModel = Provider.of<LoginViewModel>(context, listen: false);
    _focus.addListener(_onFocusChange);
    _focusPass.addListener(_onFocusChange);




  }
  void dispose() {
    super.dispose();
    _focus.removeListener(_onFocusChange);
    _focusPass.removeListener(_onFocusChange);
    _focus.dispose();
    _focusPass.dispose();
  }

  void _onFocusChange() {
    debugPrint("Focus: ${_focus.hasFocus.toString()}");
  }

  final _form = GlobalKey<FormState>();

  FocusNode _focus = FocusNode();
  FocusNode _focusPass = FocusNode();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.white,
              title: Image.asset(
                'assets/images/logo.png',
                height: 40,
              ),
              titleSpacing: 100,
            ),
            body: GestureDetector(
              onTap: (){
                if(_focusPass.hasFocus||_focus.hasFocus){
                  _focus.unfocus();_focusPass.unfocus();
                }
              },
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      opacity: 0.6,
                      colorFilter: ColorFilter.mode(
                          Colors.black87.withOpacity(1), BlendMode.dstATop),
                      image: AssetImage(
                        "assets/images/test1.png",

                      ),
                      fit: BoxFit.cover),
                ),
                child: ListView(
                  padding:EdgeInsets.only(left: 50,right: 50,bottom: 30),
                  reverse: true,

                  shrinkWrap: true,
                    children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 200),
                    child: Center(
                      child: Text(
                        "Sign in",
                        style: TextStyle(
                            fontSize: 52,
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Source Sans Pro'),
                      ),
                    ),
                  ),
                 // SizedBox(height: 140,),

                  InkWell(
                    onTap: () {
                      final provider =
                          Provider.of<GoogleSignInProvider>(context,
                              listen: false);
                      provider.googleLogin();
                    },
                    child:
                    Container(
                      color: Color(0xff0091CD),
                      child: Row(
                        children: [
                          Container(
                            height: 40.0,
                            width: 40.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/google_logo.png'),
                                  fit: BoxFit.cover),
                              // shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Sign In with Google",
                            style: TextStyle(
                                fontSize: 18,
                                color: Color(0xffFFFFFF),
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Source Sans Pro'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 1.0,
                          width: 80.0,
                          color: Color(0xff888888),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 1.0,
                          width: 80.0,
                          color: Color(0xff888888),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "or",
                        style: TextStyle(
                            fontSize: 18,
                            color: Color(0xffFFFFFF),
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Source Sans Pro'),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        height: 1.0,
                        width: 70.0,
                        color: Color(0xff888888),
                      ),
                      Container(
                        height: 1.0,
                        width: 80.0,
                        color: Color(0xff888888),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(color:Color(0xff888888) ),
                    ),

                    child: TextFormField(
                      cursorColor: Colors.white,
                      style: TextStyle(color: Colors.white,fontSize: 16),
                      focusNode: _focus,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      // validator: (String? value) {
                      //   if (value!.trim().isEmpty) {
                      //     return "Please Enter Valid User name/SRN";
                      //   } else {
                      //     return null;
                      //   }
                      // },
                     // autofocus: true,
                      controller: usernameController,
                      decoration: new InputDecoration(
                        fillColor: Colors.transparent,

                        contentPadding: EdgeInsets.only(
                            left: 10,),
                        hintText: "Username / SRN",
                        hintStyle: TextStyle(
                          fontFamily: "Nunito",
                          fontSize: 16,
                          color: Colors.white,
                        ),
                        border: InputBorder.none,


                      ),
                      onChanged: (text) {
                        setState(() {});
                      },

                    ),
                  ),


                  Container(
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(color:Color(0xff888888) ),
                    ),
                    margin: EdgeInsets.only(
                      top: 20,
                    ),
                    child: TextFormField(
                      cursorColor: Colors.white,

                      style: TextStyle(color: Colors.white,fontSize: 16),
                      focusNode: _focusPass,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      // validator: (String? value) {
                      //   if (value!.trim().isEmpty) {
                      //     return "Please Enter Valid Password";
                      //   } else {
                      //     return null;
                      //   }
                      // },
                    //  autofocus: true,
                      controller: passwordController,
                      obscureText: _isObscure,
                      decoration: new InputDecoration(
                          fillColor: Colors.transparent,
                        contentPadding: EdgeInsets.only(
                           left: 10,top: 5),
                        hintText: "Password",
                        hintStyle: TextStyle(
                          fontFamily: "Nunito",
                          fontSize: 16,
                          color: Colors.white,
                        ),
                          border: InputBorder.none,

                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            },
                            icon: Icon(
                              _isObscure
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off,
                              color: Colors.white,
                            ),
                          )
                      ),
                      onChanged: (text) {
                        setState(() {});
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () async {
                      if(usernameController.text.trim().isEmpty || passwordController.text.trim().isEmpty){
                        CustomWidgets.getToast(message: "Please fill all required fields", color:  Color(0xff273746));
                      }else {
                        LoginModel responseModel =
                        await _viewModel.getLoginDetails(
                            password: passwordController.text,
                            username: usernameController.text);

                        if (responseModel != null) {


                          log("Oye login came");
                          SharedPreferenceUtil util =
                          SharedPreferenceUtil();
                          await util.setString(
                              sp_userId, responseModel.userId ?? "");
                          await util.setString(
                              sp_password, passwordController.text);
                          await util.setString(
                              sp_classId, "${responseModel.classId}");
                          await util.setString(
                              sp_userName, "${responseModel.name}");
                          await util.setString(sp_batchClassId,
                              "${responseModel.batchClass}");
                          await util.setString(sp_classBatchSectionId,
                              "${responseModel.classBatchSection}");
                          await util.setString(sp_userRoleId,
                              "${responseModel.userRoleId}");
                          await util.setString(
                              sp_branch, "${responseModel.branch}");
                          await util.setString(sp_className,
                              "${responseModel.className}");
                          await util.setString(sp_branch,
                              "${responseModel.className}");
                          await util.setString(
                              sp_loginId, "${responseModel.loginId}");

                          await util.setString(sp_DepartmentId,
                              "${responseModel.departmentId}");
                          await util.setString(sp_programId,
                              "${responseModel.programId}");


                          // await util.setString(
                          //     sp_userName,responseModel.userParentList);
                          // await util.setString(sp_token,
                          //     responseModel.mobileAppTokenError?? '');
                          log("Bose 2 ame:  ${await util.getToken()}");
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => DashboardScreen()));
                        } else {
                          log('Oye am not coming');
                        }
                      }

                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xff0091cd),
                      ),
                      height: 34,
                      //color: Color(0xff0091cd),
                      child: Center(
                        child: Text(
                          "Sign in",
                          style: TextStyle(
                            color: Color(0xffFFFFFF),
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Source Sans Pro',
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      _buildPopupDialog();
                    },
                    child: Center(
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                          color: Color(0xffFFFFFF),
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Source Sans Pro',
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Text(
                      "For all login issue, please send an email to ",
                      style: TextStyle(
                        color: Color(0xffFFFFFF),
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Source Sans Pro',
                        fontSize: 16,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      _SendEmail();
                    },
                    child: Center(
                      child: Text(
                        "support@pesuacademy.com",
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Source Sans Pro',
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                      // Container(height: 60.0),

                      //Spacer(),
                ].reversed.toList(),
                ),
              ),
            )

        )
    );
  }


  void _buildPopupDialog() {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(0),
            content: new Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    color: Colors.blue,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Icon(
                            Icons.lock_outline_rounded,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Forget your Password?",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )),
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: TextFormField(
                            controller: forgetPasswordController,
                            decoration: InputDecoration(
                              hintText: "Enter Login ID/ SRN",
                              hintStyle: TextStyle(
                                  fontSize: 18,
                                  color: Color(0xff999999),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Source Sans Pro'),
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 40, bottom: 10),
                        height: 35,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60),
                          color: Color(0xff0091CD),
                        ),
                        child: TextButton(
                          onPressed: () async {
                            ForgetPasswordModel model = ForgetPasswordModel(
                                action: 11,
                                mode: 1,
                                loginid: forgetPasswordController.text,
                                appid: 1,
                                randomNum: 0.3145632102349487);
                            await _viewModel.forgetPasswordDetails1(
                                action: 11,
                                mode: 1,
                                loginId: forgetPasswordController.text,
                                appId: 1,
                                randomNum: 0.3145632102349487);
                            Navigator.pop(context);

                            // if(response=='1001'){
                            //  CustomWidgets.getToast(message: "We have sent the password to ay****.s@gmail.com, You will receive your password in next 5 minute", color:  Colors.green);
                            //
                            //   Navigator.pushReplacementNamed(
                            //       context, AppRoutes.login);
                            // }else if(response=='1002'){
                            //   CustomWidgets.getToast(message: "Please retry after 5 minute.", color:  Colors.grey);
                            //   Navigator.pushReplacementNamed(
                            //       context, AppRoutes.login);
                            // }
                            // else{
                            //   Navigator.pushReplacementNamed(
                            //       context, AppRoutes.login);
                            // }
                          },
                          child: Text(
                            "CONTINUE",
                            style: TextStyle(
                              color: Color(0xffFFFFFF),
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Source Sans Pro',
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10, bottom: 20),
                        height: 35,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            color: Colors.white,
                            border: Border.all(color: Colors.grey)),
                        child: TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "CANCEL",
                              style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Source Sans Pro',
                                fontSize: 16,
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}

_SendEmail() {
  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: 'support@pesuacademy.com',
  );

  launch(emailLaunchUri.toString());
}

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;

  Future googleLogin() async {
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) return;
    _user = googleUser;

    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
    notifyListeners();
    print(googleUser.displayName);
    print(googleUser.email);
  }

  Future logout() async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }
}

//pes1201800032

//pes1ug20cs216
