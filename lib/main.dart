import 'dart:developer';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pesu/src/announcements/view/announcement.dart';
import 'package:pesu/src/announcements/view/announcements.dart';
import 'package:pesu/src/dashboard_module/view/dashboard_page.dart';
import 'package:pesu/src/dashboard_module/view/home_page.dart';
import 'package:pesu/src/login/view/login.dart';
import 'package:pesu/src/my_profile/view/my_profile.dart';
import 'package:pesu/src/settings/view/settings.dart';
import 'package:pesu/src/transport/view/rr_campus.dart';
import 'package:pesu/src/transport/view/transport_dashboard.dart';
import 'package:pesu/utils/services/app_routes.dart';
import 'package:pesu/utils/services/bottom_navigaton_provider.dart';
import 'package:pesu/utils/view/splash_screen.dart';
import 'package:provider/provider.dart';


class PostHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient( context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
  HttpOverrides.global = new PostHttpOverrides();

}

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_)=>BottomNavigationProvider(),
          ),
        ],
      child: ChangeNotifierProvider(
        create: (context)=>GoogleSignInProvider(),
        child: MaterialApp(
          title: 'PESU',
          theme: ThemeData(
            primarySwatch: Colors.blueGrey,
          ),
          debugShowCheckedModeBanner: false,
          builder: (BuildContext? context, Widget? child) {
            return MediaQuery(
              data: MediaQuery.of(context!).copyWith(textScaleFactor: 0.9, ), //set desired text scale factor here
              child: child!,
            );
          },
          home: SplashScreen(),
          onGenerateRoute: AppRouteGenerator.generateRoute,
        ),
      ),

    );
  }
}
