import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:pesu/src/announcements/api_services/announcment_api_services.dart';
import 'package:pesu/src/announcements/model/announcement_model.dart';
import 'package:pesu/src/attendance/api_services/attendace_api_services.dart';
import 'package:pesu/src/attendance/model/attendance_dropdown_model.dart';
import 'package:pesu/src/attendance/model/attendance_list_model.dart';
import 'package:pesu/src/attendance/model/detailed_attendance_model.dart';

class AnnouncementViewModel extends ChangeNotifier {
  late final AnnouncementApiServices _apiService = AnnouncementApiServices();
List<AnnouncementModel> ?announcementModel;


  void  getAnnouncementListInfo(

      ) async {
    log("annuncement");
    final data = await _apiService.fetchAnnouncement();
    // this.items = data?.studentSemesterWise?.map((e) => e.className.toString()).toList() ?? <String>[];
   announcementModel= data;
   log("Announcement data: ${data}");
    notifyListeners();
  }



}