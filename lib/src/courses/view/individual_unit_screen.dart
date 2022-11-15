import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pesu/utils/view/widget.dart';

import '../../../utils/constants/cheking_network.dart';

class IndividualUnitScreen extends StatefulWidget {
  String? title;

  IndividualUnitScreen({@required this.title});

  @override
  State<IndividualUnitScreen> createState() => _IndividualUnitScreenState();
}

class _IndividualUnitScreenState extends State<IndividualUnitScreen> {
  bool _connectionStatus = true;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

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
  Widget build(BuildContext context) {
    return _connectionStatus == true
        ?
      Scaffold(
      appBar: sideNavAppBar(widget.title ?? ''),
      body: Container(
        padding: EdgeInsets.only(top: 150, left: 20, right: 20, bottom: 8),
        child: Column(
          children: [
            Text("E-Learning content is available only on student web portal"),
            Text(
              "click here to visit PesuAcademy web portal",
              style: TextStyle(color: Colors.blue),
            )
          ],
        ),
      ),
    ):WillPopScope(onWillPop: () {return exit(0);
    }, child: NoNetworkWidget());
  }
}
