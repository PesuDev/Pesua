import 'package:flutter/material.dart';
import 'package:pesu/src/courses/api/subjectApiService.dart';
import 'package:pesu/src/courses/model/subjectModel.dart';

class SubjectViewModel extends ChangeNotifier {
  final SubjectAPiService _subjectAPiService = SubjectAPiService();
  SubjectModel? subjectModel;
  List<COURSECONTENT>? courseContent;

  void getSubjectContentDetails(
      {required int action,
      required int mode,
      required int subjectId,
      required String subjectName,
      required double randomNum}) async {
    final data = await _subjectAPiService.fetchSubjectContent(
        action: action,
        mode: mode,
        subjectId: subjectId,
        subjectName: subjectName,
        randomNum: randomNum);
    subjectModel = data;

    notifyListeners();
  }
}
