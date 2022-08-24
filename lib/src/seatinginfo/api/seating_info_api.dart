
import 'package:pesu/utils/constants/app_urls.dart';
import 'package:pesu/utils/services/pesu_api_service.dart';
import '../model/seating_info_model.dart';

class SeatingInfoApi {
  late final PesuApiService _pesuApiService = PesuApiService();

  Future<List<SeatingInfoModel>?> fetchSeatingInfoDetails({
    required int action,
    required int mode,
    required double randomNum,
    required String callMethod,
    required String userId,
  }) async {
    String url = AppUrls.commonUrl;
    final data = await _pesuApiService.postApiCall(endPoint: url, params: {
      'action': action,
      'mode': mode,
      'userId': userId,
      'randomNum': randomNum,
      'callMethod': callMethod
    });
    if (data != null) {
      Iterable iterable = data;
      return iterable.map((e) => SeatingInfoModel.fromJson(e)).toList();
    }
  }
}
