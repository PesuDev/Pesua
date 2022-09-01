import 'package:flutter/cupertino.dart';
import 'package:pesu/src/my_profile/api/my_profile_api.dart';
import 'package:pesu/src/my_profile/model/profile_model.dart';
import 'package:pesu/src/my_profile/model/update_detail_model.dart';
import 'package:pesu/src/my_profile/model/update_password_model.dart';

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



   Future<void>getUpdatePasswordDetails1(
      {required int action,required int mode,required double randomNum,
        required String oldPass,
        required String newPass,
        required String newPass1,
        required String userId,
        required String loginId,
      })
  async {
    final data = await updatePasswordApi1.updatePasswordDetails1(action: action, mode: mode, randomNum: randomNum, oldPass:oldPass,newPass:newPass,newPass1:newPass1,userId:userId,
    loginId:loginId);


    notifyListeners();

  }
   Future<void>getUpdateDetails1(
      {required int action,
        required int mode,
        required String phone,
        required double randomNum,
        required String userId,
        required String email,
      })
  async {
    final data = await updateDetailApi1.updateDetails1(action:action,mode:mode,email:email,phone:phone,userId:userId,randomNum:randomNum);


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