import 'package:flutter/cupertino.dart';
import 'package:pesu/src/login/api/login_api_service.dart';
import 'package:pesu/src/login/model/login_request_model.dart';

import '../model/login_response_model.dart';

class LoginViewModel extends ChangeNotifier {
  late final LoginApiService _apiService = LoginApiService();

  Future<LoginResponseModel?> getLoginDetails(
      {required LoginRequestModel loginRequestModel}) async {
    final data = await _apiService.fetchLoginDetails(
        loginRequestModel: loginRequestModel);
    return data;
  }
}
