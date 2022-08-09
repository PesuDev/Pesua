
import 'package:pesu/utils/constants/app_urls.dart';
import 'package:pesu/utils/services/pesu_api_service.dart';
import '../model/esa_model.dart';


class EsaApi {
  late final PesuApiService _pesuApiService = PesuApiService();

  Future<ESAModel1?> fetchEsaInfoDetails({
    required int action,
    required int mode,
    required double randomNum,
    required String userId,
  }) async {
    String url = AppUrls.commonUrl;
    final data = await _pesuApiService.postApiCall(endPoint: url, params: {
      'action': action,
      'mode': mode,
      'USN': userId,
      'randomNum': randomNum,
    });
    if (data != null) {
      return ESAModel1.fromJson(data);
    }
  }


  Future<ESAModel2?> fetchEsaSemInfo({
    required int action,
    required int mode,
    required double randomNum,
    required String userId,
  }) async {
    String url = AppUrls.commonUrl;
    final data = await _pesuApiService.postApiCall(endPoint: url, params: {
      'action': action,
      'mode': mode,
      'usn': userId,
      'randomNum': randomNum,
    });
    if (data != null) {
      return ESAModel2.fromJson(data);
    }
  }

  Future<ESAModel4?> fetchSubjectInfo({
    required int action,
    required int mode,
    required double randomNum,
    required String userId,
    required int? batchClassId,
    required int classBatchSectionId,
    required int classessId,
    required String className,
    required int isFinalized,
  }) async {
    String url = AppUrls.commonUrl;
    final data = await _pesuApiService.postApiCall(endPoint: url, params: {
      'action': action,
      'mode': mode,
      'usn': userId,
      'randomNum': randomNum,
      'BatchClassId':batchClassId,
      'ClassBatchSectionId': classBatchSectionId,
      'ClassessId':classessId,
      'UserId': userId,
      'ClassName':className,
      'isFinalised':isFinalized,
      'randomNum': randomNum,
    });
    if (data != null) {
      return ESAModel4.fromJson(data);
    }
  }

}
