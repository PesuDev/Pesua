

import 'dart:developer';

import 'package:pesu/src/time_table/model/time_table_model.dart';

import '../../../utils/constants/app_urls.dart';
import '../../../utils/services/pesu_api_service.dart';
import '../model/profile_detail/-model.dart';
import '../model/profile_model.dart';

class ProfileApi {
  late final PesuApiService _pesuApiService = PesuApiService();

  Future<ProfileModel?> fetchProfileDetails({
    required int action,
    required int mode,
    required double randomNum,
    required String userId,
    required String callMethod,
    required bool isProfileRequest
  }) async {
    String url = AppUrls.commonUrl;
    final data = await _pesuApiService.postApiCall(endPoint: url, params: {
      'action': action,
      'mode': mode,
      'userId': userId,
      'randomNum': randomNum,
      'callMethod': callMethod,
      'isProfileRequest': isProfileRequest
    });
    if (data != null) {
      return ProfileModel.fromJson(data);
    }
    // log('HII'${data.toString()});
    log("msg$data");
  }
}

class ProfileDetailApi {
  late final PesuApiService _pesuApiService = PesuApiService();

  Future<ProfileDetailModel?> fetchProfileDetailsData({
    required int action,
    required int mode,
    required double randomNum,
    required String userId,
    required String callMethod,
    required String loginId,
    required String searchUserId,
    required int userType,
    required String userRoleId,

  }) async {
    String url = AppUrls.commonUrl;
    final data = await _pesuApiService.postApiCall(endPoint: url, params: {
      'action': action,
      'mode': mode,
      'userId': userId,
      'randomNum': randomNum,
      'callMethod': callMethod,
      'loginId':loginId,
      'searchUserId':searchUserId,
      'userType':userType,
      'userRoleId':userRoleId
    });
    if (data != null) {
      return ProfileDetailModel.fromJson(data);

    }
    // log('HII'${data.toString()});
    log("msg$data");


  }
}




