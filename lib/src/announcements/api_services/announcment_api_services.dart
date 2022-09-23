import 'dart:developer';

import 'package:pesu/src/announcements/model/announcement_model.dart';

import '../../../utils/constants/app_urls.dart';
import '../../../utils/constants/sp_constants.dart';
import '../../../utils/services/pesu_api_service.dart';
import '../../../utils/services/sharedpreference_utils.dart';
import '../model/announcement_banner_model.dart';

class AnnouncementApiServices {
  late final PesuApiService _pesuApiService = PesuApiService();
  SharedPreferenceUtil preferenceUtil=SharedPreferenceUtil();





  Future <List<AnnouncementModel>?>fetchAnnouncement(
      ) async {
    String? userId=await preferenceUtil.getString(sp_userId);

    String url = AppUrls.commonUrl;
    final data = await _pesuApiService.postApiCall(endPoint: url,
        params: {

          "mode":5,
          "callMethod":"background",
          "action":20,
          "userId":userId,
          "randomNum":0.481912564709001



          // "action":18,
          // "mode":1,
          // "whichObjectId":"clickHome_pesuacademy_attendance",
          // "title":"Attendance",
          // "userId":"7b14a7f5-13a7-4c1c-a17d-42e7ac9a147f",
          // "deviceType":1,
          // "serverMode":0,
          // "programId":6,
          // "redirectValue":"redirect:/a/ad",
          // "randomNum":0.39545290298868396
          //

        }
    );

    log("response:${data.toString()}");
    if (data != null && data.toString().length>0) {
      log("hhhhh $data");
      final Iterable json = data;
      log("Am going");
      return json.map((orderModel) => AnnouncementModel.fromJson(orderModel))
          .toList();

    }
    else{

    }
  }


  Future <List<AnnouncementBannerModel>?>fetchAnnouncementBanner(
      ) async {
    String? userId=await preferenceUtil.getString(sp_userId);

    String url = AppUrls.commonUrl;
    final data = await _pesuApiService.postApiCall(endPoint: url,
        params: {

          "mode":6,
          "callMethod":"background",
          "action":20,
          "userId":userId,
          "randomNum":0.481912564709001,
          "announcementId":1854,

        }
    );

    log("response:${data.toString()}");
    if (data != null && data.toString().length>0) {
      log("hhhhh $data");
      final Iterable json = data;
      log("Am going");
      return json.map((orderModel) => AnnouncementBannerModel.fromJson(orderModel))
          .toList();

    }
    else{

    }
  }




}