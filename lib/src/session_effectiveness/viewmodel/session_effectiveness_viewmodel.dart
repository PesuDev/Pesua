import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:pesu/src/session_effectiveness/api/session_effectiveness_api.dart';
import 'package:pesu/src/session_effectiveness/model/session_effectiveness.dart';

import '../../../utils/constants/sp_constants.dart';
import '../../../utils/services/sharedpreference_utils.dart';

class SessionEffectivenessViewmodel extends ChangeNotifier {
  late final SessionEffectivenessApi _sessionEffectivenessApi = SessionEffectivenessApi();
  late final FeedbackApi _feedbackApi = FeedbackApi();
  SessionEffectivenessModel? sessionEffectivenessModel;
  List<String> items = [''];
  List<String> items1 = [''];
  SharedPreferenceUtil preferenceUtil=SharedPreferenceUtil();



  void getSessionDetail(
      {required int action,required int mode,
        required double randomNum, required int dayNumber })
  async {
    String? userId=await preferenceUtil.getString(sp_userId);

    final data = await _sessionEffectivenessApi.fetchSessionDetail(action: action,mode:
    mode,userId: userId.toString(),randomNum:randomNum,dayNumber: dayNumber);
    this.items = data?.timetableList?.map((e) => e.subjectName.toString()).toList() ?? <String>[];
    this.items1 = data?.timetableList?.map((e) => e.startTiming.toString()).toList() ?? <String>[];

    sessionEffectivenessModel= data;

    notifyListeners();


  }


  Future<void>feedbackDetails(
      {
        required int action,
        required int mode,
        required int subjectId,
        required int status,
        required int BatchId,
        required int BatchClassId,
        required int ClassBatchSectionId,
        required int ClassId,
        required int DepartmentId,
        required int ProgramId,
        required String isLocallySavedData,
        required  String subjectCode,
        required String timeTableTemplateDetailsId,
        required double randomNum,
      })
  async {
    String? userId=await preferenceUtil.getString(sp_userId);


    final data = await _feedbackApi.feedbackData(action: action,
        mode: mode, subjectId: subjectId, status: status,
        BatchId: BatchId, BatchClassId: BatchClassId,
        ClassBatchSectionId: ClassBatchSectionId, ClassId: ClassId,
        DepartmentId: DepartmentId, ProgramId: ProgramId,
        isLocallySavedData: isLocallySavedData, subjectCode: subjectCode,
        userId: userId.toString(), timeTableTemplateDetailsId: timeTableTemplateDetailsId,
        randomNum: randomNum);
    notifyListeners();

  }

}