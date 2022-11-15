import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pesu/utils/view/widget.dart';

import '../../../utils/constants/cheking_network.dart';

class DetailedAssignment extends StatefulWidget {
  const DetailedAssignment({Key? key}) : super(key: key);

  @override
  State<DetailedAssignment> createState() => _DetailedAssignmentState();
}

class _DetailedAssignmentState extends State<DetailedAssignment> {

  bool _connectionStatus = true;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;


  void initState() {
    // TODO: implement initState
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
appBar: sideNavAppBar("Assignment"),
      backgroundColor:Colors.white.withOpacity(0.9),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          margin: EdgeInsets.only(top: 15,bottom: 15,left: 10,right: 10),
         padding: EdgeInsets.only(top: 15,bottom: 15,left: 10,right: 10),
child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text("UE17CS511 Problem solving with C",),
    SizedBox(height: 15,),

    Text("Due on: 02-Jun-2022",),
    SizedBox(height: 15,),
    Text("Maximum Marks:10",),

    SizedBox(height: 15,),
Text("Assignment Name",
  style: TextStyle(
      color: Color(0xff999999)
  ),
),

    Text("Assignment Testing"),
    SizedBox(height: 20,),
    Text("Details",
      style: TextStyle(
          color: Color(0xff999999)
      ),
    ),
    Text("Testing"),
    SizedBox(height: 20,),
    Text("Reference",
    style: TextStyle(
      color: Color(0xff999999)
    ),
    ),
    Text("Testing"),
    SizedBox(height: 20,),
  ],
)
        ),
      ),

    ):WillPopScope(onWillPop: () {return exit(0);
    }, child: NoNetworkWidget());
  }
}
