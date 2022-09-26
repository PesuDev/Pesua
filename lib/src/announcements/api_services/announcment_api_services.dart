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
  // int? announcementId;
  // AnnouncementApiServices({this.announcementId});





  Future <List<AnnouncementModel>?>fetchAnnouncement(
      ) async {
    String? userId=await preferenceUtil.getString(sp_userId);

    String url = AppUrls.commonUrl;
    final data = await _pesuApiService.postApiCall(endPoint: url,
        params: {

          "mode":5,
          "action":20,
          "userId":userId,
          "randomNum":0.481912564709001,
         // "announcementId":1854

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
  { required int action,
    required int mode,
    required double randomNum,
    required int announcementId,}
      ) async {
    String? userId=await preferenceUtil.getString(sp_userId);

    String url = AppUrls.commonUrl;
    final data = await _pesuApiService.postApiCall(endPoint: url,
        params: {
          "mode":mode,
          "action":action,
          "userId":userId,
          "randomNum":randomNum,
          "announcementId":announcementId,

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