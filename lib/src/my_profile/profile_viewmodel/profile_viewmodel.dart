import 'package:flutter/cupertino.dart';
import 'package:pesu/src/my_profile/api/my_profile_api.dart';
import 'package:pesu/src/my_profile/model/profile_model.dart';
import 'package:pesu/src/my_profile/model/update_detail_model.dart';
import 'package:pesu/src/my_profile/model/update_password_model.dart';

import '../model/profile_detail/-model.dart';

class ProfileViewmodel extends ChangeNotifier {
  late final ProfileApi _apiService = ProfileApi();
  late final ProfileDetailApi _api = ProfileDetailApi();
  late final UpdatePasswordApi updatePasswordApi = UpdatePasswordApi();
  late final UpdateDetailApi updateDetailApi = UpdateDetailApi();
  ProfileModel? profileModel;
  ProfileDetailModel? profileDetailModel;


  void getProfileDetails(
      {required int action,required int mode, required String userId,required double randomNum, required String callMethod,required bool isProfileRequest })
  async {
    final data = await _apiService.fetchProfileDetails(action: action,mode:
    mode,userId: userId,randomNum:randomNum,callMethod: callMethod, isProfileRequest: isProfileRequest);

    profileModel = data;

    notifyListeners();

  }

  void getProfileDetailsData(
      {required int action,required int mode, required String userId,required double randomNum, required String callMethod,
  required String loginId, required String searchUserId,required int userType,required String userRoleId })
  async {
    final data = await _api.fetchProfileDetailsData(action: action, mode: mode, randomNum: randomNum, userId: userId, callMethod: callMethod, loginId: loginId, searchUserId: searchUserId, userType: userType, userRoleId: userRoleId);

    profileDetailModel = data;

    notifyListeners();

  }


  dynamic getUpdatePasswordDetails(
      {required UpdatePasswordModel updatePasswordModel}) async {
    final data = await updatePasswordApi.updatePasswordDetails(
        updatePasswordModel: updatePasswordModel);
    return data;
  }
  dynamic getUpdateDetails(
      {required UpdateDetailModel updateDetailModel}) async {
    final data = await updateDetailApi.updateDetails(
        updateDetailModel: updateDetailModel);
    return data;
  }

}