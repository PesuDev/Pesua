import 'package:flutter/cupertino.dart';
import 'package:pesu/src/seatinginfo/api/seating_info_api.dart';

import '../../../utils/constants/sp_constants.dart';
import '../../../utils/services/sharedpreference_utils.dart';
import '../model/seating_info_model.dart';

class SeatingInfoViewModel extends ChangeNotifier {
  late final SeatingInfoApi _apiService = SeatingInfoApi();
  List<SeatingInfoModel>? seatingInfoModel;

  List<SeatingInfoModel> differentSeatingInfoModel=[];
  List<SeatingInfoModel> sameSeatingInfoModel=[];
  SharedPreferenceUtil preferenceUtil=SharedPreferenceUtil();


  void getSeatingInfoDetails(
      {required int action,
      required int mode,
      required String callMethod,
      required double randomNum,}) async {
    String? userId=await preferenceUtil.getString(sp_userId);

    final data = await _apiService.fetchSeatingInfoDetails(
        action: action,
        mode: mode,
        userId: userId.toString(),
        randomNum: randomNum,
        callMethod: callMethod);

     seatingInfoModel = data;
     if(data !=null){
for(int i=0; i<data!.length; i++){
  for(int j=i; j<data.length-1;j++) {
 if (i == j) {
      if (data[i].assessmentName == data[j + 1].assessmentName &&
          data[i].roomName == data[j + 1].roomName) {
        sameSeatingInfoModel.add(data[j-1]);
      }
    }
    else {
      if (data[i].assessmentName == data[j ].assessmentName &&
          data[i].roomName == data[j].roomName) {
        sameSeatingInfoModel.add(data[j]);
      }
    }
  }
  if(i==data.length-1){
    if(data[i].assessmentName==data[i-1].assessmentName && data[i].roomName==data[i-1].roomName){
      sameSeatingInfoModel.add(data[i]);
    }
  }

  // if(i==data.length-1){
  //   if(data[i])
  //   print("oye");
  // }
}
}
    notifyListeners();

  }
}
