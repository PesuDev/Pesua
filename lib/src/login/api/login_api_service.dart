
import 'dart:async';
import 'dart:developer';

import 'package:pesu/src/login/model/login_response_model.dart';
import 'package:pesu/utils/constants/app_urls.dart';
import 'package:pesu/utils/services/pesu_api_service.dart';

import '../model/forget_password_model.dart';
import '../model/login_request_model.dart';

class LoginApiService {
  late final PesuApiService _pesuApiService = PesuApiService();

  Future<LoginResponseModel?> fetchLoginDetails(
      {required LoginRequestModel loginRequestModel}) async {
    String url = AppUrls.loginUrl;

    final data = await _pesuApiService.postApiCallForLogin(
        endPoint: url, bodyParams: {
      "j_mobile":"MOBILE",
      "mode":"0",
     "j_mobileApp":"YES",
     " whichObjectId":"loginSubmitButton",
    " j_social":"NO",
     " j_password":"pes123",
      "action":"0",
     " j_appId":"1",
      "j_username":"pes1ug20cs216",
      "randomNum":"0.6181071537315856",
    });
    if(data != null){
      return LoginResponseModel.fromJson(data);
    }

  }
}

class ForgetPasswordApi {
  late final PesuApiService _pesuApiService = PesuApiService();

  dynamic forgetPassword(
      {required ForgetPasswordModel forgetPasswordModel}) async {
    String url = AppUrls.commonUrl;

    final data = await _pesuApiService.postApiCallWithQueryParams(
        endPoint: url, queryParams: forgetPasswordModel.toJson());
    return data;
  }
}

class ForgetPasswordApi1 {
  late final PesuApiService _pesuApiService = PesuApiService();

  Future forgetPassword1({
    required int action,
    required int mode,
    required int appId,
    required String loginId,
    required double randomNum,

  }) async {
    String url = AppUrls.commonUrl;
    final data = await _pesuApiService.postApiCall(endPoint: url, params: {
      'action': action,
      'mode': mode,
      'appId': appId,
      'randomNum': randomNum,
      'loginId':loginId,


    });
    if (data != null) {

      // return UpdatePasswordModel.fromJson(data);
      log("msg$data");

    }


  }
}

