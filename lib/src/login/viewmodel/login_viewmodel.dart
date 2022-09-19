import 'package:flutter/cupertino.dart';
import 'package:pesu/src/login/api/login_api_service.dart';
import 'package:pesu/src/login/model/login_redircted_model.dart';
import 'package:pesu/src/login/model/login_request_model.dart';

import '../model/forget_password_model.dart';
import '../model/login_response_model.dart';

class LoginViewModel extends ChangeNotifier {
  late final LoginApiService _apiService = LoginApiService();
 // late final ForgetPasswordApi forgetPasswordApi = ForgetPasswordApi();
  late final ForgetPasswordApi1 forgetPasswordApi1 = ForgetPasswordApi1();
  LoginResponseModel? loginResponseModel;
ReDirectModel? reDirectModel;
  Future  getLoginDetails(
      {required LoginRequestModel loginRequestModel}) async {
    final data = await _apiService.fetchLoginDetails(
        loginRequestModel: loginRequestModel);

    if(data?.location !=null){
final response=await _apiService.fetchLoginDetailsRedirect(loginRequestModel: loginRequestModel,path: data!.location.toString());
//loginResponseModel=response;
    }

    notifyListeners();

  }


  Future<void>forgetPasswordDetails1(
      {  required int action,
        required int mode,
        required int appId,
        required String loginId,
        required double randomNum,
      })
  async {
    final data = await forgetPasswordApi1.forgetPassword1(action:action,mode:mode,appId:appId,loginId:loginId,randomNum:randomNum);


    notifyListeners();

  }
}
