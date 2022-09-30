import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pesu/utils/services/sharedpreference_utils.dart';

import '../../src/dashboard_module/view/dashboard_page.dart';
import '../services/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
   initMethod();
    // Timer(
    //     Duration(seconds: 1),
    //     () =>
    //         //  Navigator.of(context).pushNamed(AppRoutes.settings));
    //         Navigator.push(
    //             context, MaterialPageRoute(builder: (_) => DashboardScreen()))
    // );
  }

  Future<void> initMethod() async {
    SharedPreferenceUtil preferenceUtil = SharedPreferenceUtil();
    String? token = await preferenceUtil.getToken();
    log("i am the bosee: $token}");
    if (token == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Timer(const Duration(milliseconds: 500), () {
          if (mounted) {
            Navigator.pushNamedAndRemoveUntil(
                context, AppRoutes.login, (route) => false);

          }
        });
      });
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Timer(const Duration(milliseconds: 1000), () {
          if (mounted) {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => DashboardScreen()));
          }
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: WillPopScope(
        onWillPop: (){
          return exit(0);
        },
        child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "assets/images/index-bg-pattern.png",
                ),
                fit: BoxFit.cover),
              ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height/10,),
              Image.asset(
                "assets/images/pesu-logo-big.png",
                fit: BoxFit.cover,
                width: 300,

              ),
              SizedBox(height: MediaQuery.of(context).size.height/10,),
              CircularProgressIndicator(),

            ],

            ),



        ),
      ),
    );
  }
}
