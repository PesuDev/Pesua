
import 'package:flutter/cupertino.dart';
import 'package:pesu/src/my_profile/api/my_profile_api.dart';
import 'package:pesu/src/my_profile/model/profile_model.dart';
import 'package:pesu/src/my_profile/model/update_detail_model.dart';
import 'package:pesu/src/my_profile/model/update_password_model.dart';
import 'package:pesu/utils/constants/sp_constants.dart';

import '../../../utils/services/sharedpreference_utils.dart';
import '../model/profile_detail/-model.dart';

class ProfileViewmodel extends ChangeNotifier {
  late final ProfileApi _apiService = ProfileApi();
  late final ProfileDetailApi _api = ProfileDetailApi();
  //late final UpdatePasswordApi updatePasswordApi = UpdatePasswordApi();
  late final UpdatePasswordApi1 updatePasswordApi1 = UpdatePasswordApi1();
  // late final UpdateDetailApi updateDetailApi = UpdateDetailApi();
  late final UpdateDetailApi1 updateDetailApi1 = UpdateDetailApi1();
  ProfileModel? profileModel;
  ProfileDetailModel? profileDetailModel;
  UpdatePasswordModel? updatePasswordModel;
  SharedPreferenceUtil preferenceUtil=SharedPreferenceUtil();
  void getProfileDetails(
      {required int action,required int mode, required double randomNum, required String callMethod,required bool isProfileRequest })
  async {
    String? userId=await preferenceUtil.getString(sp_userId);
    final data = await _apiService.fetchProfileDetails(action: action,mode:
    mode,userId: userId.toString(),randomNum:randomNum,callMethod: callMethod, isProfileRequest: isProfileRequest);

    profileModel = data;

    notifyListeners();

  }

  void getProfileDetailsData(
      {required int action,required int mode,required double randomNum, required String callMethod,
         required String searchUserId,required int userType })
  async {
    String? userId=await preferenceUtil.getString(sp_userId);
    String? loginId=await preferenceUtil.getString(sp_loginId);
    String? userRoleId=await preferenceUtil.getString(sp_userRoleId);

    final data = await _api.fetchProfileDetailsData(action: action, mode: mode, randomNum: randomNum,
        userId: userId.toString(), callMethod: callMethod,
        loginId: loginId.toString(), searchUserId: searchUserId, userType: userType, userRoleId: userRoleId.toString());

    profileDetailModel = data;

    notifyListeners();

  }



  Future<void>getUpdatePasswordDetails1(
      {required int action,required int mode,required double randomNum,
        required String oldPass,
        required String newPass,
        required String newPass1,
      })
  async {
    String? userId=await preferenceUtil.getString(sp_userId);
    String? loginId=await preferenceUtil.getString(sp_loginId);
    String? oldPass=await preferenceUtil.getString(sp_password);
    final data = await updatePasswordApi1.updatePasswordDetails1(
        action: action, mode: mode, randomNum: randomNum,
        oldPass:oldPass.toString(),
        newPass:newPass,newPass1:newPass1,
        userId:userId.toString(),
        loginId:loginId.toString());


    notifyListeners();

  }
  Future<void>getUpdateDetails1(
      {required int action,
        required int mode,
        required String phone,
        required double randomNum,
        required String email,
      })
  async {
    String? userId=await preferenceUtil.getString(sp_userId);

    final data = await updateDetailApi1.updateDetails1(
        action:action,mode:mode,email:email,
        phone:phone,
        userId:userId.toString(),randomNum:randomNum);


    notifyListeners();

  }


// dynamic getUpdatePasswordDetails(
//     {required UpdatePasswordModel updatePasswordModel}) async {
//   final data = await updatePasswordApi.updatePasswordDetails(
//       updatePasswordModel: updatePasswordModel);
//   return data;
// }
// dynamic getUpdateDetails(
//     {required UpdateDetailModel updateDetailModel}) async {
//   final data = await updateDetailApi.updateDetails(
//       updateDetailModel: updateDetailModel);
//   return data;
// }

}