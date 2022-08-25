class LoginResponseModel {
  USERDETAILS? uSERDETAILS;
  List<PARENTDETAILS>? pARENTDETAILS;
  String? mobileAppAuthenticationToken;

  LoginResponseModel(
      {this.uSERDETAILS,
        this.pARENTDETAILS,
        this.mobileAppAuthenticationToken});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    uSERDETAILS = json['USERDETAILS'] != null
        ? new USERDETAILS.fromJson(json['USERDETAILS'])
        : null;
    if (json['PARENTDETAILS'] != null) {
      pARENTDETAILS = <PARENTDETAILS>[];
      json['PARENTDETAILS'].forEach((v) {
        pARENTDETAILS!.add(new PARENTDETAILS.fromJson(v));
      });
    }
    mobileAppAuthenticationToken = json['mobileAppAuthenticationToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.uSERDETAILS != null) {
      data['USERDETAILS'] = this.uSERDETAILS!.toJson();
    }
    if (this.pARENTDETAILS != null) {
      data['PARENTDETAILS'] =
          this.pARENTDETAILS!.map((v) => v.toJson()).toList();
    }
    data['mobileAppAuthenticationToken'] = this.mobileAppAuthenticationToken;
    return data;
  }
}

class USERDETAILS {
  String? userId;
  String? loginId;
  int? userStatus;
  String? firstName;
  String? profilePicture;
  String? program;
  String? programAbbreviation;
  int? ucprogramid;
  bool? ucprogramidNull;
  int? programId;
  bool? programIdNull;
  String? branch;
  String? branchAbbreviation;
  String? sectionName;
  int? classBatchSectionId;
  bool? classBatchSectionIdNull;
  int? batchClassId;
  bool? batchClassIdNull;
  String? className;
  int? classId;
  bool? classIdNull;
  String? stream;
  int? batchId;
  bool? batchIdNull;

  USERDETAILS(
      {this.userId,
        this.loginId,
        this.userStatus,
        this.firstName,
        this.profilePicture,
        this.program,
        this.programAbbreviation,
        this.ucprogramid,
        this.ucprogramidNull,
        this.programId,
        this.programIdNull,
        this.branch,
        this.branchAbbreviation,
        this.sectionName,
        this.classBatchSectionId,
        this.classBatchSectionIdNull,
        this.batchClassId,
        this.batchClassIdNull,
        this.className,
        this.classId,
        this.classIdNull,
        this.stream,
        this.batchId,
        this.batchIdNull});

  USERDETAILS.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    loginId = json['loginId'];
    userStatus = json['userStatus'];
    firstName = json['firstName'];
    profilePicture = json['profilePicture'];
    program = json['program'];
    programAbbreviation = json['programAbbreviation'];
    ucprogramid = json['ucprogramid'];
    ucprogramidNull = json['ucprogramidNull'];
    programId = json['programId'];
    programIdNull = json['programIdNull'];
    branch = json['branch'];
    branchAbbreviation = json['branchAbbreviation'];
    sectionName = json['sectionName'];
    classBatchSectionId = json['classBatchSectionId'];
    classBatchSectionIdNull = json['classBatchSectionIdNull'];
    batchClassId = json['batchClassId'];
    batchClassIdNull = json['batchClassIdNull'];
    className = json['className'];
    classId = json['classId'];
    classIdNull = json['classIdNull'];
    stream = json['stream'];
    batchId = json['batchId'];
    batchIdNull = json['batchIdNull'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['loginId'] = this.loginId;
    data['userStatus'] = this.userStatus;
    data['firstName'] = this.firstName;
    data['profilePicture'] = this.profilePicture;
    data['program'] = this.program;
    data['programAbbreviation'] = this.programAbbreviation;
    data['ucprogramid'] = this.ucprogramid;
    data['ucprogramidNull'] = this.ucprogramidNull;
    data['programId'] = this.programId;
    data['programIdNull'] = this.programIdNull;
    data['branch'] = this.branch;
    data['branchAbbreviation'] = this.branchAbbreviation;
    data['sectionName'] = this.sectionName;
    data['classBatchSectionId'] = this.classBatchSectionId;
    data['classBatchSectionIdNull'] = this.classBatchSectionIdNull;
    data['batchClassId'] = this.batchClassId;
    data['batchClassIdNull'] = this.batchClassIdNull;
    data['className'] = this.className;
    data['classId'] = this.classId;
    data['classIdNull'] = this.classIdNull;
    data['stream'] = this.stream;
    data['batchId'] = this.batchId;
    data['batchIdNull'] = this.batchIdNull;
    return data;
  }
}

class PARENTDETAILS {
  int? userParentId;
  String? userId;
  String? name;
  String? email;
  String? mobileNumber;
  String? qualification;
  String? occupation;
  String? designation;
  String? employerDetails;
  int? annualIncome;
  bool? annualIncomeNull;
  String? isAlumni;
  int? type;
  bool? typeNull;
  int? status;
  bool? statusNull;

  PARENTDETAILS(
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

  PARENTDETAILS.fromJson(Map<String, dynamic> json) {
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