import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:provider/provider.dart';

import '../../../utils/constants/app_urls.dart';
import '../view_model/announcement_viewmodel.dart';

class OpenPdf extends StatefulWidget {

  var announcementId;
  OpenPdf({this.announcementId});


  @override
  State<OpenPdf> createState() => _OpenPdfState();
}

class _OpenPdfState extends State<OpenPdf> {
  late AnnouncementViewModel _announcementViewModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _announcementViewModel =
        Provider.of<AnnouncementViewModel>(context, listen: false);
    _announcementViewModel.getAnnouncementBannerInfo(
         mode: 6, action: 20, randomNum: 0.8517174029236512,
        announcementId: widget.announcementId);
    _announcementViewModel.getAnnouncementListInfo();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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


      ));
  }
}


//PDF().cachedFromUrl("https://rr.pesuacademy.com/MAcademy/previewAnnouncementFile/1380/PESU_EC_Campus(1).pdf"
