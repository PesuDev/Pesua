import 'dart:async';
import 'dart:developer';

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
    log("i am the bosee:     $token}");
    if (token == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Timer(const Duration(milliseconds: 1000), () {
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
    return Scaffold();
  }
}
