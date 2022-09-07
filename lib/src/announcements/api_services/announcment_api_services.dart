import 'dart:developer';

import 'package:pesu/src/announcements/model/announcement_model.dart';

import '../../../utils/constants/app_urls.dart';
import '../../../utils/services/pesu_api_service.dart';

class AnnouncementApiServices {
  late final PesuApiService _pesuApiService = PesuApiService();




  Future <List<AnnouncementModel>?>fetchAnnouncement(
      ) async {
    String url = AppUrls.commonUrl;
    final data = await _pesuApiService.postApiCall(endPoint: url,
        params: {

          "mode":5,
          "callMethod":"background",
          "appId":1,
          "limit":10,
          "action":20,
          "minLimit":0,
          "userId":"c59d0010-d5c0-4a5d-9b4f-3a69af635a42",
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




}