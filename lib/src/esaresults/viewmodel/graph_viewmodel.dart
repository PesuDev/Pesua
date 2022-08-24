import 'package:flutter/cupertino.dart';
import 'package:pesu/src/esaresults/model/graph_model.dart';

import '../api/esa_api.dart';
import '../api/graph_api.dart';
import '../model/esa_model.dart';

class GraphViewModel extends ChangeNotifier {
  late final GraphApi _apiService = GraphApi();
  GraphModel? graphModel;
  List<Data>? data;

  void getGraphData(
      {required int action,
      required int mode,
      required double randomNum,
      required String usn,
      required String subjectCode}) async {
    final data = await _apiService.fetchGraphInfo(
      action: action,
      mode: mode,
      usn: usn,
      subjectCode: subjectCode,
      randomNum: randomNum,
    );

    graphModel = data;
    notifyListeners();
  }
}
