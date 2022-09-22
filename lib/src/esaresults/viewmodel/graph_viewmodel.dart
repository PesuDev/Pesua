import 'package:flutter/cupertino.dart';
import 'package:pesu/src/esaresults/model/graph_model.dart';
import '../../../utils/constants/sp_constants.dart';
import '../../../utils/services/sharedpreference_utils.dart';
import '../api/graph_api.dart';

class GraphViewModel extends ChangeNotifier {
  late final GraphApi _apiService = GraphApi();
  GraphModel? graphModel;
  List<Data>? data;
  SharedPreferenceUtil preferenceUtil=SharedPreferenceUtil();

  void getGraphData(
      {required int action,
      required int mode,
      required double randomNum,
      required String subjectCode}) async {
    String? usn=await preferenceUtil.getString(sp_userId);

    final data = await _apiService.fetchGraphInfo(
      action: action,
      mode: mode,
      usn: usn.toString(),
      subjectCode: subjectCode,
      randomNum: randomNum,
    );

    graphModel = data;
    notifyListeners();
  }
}
