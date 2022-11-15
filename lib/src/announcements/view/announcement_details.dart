
import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:pesu/src/announcements/view/open_pdf.dart';
import 'package:pesu/utils/constants/app_urls.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';

import '../../../utils/constants/cheking_network.dart';
import '../../../utils/constants/color_consts.dart';
import '../../../utils/constants/custom_widgets.dart';
import '../../../utils/services/app_routes.dart';
import '../../../utils/services/bottom_navigaton_provider.dart';
import '../../../utils/view/widget.dart';

import 'dart:math' as math;

import '../../dashboard_module/view/dashboard_page.dart';
import '../view_model/announcement_viewmodel.dart';

class Announcement extends StatefulWidget {

  var announcementId;
  Announcement({this.announcementId});

  // const Announcement({Key? key}) : super(key: key);

  @override
  State<Announcement> createState() => _AnnouncementState();
}


class _AnnouncementState extends State<Announcement> {
  late AnnouncementViewModel _announcementViewModel;
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  // bool _connectionStatus = true;
  // final Connectivity _connectivity = Connectivity();
  // StreamSubscription<ConnectivityResult> _connectivitySubscription;

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
        announcementId: widget.announcementId,
        mode: 6,
        action: 20,
        randomNum: 0.8517174029236512);
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
        appBar: sideNavAppBar("Announcement"),
        backgroundColor: Colors.white.withOpacity(0.9),
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
        body: Consumer<AnnouncementViewModel>(builder: (context, value, child) {
          String? htmlCode;

          return value.announcementBannerModel != null &&
              value.announcementBannerModel?.length != 0
              ?
          Container(
              width: double.infinity,
              color: Colors.grey[20],
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
              child: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: value.announcementBannerModel?.length,
                      itemBuilder: (BuildContext context, int index) {
                        String? base64Image = (value
                            .announcementBannerModel?[index].pictureIconPath);
                        final UriData? mydata = Uri
                            .parse(base64Image.toString())
                            .data;
                        Uint8List? myImage = mydata?.contentAsBytes();

                        String? uriString =
                            value.announcementBannerModel?[index].description;
                        String uriDecode = Uri.decodeFull(uriString!);
                        htmlCode = uriDecode;


                        return
                          Container(
                            color: Colors.white,
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5, top: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    value.announcementBannerModel?[index]
                                        .announcementName ?? ""
                                    ,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Color(0xff0091cd)),
                                  ),

                                  myImage != null &&
                                      value.announcementBannerModel?[index]
                                          .isBannerImage == 1 ?
                                  GestureDetector(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          barrierDismissible: true,
                                          builder: (BuildContext context) {
                                            return
                                              SafeArea(
                                                child: GestureDetector(
                                                  onTap: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Stack(
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            Navigator.of(
                                                                context).pop();
                                                          },

                                                          child: Align(
                                                            alignment: Alignment
                                                                .topRight,
                                                            child: Icon(
                                                              Icons.cancel,
                                                              size: 40,
                                                            ),
                                                          ),
                                                        ),
                                                        Center(
                                                          child: Container(
                                                            margin: EdgeInsets
                                                                .only(top: 40,
                                                                bottom: 40),

                                                            color: Colors
                                                                .transparent,
                                                            // height:200,
                                                            width: double
                                                                .infinity,
                                                            child: PhotoView(
                                                                maxScale: 100.0,
                                                                backgroundDecoration: BoxDecoration(
                                                                  border: Border
                                                                      .all(
                                                                      color: Colors
                                                                          .transparent),
                                                                ),

                                                                imageProvider: MemoryImage(
                                                                  myImage,
                                                                )
                                                            ),
                                                          ),
                                                        ),
                                                      ]
                                                  ),
                                                ),
                                              );
                                          }
                                      );
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          right: 5, top: 10),
                                      height: 200,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              5),
                                          image: DecorationImage(
                                            image: MemoryImage(
                                                myImage
                                            ),
                                            fit: BoxFit.fill,
                                          )),
                                    ),
                                  ) : Container(),
                                  SizedBox(height: 10,),

                                  Text(
                                    value.announcementBannerModel?[index]
                                        .createdDateFrSorting!.substring(0,11) ?? ''
                                    ,
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 14,
                                        color: Colors.grey),
                                  ),
                                  Divider(
                                    color: Colors.black,
                                  ),
                                  value.announcementBannerModel![index].files!
                                      .isNotEmpty
                                      ?

                                  GestureDetector(
                                    onTap: () async {
                                      Navigator
                                          .of(context)
                                          .push(MaterialPageRoute(
                                          builder: (context) =>
                                              ChangeNotifierProvider(create: (
                                                  BuildContext context) =>
                                                  AnnouncementViewModel(),
                                                  child: OpenPdf(
                                                      announcementId: value
                                                          .announcementModel?[index]
                                                          .announcementId))
                                      ));
                                          },
                                    child: Row(
                                      children: [
                                        Container(
                                            child:
                                            Text(
                                    '${value.announcementBannerModel?[index].files!.join(', ').substring(5)}',
                                              // "ST_Labs_Swayam_May_2022_converted.pdf",
                                              style: TextStyle(
                                                  color: Color(0xff333333),
                                                  fontSize: 14),)),
                                        Spacer(),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator
                                                .of(context)
                                                .push(MaterialPageRoute(
                                                builder: (context) =>
                                                    ChangeNotifierProvider(create: (
                                                        BuildContext context) =>
                                                        AnnouncementViewModel(),
                                                        child: OpenPdf(
                                                            announcementId: value
                                                                .announcementModel?[index]
                                                                .announcementId))
                                            ));
                                            CustomWidgets.getToast(message: "FIle id Downloaded in ", color:  Color(0xff273746));

                                          },
                                          child: Transform.rotate(
                                              angle: 180 * math.pi / 140,
                                              child: Icon(Icons.attach_file,
                                                color: Colors.grey,)),
                                        )

                                      ],
                                    ),
                                  ) : SizedBox(height: 0,),
                                  value.announcementBannerModel![index].files!
                                      .isNotEmpty ?
                                  Divider(
                                    color: Colors.black,
                                  ) : SizedBox(height: 0,),

                                  HtmlWidget(htmlCode!,

                                  ),
                                  SizedBox(height: 10,)

                                ],
                              ),
                            ),

                          );
                      })
              )

          )
              : Center(child: CircularProgressIndicator());
        })):WillPopScope(onWillPop: () {return exit(0);
    }, child: NoNetworkWidget());
  }
}
