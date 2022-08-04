class ProfileModel {
  String? userId;
  String? userRoleId;
  String? login;
  Null? errorMessage;
  String? name;
  String? photo;
  Null? testResposeType;
  Null? testErrorMessage;
  String? phone;
  Null? emergencyPhone;
  String? email;
  Null? menuItems;
  Null? cResults;
  Null? results;
  int? serverMode;
  String? redirectValue;
  Null? timeRemaining;
  int? status;
  int? testStatus;
  Null? scheduledQuizTests;
  String? mobileAppTokenError;
  String? program;
  String? branch;
  String? className;
  String? batchClass;
  String? classBatchSection;
  String? sectionName;
  int? programId;
  int? classId;
  String? loginId;
  String? departmentId;
  String? usertype;
  int? instId;
  bool? instIdNull;
  List<UserParentList>? userParentList;
  Null? cxoUsersWards;
  Null? parentRequestedDate;
  int? requestedType;
  int? parentRequestedType;
  Null? requestedDate;
  String? dateofBirth;
  Null? userRequestedDate;

  ProfileModel(
      {this.userId,
        this.userRoleId,
        this.login,
        this.errorMessage,
        this.name,
        this.photo,
        this.testResposeType,
        this.testErrorMessage,
        this.phone,
        this.emergencyPhone,
        this.email,
        this.menuItems,
        this.cResults,
        this.results,
        this.serverMode,
        this.redirectValue,
        this.timeRemaining,
        this.status,
        this.testStatus,
        this.scheduledQuizTests,
        this.mobileAppTokenError,
        this.program,
        this.branch,
        this.className,
        this.batchClass,
        this.classBatchSection,
        this.sectionName,
        this.programId,
        this.classId,
        this.loginId,
        this.departmentId,
        this.usertype,
        this.instId,
        this.instIdNull,
        this.userParentList,
        this.cxoUsersWards,
        this.parentRequestedDate,
        this.requestedType,
        this.parentRequestedType,
        this.requestedDate,
        this.dateofBirth,
        this.userRequestedDate});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    userRoleId = json['userRoleId'];
    login = json['login'];
    errorMessage = json['errorMessage'];
    name = json['name'];
    photo = json['photo'];
    testResposeType = json['testResposeType'];
    testErrorMessage = json['testErrorMessage'];
    phone = json['phone'];
    emergencyPhone = json['emergencyPhone'];
    email = json['email'];
    menuItems = json['menuItems'];
    cResults = json['cResults'];
    results = json['results'];
    serverMode = json['serverMode'];
    redirectValue = json['redirectValue'];
    timeRemaining = json['timeRemaining'];
    status = json['status'];
    testStatus = json['testStatus'];
    scheduledQuizTests = json['scheduledQuizTests'];
    mobileAppTokenError = json['mobileAppTokenError'];
    program = json['program'];
    branch = json['branch'];
    className = json['className'];
    batchClass = json['batchClass'];
    classBatchSection = json['classBatchSection'];
    sectionName = json['sectionName'];
    programId = json['programId'];
    classId = json['classId'];
    loginId = json['loginId'];
    departmentId = json['departmentId'];
    usertype = json['usertype'];
    instId = json['instId'];
    instIdNull = json['instIdNull'];
    if (json['userParentList'] != null) {
      userParentList = <UserParentList>[];
      json['userParentList'].forEach((v) {
        userParentList!.add(new UserParentList.fromJson(v));
      });
    }
    cxoUsersWards = json['cxoUsersWards'];
    parentRequestedDate = json['parentRequestedDate'];
    requestedType = json['requestedType'];
    parentRequestedType = json['parentRequestedType'];
    requestedDate = json['requestedDate'];
    dateofBirth = json['dateofBirth'];
    userRequestedDate = json['userRequestedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['userRoleId'] = this.userRoleId;
    data['login'] = this.login;
    data['errorMessage'] = this.errorMessage;
    data['name'] = this.name;
    data['photo'] = this.photo;
    data['testResposeType'] = this.testResposeType;
    data['testErrorMessage'] = this.testErrorMessage;
    data['phone'] = this.phone;
    data['emergencyPhone'] = this.emergencyPhone;
    data['email'] = this.email;
    data['menuItems'] = this.menuItems;
    data['cResults'] = this.cResults;
    data['results'] = this.results;
    data['serverMode'] = this.serverMode;
    data['redirectValue'] = this.redirectValue;
    data['timeRemaining'] = this.timeRemaining;
    data['status'] = this.status;
    data['testStatus'] = this.testStatus;
    data['scheduledQuizTests'] = this.scheduledQuizTests;
    data['mobileAppTokenError'] = this.mobileAppTokenError;
    data['program'] = this.program;
    data['branch'] = this.branch;
    data['className'] = this.className;
    data['batchClass'] = this.batchClass;
    data['classBatchSection'] = this.classBatchSection;
    data['sectionName'] = this.sectionName;
    data['programId'] = this.programId;
    data['classId'] = this.classId;
    data['loginId'] = this.loginId;
    data['departmentId'] = this.departmentId;
    data['usertype'] = this.usertype;
    data['instId'] = this.instId;
    data['instIdNull'] = this.instIdNull;
    if (this.userParentList != null) {
      data['userParentList'] =
          this.userParentList!.map((v) => v.toJson()).toList();
    }
    data['cxoUsersWards'] = this.cxoUsersWards;
    data['parentRequestedDate'] = this.parentRequestedDate;
    data['requestedType'] = this.requestedType;
    data['parentRequestedType'] = this.parentRequestedType;
    data['requestedDate'] = this.requestedDate;
    data['dateofBirth'] = this.dateofBirth;
    data['userRequestedDate'] = this.userRequestedDate;
    return data;
  }
}

class UserParentList {
  int? userParentId;
  String? userId;
  String? name;
  String? email;
  String? mobileNumber;
  String? qualification;
  String? occupation;
  String? designation;
  String? employerDetails;
  double? annualIncome;
  bool? annualIncomeNull;
  String? isAlumni;
  int? type;
  bool? typeNull;
  int? status;
  bool? statusNull;

  UserParentList(
      {this.userParentId,
        this.userId,
        this.name,
        this.email,
        this.mobileNumber,
        this.qualification,
        this.occupation,
        this.designation,
        this.employerDetails,
        this.annualIncome,
        this.annualIncomeNull,
        this.isAlumni,
        this.type,
        this.typeNull,
        this.status,
        this.statusNull});

  UserParentList.fromJson(Map<String, dynamic> json) {
    userParentId = json['userParentId'];
    userId = json['userId'];
    name = json['name'];
    email = json['email'];
    mobileNumber = json['mobileNumber'];
    qualification = json['qualification'];
    occupation = json['occupation'];
    designation = json['designation'];
    employerDetails = json['employerDetails'];
    annualIncome = json['annualIncome'];
    annualIncomeNull = json['annualIncomeNull'];
    isAlumni = json['isAlumni'];
    type = json['type'];
    typeNull = json['typeNull'];
    status = json['status'];
    statusNull = json['statusNull'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userParentId'] = this.userParentId;
    data['userId'] = this.userId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobileNumber'] = this.mobileNumber;
    data['qualification'] = this.qualification;
    data['occupation'] = this.occupation;
    data['designation'] = this.designation;
    data['employerDetails'] = this.employerDetails;
    data['annualIncome'] = this.annualIncome;
    data['annualIncomeNull'] = this.annualIncomeNull;
    data['isAlumni'] = this.isAlumni;
    data['type'] = this.type;
    data['typeNull'] = this.typeNull;
    data['status'] = this.status;
    data['statusNull'] = this.statusNull;
    return data;
  }
}