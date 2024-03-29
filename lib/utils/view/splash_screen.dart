import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    Timer(
        Duration(seconds: 1),
        () =>
            //  Navigator.of(context).pushNamed(AppRoutes.settings));
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => DashboardScreen()))
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
