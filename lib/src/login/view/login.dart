
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pesu/src/dashboard_module/view/dashboard_page.dart';
import 'dart:math' as math;

import 'package:pesu/src/dashboard_module/view/home_page.dart';
import 'package:pesu/src/login/model/forget_password_model.dart';
import 'package:pesu/src/login/model/login_request_model.dart';
import 'package:pesu/src/login/model/login_response_model.dart';
import 'package:pesu/src/login/viewmodel/login_viewmodel.dart';
import 'package:pesu/src/session_effectiveness/view/session_effectiveness.dart';
import 'package:pesu/utils/constants/sp_constants.dart';
import 'package:pesu/utils/services/sharedpreference_utils.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/constants/custom_widgets.dart';
import '../../../utils/services/app_routes.dart';

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
  }
  final _form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      body: Container(

        width: double.infinity,
        decoration:  BoxDecoration(
          image: DecorationImage(
            opacity: 0.5,
              colorFilter: ColorFilter.mode(Colors.black87.withOpacity(1), BlendMode.dstATop),
              image: AssetImage("assets/images/login_background.jpg",


              ),
              fit: BoxFit.cover),
        ),
        child: Form(

          key: _form,
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(left: 20, right: 20,top: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Center(
                    child: Text(
                      "Sign in",
                      style: TextStyle(
                          fontSize: 62,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Source Sans Pro'),
                    ),
                  ),
           Container(
             padding: EdgeInsets.only(left: 15,right: 15,top: 15,bottom: 15),
             color: Colors.black87.withOpacity(0.3),
             child: Column(
               children: [
                 InkWell(
                   onTap: () {
                     final provider =
                     Provider.of<GoogleSignInProvider>(context, listen: false);
                     provider.googleLogin();
                   },
                   child: Container(
                     color: Color(0xff0091CD),
                     width: double.infinity,
                     child: Row(
                       children: [
                         Container(
                           height: 50.0,
                           width: 50.0,
                           decoration: BoxDecoration(
                             image: DecorationImage(
                                 image:
                                 AssetImage('assets/images/google_logo.png'),
                                 fit: BoxFit.fitWidth),
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
                         )
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
                         color: Colors.white,
                       ),
                     ),
                     Expanded(
                       child: Container(
                         height: 1.0,
                         width: 80.0,
                         color: Colors.white,
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
                       color: Colors.white,
                     ),
                     Container(
                       height: 1.0,
                       width: 80.0,
                       color: Colors.white,
                     ),
                   ],
                 ),
                 SizedBox(
                   height: 20,
                 ),
                 Container(
                //   decoration: BoxDecoration(color: Colors.white),
                   child: Padding(
                     padding: const EdgeInsets.only(left: 10),
                     child: TextFormField(
                       validator: (val){
                         if(val !=null){
                           return null;
                         }
                         else{
                           return "Please Enter Valid User name/SRN";
                         }
                       },
                       autovalidateMode: AutovalidateMode.onUserInteraction,
                       controller: usernameController,
                       decoration: InputDecoration(
                         hintText: "Username / SRN",
fillColor: Colors.black87.withOpacity(0.7),
                         filled: true,
                         border: new OutlineInputBorder(
                           borderRadius: new BorderRadius.circular(25.0),
                           borderSide: new BorderSide(),
                         ),
                         hintStyle: TextStyle(
                             fontSize: 18,
                             color: Color(0xff999999),
                             fontWeight: FontWeight.w400,
                             fontFamily: 'Source Sans Pro'),
                       ),
                     ),
                   ),
                 ),
                 Container(
                   margin: EdgeInsets.only(top: 10),
           //        decoration: BoxDecoration(color: Colors.white),
                   child: Padding(
                     padding: const EdgeInsets.only(left: 10),
                     child: TextFormField(
                       validator: (val){
                         if(val !=null){
                           return null;
                         }
                         else{
                           return "Please Enter Valid Password";
                         }
                       },
                       autovalidateMode: AutovalidateMode.onUserInteraction,
                       controller: passwordController,
                       obscureText: _isObscure,
                       decoration: InputDecoration(
                           hintText: "Password",
                           fillColor: Colors.black87.withOpacity(0.7),
                           filled: true,
                           border: new OutlineInputBorder(
                             borderRadius: new BorderRadius.circular(25.0),
                             borderSide: new BorderSide(),
                           ),
                           hintStyle: TextStyle(
                               fontSize: 18,
                               color: Color(0xff999999),
                               fontWeight: FontWeight.w400,
                               fontFamily: 'Source Sans Pro'),
                           suffixIcon: IconButton(
                             onPressed: () {
                               setState(() {
                                 _isObscure = !_isObscure;
                               });
                             },
                             icon: Icon(
                               _isObscure
                                   ? Icons.visibility
                                   : Icons.visibility_off,
                             ),
                           )),
                     ),
                   ),
                 ),
                 SizedBox(
                   height: 10,
                 ),
                 Container(
                   height: 50,
                   width: double.infinity,
                   child: ElevatedButton(

                       style: ElevatedButton.styleFrom(primary: Color(0xffED4700)),
                       onPressed: () async {
                         if(_form.currentState!.validate()){
                           LoginModel responseModel = await _viewModel.getLoginDetails(
                               password: passwordController.text,username: usernameController.text);

                           if (responseModel != null ) {
                             log("Oye login came");
                             SharedPreferenceUtil util = SharedPreferenceUtil();
                             await util.setString(
                                 sp_userId,responseModel.userId??"");
                             await util.setString(
                                 sp_password, passwordController.text);
                             await util.setString(sp_classId, "${responseModel.classId }");
                             await util.setString(sp_userName, "${responseModel.name }");
                             await util.setString(sp_batchClassId, "${responseModel.batchClass}");
                             await util.setString(sp_classBatchSectionId, "${responseModel.classBatchSection }");
                             await util.setString(sp_userRoleId, "${responseModel.userRoleId }");
                             await util.setString(sp_branch, "${responseModel.branch}");
                             await util.setString(sp_loginId, "${responseModel.loginId}");

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
                       child: Text(
                         "Sign in",
                         style: TextStyle(
                           color: Color(0xffFFFFFF),
                           fontWeight: FontWeight.bold,
                           fontFamily: 'Source Sans Pro',
                           fontSize: 16,
                         ),
                       )),
                 ),
                 SizedBox(
                   height: 40,
                 ),
                 InkWell(
                   onTap: () {
                     _buildPopupDialog();
                   },
                   child: Text(
                     "Forgot Password?",
                     style: TextStyle(
                       color: Color(0xffFFFFFF),
                       fontWeight: FontWeight.w400,
                       fontFamily: 'Source Sans Pro',
                       fontSize: 16,
                     ),
                   ),
                 ),
                 SizedBox(
                   height: 40,
                 ),
                 Text(
                   "For all login issue, please send an email to ",
                   style: TextStyle(
                     color: Color(0xffFFFFFF),
                     fontWeight: FontWeight.w400,
                     fontFamily: 'Source Sans Pro',
                     fontSize: 16,
                   ),
                 ),
                 InkWell(
                   onTap: () {
                     _SendEmail();
                   },
                   child: Text(
                     "support@pesuacademy.com",
                     style: TextStyle(
                       color: Colors.blueAccent,
                       fontWeight: FontWeight.w400,
                       fontFamily: 'Source Sans Pro',
                       fontSize: 16,
                     ),
                   ),
                 ),
               ],
             ),
           )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  void _buildPopupDialog() {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return
            AlertDialog(
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
                                  color: Colors.white, fontWeight: FontWeight.bold),
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
                            onPressed: () async{
                              ForgetPasswordModel model=ForgetPasswordModel(
                                  action: 11,
                                  mode: 1,
                                  loginid: forgetPasswordController.text,
                                  appid: 1,
                                  randomNum: 0.3145632102349487
                              );
                              await _viewModel.forgetPasswordDetails1(action: 11,
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
