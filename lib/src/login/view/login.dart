import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:avoid_keyboard/avoid_keyboard.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

import '../../../utils/constants/cheking_network.dart';
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
  bool _connectionStatus = true;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;



  Future<void> initConnectivity() async {
    ConnectivityResult result = ConnectivityResult.none;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
        setState(() => _connectionStatus = true);
        break;
      case ConnectivityResult.mobile:
        setState(() => _connectionStatus = true);
        break;
      case ConnectivityResult.none:
        setState(() => _connectionStatus = false);
        break;
      default:
        setState(() => _connectionStatus = true);
        break;
    }
  }

  @override
  void initState() {
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
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
    _connectivitySubscription.cancel();

  }


  void _onFocusChange() {
    debugPrint("Focus: ${_focus.hasFocus.toString()}");
  }

  final _form = GlobalKey<FormState>();
  final _form1 = GlobalKey<FormState>();

  FocusNode _focus = FocusNode();
  FocusNode _focusPass = FocusNode();


  @override
  Widget build(BuildContext context) {
    return _connectionStatus == true
        ?
      SafeArea(
        child: Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.white,
              title: Image.asset(
                'assets/images/logo.png',
                height: 40,
              ),
              titleSpacing: 100,
            ),
            body:
            WillPopScope(
              onWillPop: (){
                return exit(0);
                
                // return CustomWidgets.showLoaderDialog(context: BuildContext, message: "");
              },
              child: GestureDetector(
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
                          "Sign In",
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
                              "Sign in with Google",
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
                        //  CustomWidgets.showLoaderDialog(context: context, message: "Signing In....");
                          LoginModel responseModel =
                          await _viewModel.getLoginDetails(
                              password: passwordController.text,
                              username: usernameController.text);

                          if (responseModel != null) {
                            CustomWidgets.showLoaderDialog(context: context, message: "Signing In....");

                            log("Oye login came");
                            SharedPreferenceUtil util =
                            SharedPreferenceUtil();
                            await util.setString(
                                sp_userId, responseModel.userId ?? "");
                            await util.setString(
                                sp_password, passwordController.text);
                            print("papap${sp_password}");
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



                            log("Bose 2 ame:  ${await util.getToken()}");


                                Navigator.pop(context);
                                Navigator.push(
                                    context, MaterialPageRoute(builder: (_) => DashboardScreen()));



                            CustomWidgets.getToast(message: "Login Successfully", color:  Color(0xff273746));



                          } else {
                            Navigator.pop(context);
                            CustomWidgets.getToast(message: "Login Unsuccessfully", color:  Color(0xff273746));

                            log('Oye am not coming');
                          }
                        }

                      },
                      onDoubleTap: (){

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
              ),
            )

        )
    ):WillPopScope(onWillPop: () {return exit(0);
    }, child: NoNetworkWidget());
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
                Form(
                  key:_form1,
                  child: Container(
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
                              "Forgot your Password?",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10,top: 10,right: 10),
                  child: Column(
                    children: [
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,

                        validator: (String? value) {
                          if (value!.trim().isEmpty) {
                            return 'Please filled the details ';
                          } else{
                            return null;
                          }
                        },
                        controller: forgetPasswordController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                              top: 1,left: 5,  bottom: 1, right: 4),
                          hintText: "Enter Login ID/ SRN",
                          hintStyle: TextStyle(
                              fontSize: 18,
                              color: Color(0xff999999),
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Source Sans Pro'),
                          border: new OutlineInputBorder(
                            borderRadius:
                            new BorderRadius.circular(5.0),
                            borderSide: new BorderSide(
                              color: Color(0xffCFD8DC),
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
                             if (_form1.currentState != null) {
                               _form1.currentState?.validate();
                               if(forgetPasswordController.text.isEmpty){
                                   CustomWidgets.getToast(message: "Enter Login ID", color:  Color(0xff273746));
                               }else {
                                 await _viewModel.forgetPasswordDetails1(
                                     action: 11,
                                     mode: 1,
                                     loginId: forgetPasswordController.text,
                                     appId: 1,
                                     randomNum: 0.3145632102349487);
                               }


                               // if(forgetPasswordController.text.isEmpty){
                               //     CustomWidgets.getToast(message: "Enter Login ID", color:  Colors.grey);
                               // }else {
                               //
                               // }



                               //

                            //    1001_We have sent the password to ay****as@gmail.com, You will receive your password in next 5 minute.
                            // [log] msg1001_We have sent the password to ay****as@gmail.com, You will receive your password in next 5 minute.
                               // if(forgetPasswordController.text==sp_DepartmentId){
                               //
                               //   CustomWidgets.getToast(message: "Password updated", color:  Colors.grey);
                               //
                               //
                               // }
                               // else{
                               //   CustomWidgets.getToast(message: "SRN Does not matched", color:  Colors.grey);
                               //
                               // }


                             }
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
                              forgetPasswordController.clear();
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
