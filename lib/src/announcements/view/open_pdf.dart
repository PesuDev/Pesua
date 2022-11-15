import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:provider/provider.dart';

import '../../../utils/constants/app_urls.dart';
import '../../../utils/constants/cheking_network.dart';
import '../view_model/announcement_viewmodel.dart';

class OpenPdf extends StatefulWidget {

  var announcementId;
  OpenPdf({this.announcementId});


  @override
  State<OpenPdf> createState() => _OpenPdfState();
}

class _OpenPdfState extends State<OpenPdf> {
  late AnnouncementViewModel _announcementViewModel;
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);

    _announcementViewModel =
        Provider.of<AnnouncementViewModel>(context, listen: false);
    _announcementViewModel.getAnnouncementBannerInfo(
         mode: 6, action: 20, randomNum: 0.8517174029236512,
        announcementId: widget.announcementId);
    _announcementViewModel.getAnnouncementListInfo();

  }
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  bool _connectionStatus = true;
  final Connectivity _connectivity = Connectivity();


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
    return _connectionStatus == true?

    Scaffold(
      body:Consumer<AnnouncementViewModel>(builder: (context, value, child) {

        return value.announcementBannerModel!=null?
        ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: value.announcementBannerModel?.length,
            itemBuilder: (BuildContext context, int index) {
              var pdf=AppUrls.openPdf+'${value.announcementBannerModel?[index].files!.join(', ')}';
              print("mypdf${pdf}");
              return
              Container(
                height: MediaQuery.of(context).size.height,
                  child: PDF().cachedFromUrl(pdf));
            }):Container();
    }


      )):WillPopScope(onWillPop: () {return exit(0);
    }, child: NoNetworkWidget());
  }
}


//PDF().cachedFromUrl("https://rr.pesuacademy.com/MAcademy/previewAnnouncementFile/1380/PESU_EC_Campus(1).pdf"
