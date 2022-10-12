import 'package:flutter/cupertino.dart';
import 'package:pesu/src/login/api/login_api_service.dart';
import 'package:pesu/src/login/model/login_redircted_model.dart';
import 'package:pesu/src/login/model/login_request_model.dart';

import '../../../utils/constants/sp_constants.dart';
import '../../../utils/services/sharedpreference_utils.dart';
import '../model/forget_password_model.dart';
import '../model/login_response_model.dart';

class LoginViewModel extends ChangeNotifier {
  late final LoginApiService _apiService = LoginApiService();
 // late final ForgetPasswordApi forgetPasswordApi = ForgetPasswordApi();
  late final ForgetPasswordApi1 forgetPasswordApi1 = ForgetPasswordApi1();
  LoginModel? loginResponseModel;
  SharedPreferenceUtil preferenceUtil=SharedPreferenceUtil();


  Future  getLoginDetails(
      {required String username,required String password}) async {
    final response = await _apiService.fetchLoginDetails(
      password: password,username: username);
loginResponseModel=response;
    notifyListeners();
    print(">>>> ${loginResponseModel?.batchClass}");

return loginResponseModel;
  }


  Future<void>forgetPasswordDetails1(
      {  required int action,
        required int mode,
        required int appId,
        required String loginId,
        required double randomNum,
      })
  async {
    String? loginId=await preferenceUtil.getString(sp_loginId);

    final data = await forgetPasswordApi1.forgetPassword1(
        action:action,mode:mode,appId:appId,loginId:loginId.toString(),randomNum:randomNum);


    notifyListeners();

  }
}
