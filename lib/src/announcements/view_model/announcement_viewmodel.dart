import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:pesu/src/announcements/api_services/announcment_api_services.dart';
import 'package:pesu/src/announcements/model/announcement_dashboard_banner.dart';
import 'package:pesu/src/announcements/model/announcement_important_model.dart';
import 'package:pesu/src/announcements/model/announcement_marque.dart';
import 'package:pesu/src/announcements/model/announcement_model.dart';
import 'package:pesu/src/attendance/api_services/attendace_api_services.dart';
import 'package:pesu/src/attendance/model/attendance_dropdown_model.dart';
import 'package:pesu/src/attendance/model/attendance_list_model.dart';
import 'package:pesu/src/attendance/model/detailed_attendance_model.dart';

import '../model/announcement_banner_model.dart';

class AnnouncementViewModel extends ChangeNotifier {
  late final AnnouncementApiServices _apiService = AnnouncementApiServices();
List<AnnouncementModel> ?announcementModel;

List<AnnouncementBannerModel> ?announcementBannerModel;
List<Announcement_marqueModel>? announcementMarque;
int marqueLength=-1;
int importantAnnouncementLength=-1;
int  announcementLength=-1;
List<AnnouncementImportantModel>? announcementImportant;
List<AnnouncementBannerDashModel>? announcementBannerDashModel;
int bannerLength=-1;

Future <List<AnnouncementModel>?>getAnnouncementListInfo() async {
    log("annuncement");
    final data = await _apiService.fetchAnnouncement();
    log("hey i came");

    // this.items = data?.studentSemesterWise?.map((e) => e.className.toString()).toList() ?? <String>[];
   announcementModel= data;
   announcementLength=announcementModel?.length??0;
    final marqueData=await _apiService.fetchAnnouncementMarque();
//   log("Announcement data: ${data}");
  announcementMarque=[];
  for(var bannerData in marqueData!){
    if(bannerData.announcementPriority==3){
 //     print("data>>>>>> latika   ${bannerData.announcementId}");

      announcementMarque?.add(bannerData);

    }

marqueLength=announcementMarque?.length ?? 0 ;
  }
  final importantData=await _apiService.fetchAnnouncementImportant();
  announcementImportant=[];
  for(var important in importantData!){
    if(important.announcementType==1){
//      print("data>>>>>> latika   ${i.announcementId}");
announcementImportant?.add(important);
     // announcementMarque?.add(bannerData);

    }


  }
  importantAnnouncementLength=announcementImportant?.length??0;

  final bannerDashData=await _apiService.fetchAnnouncementBannerDash();
 announcementBannerDashModel=[];
  for(var important in bannerDashData!){
    if(important.announcementType==2){
//      print("data>>>>>> latika   ${i.announcementId}");
      announcementBannerDashModel?.add(important);
      // announcementMarque?.add(bannerData);

    }


  }
bannerLength=announcementBannerDashModel?.length ??0;
  //print("????????????????   ${announcementMarque?.toList().toSet()}  ${announcementMarque?.toList().length}");
    notifyListeners();
  }
Future <List<AnnouncementModel>?>getAnnouncementListInfoForMarquee() async {


    notifyListeners();
  }

  Future <List<AnnouncementBannerModel>?>getAnnouncementBannerInfo(
      { required int action,
        required int mode,
        required double randomNum,
        required int announcementId,}

      ) async {
    log("annuncement");
    final data = await _apiService.fetchAnnouncementBanner(randomNum: randomNum,
        announcementId: announcementId, mode: mode, action: action);
    log("hey i came");
    // this.items = data?.studentSemesterWise?.map((e) => e.className.toString()).toList() ?? <String>[];
    announcementBannerModel= data;
   log("Announcement data: ${data}");
    notifyListeners();
  }



}