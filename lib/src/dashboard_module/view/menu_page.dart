import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pesu/src/dashboard_module/viewModel/dashboard_viewModel.dart';
import 'package:pesu/utils/constants/custom_widgets.dart';
import 'package:pesu/utils/constants/sp_constants.dart';
import 'package:pesu/utils/services/app_routes.dart';
import 'package:pesu/utils/services/bottom_navigaton_provider.dart';
import 'package:pesu/utils/services/sf_constant.dart';
import 'package:pesu/utils/services/sharedpreference_utils.dart';
import 'package:pesu/utils/view/webView_page.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../utils/services/web_url_link.dart';
import '../../time_table/model/time_table_model.dart';
import '../../time_table/viewmodel/timetable_viewmodel.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  late DashboardViewModel _viewModel;
  var _mainHeight;
  var _mainWidth;
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
    super.initState();
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    _viewModel = Provider.of<DashboardViewModel>(context, listen: false);
  }
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _mainHeight = MediaQuery.of(context).size.height;
    _mainWidth = MediaQuery.of(context).size.width;
    return
      Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 0,
        leading: IconButton(
          icon: Icon(
            Icons.clear,
            color: Colors.black,
          ),
          onPressed: () {
            Provider.of<BottomNavigationProvider>(context, listen: false)
                .selectBottomIndex(bottomIndex: 0);
          },
        ),
        title: Text(
          'Menu',
          style: TextStyle(fontWeight: FontWeight.w700, color: Colors.black),
        ),
      ),
      body: Container(
        height: _mainHeight,
        width: _mainWidth,
        color: Colors.white,
        padding: EdgeInsets.only(
            left: _mainWidth * 0.04,
            right: _mainWidth * 0.04,
            top: _mainHeight * 0.02),
        child: Container(
          height: _mainHeight * 0.8,
          width: _mainWidth,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: _mainHeight * 0.01,
                childAspectRatio: 1,
                mainAxisSpacing: _mainHeight * 0.05),
            itemBuilder: (_, index) {
              var data = _viewModel.getSettingsList()[index];
              return InkWell(
                onTap: () async{
                  if (index == 0) {
                    SharedPreferenceUtil util = SharedPreferenceUtil();
                    print("class Id:  ${await util.getString(sp_classBatchSectionId)}");
                    CustomWidgets.showLoaderDialog(context: context, message: "Loging Out");
               //     SharedPreferenceUtil util = SharedPreferenceUtil();



                    bool dataalue = await util.clearAll();

                    print("?????${dataalue}");

                     if (dataalue) {
                      CustomWidgets.getToast(message: "Logout was successful ", color: Color(0xff273746));
Navigator.pop(context);
                      Navigator.pushNamedAndRemoveUntil(context, AppRoutes.login, (route) => false);
                      final bottomProvider =
                      Provider.of<BottomNavigationProvider>(context,
                          listen: false);
                      bottomProvider.selectBottomIndex(bottomIndex: 0);
                   }
                    else{
                 CustomWidgets.getToast(message: "Logout was unsuccessful ", color: Color(0xff273746));
                    }
                  }
                  else if (index == 1) {

                 //   Navigator.pushNamed(context, AppRoutes.courseDashboard);
                    final bottomProvider =
                    Provider.of<BottomNavigationProvider>(context,
                        listen: false);
                    bottomProvider.selectBottomIndex(bottomIndex: 1);
                  }
                  else if (index == 2) {

                    Navigator.pushNamed(context, AppRoutes.examination);
                    // final bottomProvider =
                    // Provider.of<BottomNavigationProvider>(context,
                    //     listen: false);
                    // bottomProvider.selectBottomIndex(bottomIndex: 0);
                  }
                  else if (index == 3) {
                    Navigator.pushNamed(context, AppRoutes.timeTable);
                    // final bottomProvider =
                    // Provider.of<BottomNavigationProvider>(context,
                    //     listen: false);
                    // bottomProvider.selectBottomIndex(bottomIndex: 0);
                  } else if (index == 4) {
                  //  Navigator.pushNamed(context, AppRoutes.attendance);
                    final bottomProvider =
                    Provider.of<BottomNavigationProvider>(context,
                        listen: false);
                    bottomProvider.selectBottomIndex(bottomIndex: 3);
                  } else if (index == 5) {
                    Navigator.pushNamed(context, AppRoutes.assignment);
                    // final bottomProvider =
                    // Provider.of<BottomNavigationProvider>(context,
                    //     listen: false);
                    // bottomProvider.selectBottomIndex(bottomIndex: 0);
                  } else if (index == 6) {
                //    Navigator.pushNamed(context, AppRoutes.isaResults);
                    final bottomProvider =
                    Provider.of<BottomNavigationProvider>(context,
                        listen: false);
                    bottomProvider.selectBottomIndex(bottomIndex: 2);
                  } else if (index == 7) {
                    Navigator.pushNamed(context, AppRoutes.seatingInfo);
                    // final bottomProvider =
                    // Provider.of<BottomNavigationProvider>(context,
                    //     listen: false);
                    // bottomProvider.selectBottomIndex(bottomIndex: 0);
                  } else if (index == 8) {
                    Navigator.pushNamed(
                        context, AppRoutes.sessionEffectiveness);
                    // final bottomProvider =
                    // Provider.of<BottomNavigationProvider>(context,
                    //     listen: false);
                    // bottomProvider.selectBottomIndex(bottomIndex: 0);

                    //session effectiveness
                  } else if (index == 9) {
                    // final bottomProvider =
                    // Provider.of<BottomNavigationProvider>(context,
                    //     listen: false);
                    // bottomProvider.selectBottomIndex(bottomIndex: 0);
                    //class room videos
                    CustomWidgets.webUrl();
                  } else if (index == 10) {
                    Navigator.pushNamed(context, AppRoutes.backLog);
                  //  final bottomProvider =
                    // Provider.of<BottomNavigationProvider>(context,
                    //     listen: false);
                    // bottomProvider.selectBottomIndex(bottomIndex: 0);
                  } else if (index == 11) {
                    Navigator.pushNamed(context, AppRoutes.onlinePayments);
                //    final bottomProvider =
                    // Provider.of<BottomNavigationProvider>(context,
                    //     listen: false);
                    // bottomProvider.selectBottomIndex(bottomIndex: 0);
                  } else if (index == 12) {
                    Navigator.pushNamed(context, AppRoutes.placement);
                    // final bottomProvider =
                    // Provider.of<BottomNavigationProvider>(context,
                    //     listen: false);
                    // bottomProvider.selectBottomIndex(bottomIndex: 0);
                  } else if (index == 13) {
                    Navigator.pushNamed(context, AppRoutes.calendarDashboard);
                    // final bottomProvider =
                    // Provider.of<BottomNavigationProvider>(context,
                    //     listen: false);
                    // bottomProvider.selectBottomIndex(bottomIndex: 0);
                  } else if (index == 14) {
                    Navigator.pushNamed(context, AppRoutes.announcements);
                    // final bottomProvider =
                    // Provider.of<BottomNavigationProvider>(context,
                    //     listen: false);
                    // bottomProvider.selectBottomIndex(bottomIndex: 0);

                    //Announcements
                  } else if (index == 15) {
                   // launch("http://library.pes.edu");
                    CustomWidgets.libraryUrl();
                    final bottomProvider =
                    Provider.of<BottomNavigationProvider>(context,
                        listen: false);
                    bottomProvider.selectBottomIndex(bottomIndex: 0);
         //   WebViewPage(title: "Library",urlLink: libraryUrl,);
                  } else if (index == 16) {

                    Navigator.pushNamed(context, AppRoutes.transport);
                    // final bottomProvider =
                    // Provider.of<BottomNavigationProvider>(context,
                    //     listen: false);
                    // bottomProvider.selectBottomIndex(bottomIndex: 0);
                  } else if (index == 17) {
                   CustomWidgets.webUrl();
                    // final bottomProvider =
                    // Provider.of<BottomNavigationProvider>(context,
                    //     listen: false);
                    // bottomProvider.selectBottomIndex(bottomIndex: 0);
                  } else if (index == 18) {
                    Navigator.pushNamed(context, AppRoutes.myProfile);
                    // final bottomProvider =
                    // Provider.of<BottomNavigationProvider>(context,
                    //     listen: false);
                    // bottomProvider.selectBottomIndex(bottomIndex: 0);
                  } else if (index == 19) {
                    Navigator.pushNamed(context, AppRoutes.esaresults);
                    // final bottomProvider =
                    // Provider.of<BottomNavigationProvider>(context,
                    //     listen: false);
                    // bottomProvider.selectBottomIndex(bottomIndex: 0);
                  }
                },
                child: Container(
                  //color: Colors.amber,
                  //height: _mainHeight*0.05,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        data.icon,
                        color: Colors.blue,
                        size: _mainHeight * 0.04,
                      ),
                      SizedBox(
                        height: _mainHeight * 0.01,
                      ),
                      Flexible(
                        child: Text(
                          data.name ?? '',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            itemCount: _viewModel.getSettingsList().length,
          ),
        ),
      ),
    );
  }
}
