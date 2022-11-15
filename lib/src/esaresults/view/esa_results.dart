import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pesu/utils/view/widget.dart';
import 'package:provider/provider.dart';

import '../../../utils/constants/cheking_network.dart';
import '../../../utils/constants/color_consts.dart';
import '../../../utils/constants/custom_widgets.dart';
import '../../../utils/services/bottom_navigaton_provider.dart';
import '../../dashboard_module/view/dashboard_page.dart';
import '../viewmodel/Esa_viewmodel.dart';
import 'Previous_semester.dart';
import 'Provisional_page.dart';

class ESAResults extends StatefulWidget {
  const ESAResults({Key? key}) : super(key: key);

  @override
  _ESAResultsState createState() => _ESAResultsState();
}

class _ESAResultsState extends State<ESAResults> {
  late TabController tabController;
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
      DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: sideNavAppBar("ESA Results"),
            backgroundColor:Colors.white.withOpacity(0.9),
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
            body: SingleChildScrollView(
              child: Column(children: [
                Padding(
                    padding: const EdgeInsets.only(top: 1.0),
                    child: Container(
                      color: Color(0xff055287),
                      width: double.infinity,
                      margin: EdgeInsets.only(left: 15, right: 15),

                      child: TabBar(
                        indicatorColor: Colors.orange,
                        indicatorWeight: 6,
                        tabs: [
                          Tab(
                            child: Container(
                              child: Text(
                                "Provisional",
                                style: TextStyle(
                                  fontFamily: 'Open Sans',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xffFFFFFF)
                                ),
                                maxLines: 1,
                              ),
                            ),
                          ),
                          Tab(
                            child: Container(
                              child: Text(
                                "Previous Semesters",
                                style: TextStyle(
                                    fontFamily: 'Open Sans',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xffFFFFFF)
                                ),
                                maxLines: 1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),

                Container(
                  height: MediaQuery.of(context).size.height/1.29,
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TabBarView(
                    children: [
                      ChangeNotifierProvider.value(value : Provider.of<EsaViewModel>(context),
                      child: ProvisionalPage()),
                      ChangeNotifierProvider.value(value : Provider.of<EsaViewModel>(context),
                          child: PreviousSem()),
                    ],
                  )
                ),
              ]),
            ))):WillPopScope(onWillPop: () {return exit(0);
    }, child: NoNetworkWidget());
  }
}
