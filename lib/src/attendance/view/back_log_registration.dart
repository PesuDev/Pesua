import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:pesu/utils/constants/custom_widgets.dart';
import 'package:pesu/utils/view/widget.dart';
import 'package:provider/provider.dart';

import '../../../utils/constants/cheking_network.dart';
import '../../../utils/constants/color_consts.dart';
import '../../../utils/services/bottom_navigaton_provider.dart';
import '../../dashboard_module/view/dashboard_page.dart';

class BackLogRegistration extends StatefulWidget {
  const BackLogRegistration({Key? key}) : super(key: key);

  @override
  State<BackLogRegistration> createState() => _BackLogRegistrationState();
}

class _BackLogRegistrationState extends State<BackLogRegistration> {
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

  void initState() {
    super.initState();
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _connectionStatus == true
        ?
      Scaffold( appBar: sideNavAppBar("Backlog Registration"),
     // drawer: Container(),
      bottomNavigationBar:    Consumer<BottomNavigationProvider>(
        builder: (context, value, child) {
          return BottomNavigationBar(
              currentIndex: value.selectedIndex,
              fixedColor: appThemeColor,
              items:CustomWidgets.getNavBarItems(),
              selectedFontSize: 10,
              unselectedFontSize: 10,
              type: BottomNavigationBarType.fixed,
              onTap: (index) {

                value.selectBottomIndex(bottomIndex: index);
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => DashboardScreen()));
              }

          );
        },
      ),
body:
Center(
  child:   Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: (){
            CustomWidgets.webUrl();
          },
          child: Container(
            width: MediaQuery.of(context).size.width/1.1,
            child:


            RichText(
              maxLines: 3,
                text: TextSpan(
              text: "Backlog/Improvement Registration option available only on student web portal, please visit ",
                style: TextStyle(color: Colors.black),

                children: [
                TextSpan(
                  text :"pesuacademy.com",
                  style: TextStyle(color: Colors.blue),
                  //onEnter: CustomWidgets.webUrl(),

                ),
                  TextSpan(
                  text :" for registration",
                  style: TextStyle(color: Colors.black),
                )

              ]
            )),
          ),
        )

      ],
    ),
  ),
),
    ):WillPopScope(onWillPop: () {return exit(0);
    }, child: NoNetworkWidget());
  }
}
