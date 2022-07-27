import 'package:pesu/utils/constants/app_urls.dart';
import 'package:pesu/utils/services/pesu_api_service.dart';

import '../model/login_model.dart';

class LoginApiService {
  late final PesuApiService _pesuApiService = PesuApiService();

  dynamic fetchLoginDetails(
      {required LoginRequestModel loginRequestModel}) async {
    String url = AppUrls.loginUrl;

    final data = await _pesuApiService.postApiCallWithQueryParams(
        endPoint: url, queryParams: loginRequestModel.toJson());
    return data;
  }
}
