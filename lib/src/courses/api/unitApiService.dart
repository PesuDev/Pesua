import 'package:pesu/src/courses/model/unitModel.dart';
import 'package:pesu/src/courses/viewModel/unitViewModel.dart';
import 'package:pesu/utils/constants/app_urls.dart';
import 'package:pesu/utils/services/pesu_api_service.dart';

class UnitApiService {
  PesuApiService _pesuApiService = PesuApiService();

  Future<List<UnitModel>?> fetchUnitDetails(
      {required int action,
      required int mode,
      required int subjectId,
      required int ccId,
      required double randomNum}) async {
    String url = AppUrls.commonUrl;
    final data = await _pesuApiService.postApiCall(endPoint: url, params: {
      'action': action,
      'mode': mode,
      'subjectId': subjectId,
      'ccId': ccId,
      'randomNum': randomNum
    });
    if (data != null) {
      Iterable iterable = data;
      return iterable.map((e) => UnitModel.fromJson(e)).toList();
    }
  }
}
