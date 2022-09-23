class ProfileDetailModel {
  final String? mESSAGE;
  final PLACEMENTDETAILS? pLACEMENTDETAILS;
  final STUDENTPHOTO? sTUDENTPHOTO;
  final USERROLE? uSERROLE;
  final STUDENTINFO? sTUDENTINFO;
  final List<STUDENTSEMESTERS>? sTUDENTSEMESTERS;
  final List<STUDENTCGPADETAILS>? sTUDENTCGPADETAILS;

  ProfileDetailModel({
    this.mESSAGE,
    this.pLACEMENTDETAILS,
    this.sTUDENTPHOTO,
    this.uSERROLE,
    this.sTUDENTINFO,
    this.sTUDENTSEMESTERS,
    this.sTUDENTCGPADETAILS,
  });

  ProfileDetailModel.fromJson(Map<String, dynamic> json)
      : mESSAGE = json['MESSAGE'] as String?,
        pLACEMENTDETAILS = (json['PLACEMENT_DETAILS'] as Map<String,dynamic>?) != null ? PLACEMENTDETAILS.fromJson(json['PLACEMENT_DETAILS'] as Map<String,dynamic>) : null,
        sTUDENTPHOTO = (json['STUDENT_PHOTO'] as Map<String,dynamic>?) != null ? STUDENTPHOTO.fromJson(json['STUDENT_PHOTO'] as Map<String,dynamic>) : null,
        uSERROLE = (json['USER_ROLE'] as Map<String,dynamic>?) != null ? USERROLE.fromJson(json['USER_ROLE'] as Map<String,dynamic>) : null,
        sTUDENTINFO = (json['STUDENT_INFO'] as Map<String,dynamic>?) != null ? STUDENTINFO.fromJson(json['STUDENT_INFO'] as Map<String,dynamic>) : null,
        sTUDENTSEMESTERS = (json['STUDENT_SEMESTERS'] as List?)?.map((dynamic e) => STUDENTSEMESTERS.fromJson(e as Map<String,dynamic>)).toList(),
        sTUDENTCGPADETAILS = (json['STUDENT_CGPA_DETAILS'] as List?)?.map((dynamic e) => STUDENTCGPADETAILS.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'MESSAGE' : mESSAGE,
    'PLACEMENT_DETAILS' : pLACEMENTDETAILS?.toJson(),
    'STUDENT_PHOTO' : sTUDENTPHOTO?.toJson(),
    'USER_ROLE' : uSERROLE?.toJson(),
    'STUDENT_INFO' : sTUDENTINFO?.toJson(),
    'STUDENT_SEMESTERS' : sTUDENTSEMESTERS?.map((e) => e.toJson()).toList(),
    'STUDENT_CGPA_DETAILS' : sTUDENTCGPADETAILS?.map((e) => e.toJson()).toList()
  };
}

class PLACEMENTDETAILS {
  PLACEMENTDETAILS();

  PLACEMENTDETAILS.fromJson(Map json);

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    return _data;
  }
}

class STUDENTPHOTO {
  final String? userId;
  final String? loginId;
  final int? status;
  final String? gender;
  final String? email;
  final String? dateOfBirth;
  final String? mobile;
  final String? firstName;
  final String? nameAsInSSLC;
  final String? profilePicture;
  final int? programId;
  final bool? programIdNull;
  final int? branchId;
  final bool? branchIdNull;
  final int? instId;
  final bool? instIdNull;
  final String? instituteName;

  STUDENTPHOTO({
    this.userId,
    this.loginId,
    this.status,
    this.gender,
    this.email,
    this.dateOfBirth,
    this.mobile,
    this.firstName,
    this.nameAsInSSLC,
    this.profilePicture,
    this.programId,
    this.programIdNull,
    this.branchId,
    this.branchIdNull,
    this.instId,
    this.instIdNull,
    this.instituteName,
  });

  STUDENTPHOTO.fromJson(Map<String, dynamic> json)
      : userId = json['userId'] as String?,
        loginId = json['loginId'] as String?,
        status = json['status'] as int?,
        gender = json['gender'] as String?,
        email = json['email'] as String?,
        dateOfBirth = json['dateOfBirth'] as String?,
        mobile = json['mobile'] as String?,
        firstName = json['firstName'] as String?,
        nameAsInSSLC = json['nameAsInSSLC'] as String?,
        profilePicture = json['profilePicture'] as String?,
        programId = json['programId'] as int?,
        programIdNull = json['programIdNull'] as bool?,
        branchId = json['branchId'] as int?,
        branchIdNull = json['branchIdNull'] as bool?,
        instId = json['instId'] as int?,
        instIdNull = json['instIdNull'] as bool?,
        instituteName = json['instituteName'] as String?;

  Map<String, dynamic> toJson() => {
    'userId' : userId,
    'loginId' : loginId,
    'status' : status,
    'gender' : gender,
    'email' : email,
    'dateOfBirth' : dateOfBirth,
    'mobile' : mobile,
    'firstName' : firstName,
    'nameAsInSSLC' : nameAsInSSLC,
    'profilePicture' : profilePicture,
    'programId' : programId,
    'programIdNull' : programIdNull,
    'branchId' : branchId,
    'branchIdNull' : branchIdNull,
    'instId' : instId,
    'instIdNull' : instIdNull,
    'instituteName' : instituteName
  };
}

class USERROLE {
  final String? loginId;
  final String? userId;
  final String? userTypeId;
  final String? userRoleId;

  USERROLE({
    this.loginId,
    this.userId,
    this.userTypeId,
    this.userRoleId,
  });

  USERROLE.fromJson(Map<String, dynamic> json)
      : loginId = json['LoginId'] as String?,
        userId = json['UserId'] as String?,
        userTypeId = json['UserTypeId'] as String?,
        userRoleId = json['UserRoleId'] as String?;

  Map<String, dynamic> toJson() => {
    'LoginId' : loginId,
    'UserId' : userId,
    'UserTypeId' : userTypeId,
    'UserRoleId' : userRoleId
  };
}

class STUDENTINFO {
  final String? userId;
  final String? loginId;
  final String? sRN;
  final int? status;
  final String? stateName;
  final String? firstName;
  final String? middleName;
  final String? lastName;
  final String? nameAsInSSLC;
  final String? email;
  final String? dateOfBirth;
  final String? placeOfBirth;
  final String? gender;
  final String? religion;
  final String? minority;
  final String? caste;
  final String? language;
  final String? otherLanguage;
  final String? citizenship;
  final String? familySize;
  final String? bloodGroup;
  final String? cocurricular;
  final String? nationality;
  final String? otherNationality;
  final String? mobile;
  final String? handicapped;
  final String? physicallyChallenged;
  final String? visuallyChallenged;
  final String? fatherName;
  final String? fatherEmail;
  final String? fatherMobileNo;
  final String? fatherQualification;
  final String? fatherOccupation;
  final String? fatherDesignation;
  final String? fatherEmployerDetails;
  final double? fatherAnnualIncome;
  final String? fatherIsAlumni;
  final String? motherName;
  final String? motherEmail;
  final String? motherMobileNo;
  final String? motherQualification;
  final String? motherOccupation;
  final String? motherDesignation;
  final String? motherEmployerDetails;
  final double? motherAnnualIncome;
  final String? motherIsAlumni;
  final String? permanentAddress;
  final String? permanentState;
  final String? permanentOtherState;
  final String? permanentCountry;
  final String? permanentPinCode;
  final String? permanentMobilePhone;
  final String? permanentResidencePhone;
  final String? localAddress;
  final String? localState;
  final String? localOtherState;
  final String? localCountry;
  final String? localPinCode;
  final String? localMobilePhone;
  final String? localResidencePhone;
  final int? submittedOn;
  final int? approvedDate;
  final int? programId;
  final String? program;
  final String? programAbbreviation;
  final int? branchId;
  final String? branchAbbreviation;
  final String? branch;
  final int? quotaId;
  final String? quota;
  final int? entranceExamId;
  final String? entranceExam;
  final int? actualCategoryId;
  final String? actualCategory;
  final int? allottedCategory;
  final String? admissionCategory;
  final int? isNormalEntry;
  final String? otherAllottedCategory;
  final int? batchId;
  final int? domicileId;
  final String? domicile;
  final String? qualifyingExamination;
  final String? anyOneQualifyingSubjects;
  final String? allotmentNumber;
  final String? allotmentDate;
  final String? entranceExamRollNo;
  final dynamic quotaApplicationId;
  final String? rank;
  final String? entranceExamScore;
  final String? gateValidUpto;
  final String? sSLCUniversityOrBoard;
  final String? sSLCInstituteLeftOn;
  final String? sSLCMediumOfInstruction;
  final String? sSLCRegisterNo;
  final String? sSLCYearOfPassing;
  final String? sSLCMarksObtained;
  final String? sSLCMaximumMarks;
  final String? sSLCPercentage;
  final String? sSLCCountry;
  final String? pUCUniversityOrBoard;
  final String? pUCInstituteLeftOn;
  final String? pUCMediumOfInstruction;
  final String? pUCRegisterNo;
  final String? pUCYearOfPassing;
  final String? pUCMarksObtained;
  final String? pUCMaximumMarks;
  final String? pUCPhysicsObtained;
  final String? pUCPhysicsTotal;
  final String? pUCChemistryObtained;
  final String? pUCChemistryTotal;
  final String? pUCMathObtained;
  final String? pUCMathTotal;
  final String? pCMObtained;
  final String? pCMPCMTotal;
  final int? classesId;
  final String? sectionName;
  final int? classBatchSectionId;
  final String? className;
  final int? departmentId;

  STUDENTINFO({
    this.userId,
    this.loginId,
    this.sRN,
    this.status,
    this.stateName,
    this.firstName,
    this.middleName,
    this.lastName,
    this.nameAsInSSLC,
    this.email,
    this.dateOfBirth,
    this.placeOfBirth,
    this.gender,
    this.religion,
    this.minority,
    this.caste,
    this.language,
    this.otherLanguage,
    this.citizenship,
    this.familySize,
    this.bloodGroup,
    this.cocurricular,
    this.nationality,
    this.otherNationality,
    this.mobile,
    this.handicapped,
    this.physicallyChallenged,
    this.visuallyChallenged,
    this.fatherName,
    this.fatherEmail,
    this.fatherMobileNo,
    this.fatherQualification,
    this.fatherOccupation,
    this.fatherDesignation,
    this.fatherEmployerDetails,
    this.fatherAnnualIncome,
    this.fatherIsAlumni,
    this.motherName,
    this.motherEmail,
    this.motherMobileNo,
    this.motherQualification,
    this.motherOccupation,
    this.motherDesignation,
    this.motherEmployerDetails,
    this.motherAnnualIncome,
    this.motherIsAlumni,
    this.permanentAddress,
    this.permanentState,
    this.permanentOtherState,
    this.permanentCountry,
    this.permanentPinCode,
    this.permanentMobilePhone,
    this.permanentResidencePhone,
    this.localAddress,
    this.localState,
    this.localOtherState,
    this.localCountry,
    this.localPinCode,
    this.localMobilePhone,
    this.localResidencePhone,
    this.submittedOn,
    this.approvedDate,
    this.programId,
    this.program,
    this.programAbbreviation,
    this.branchId,
    this.branchAbbreviation,
    this.branch,
    this.quotaId,
    this.quota,
    this.entranceExamId,
    this.entranceExam,
    this.actualCategoryId,
    this.actualCategory,
    this.allottedCategory,
    this.admissionCategory,
    this.isNormalEntry,
    this.otherAllottedCategory,
    this.batchId,
    this.domicileId,
    this.domicile,
    this.qualifyingExamination,
    this.anyOneQualifyingSubjects,
    this.allotmentNumber,
    this.allotmentDate,
    this.entranceExamRollNo,
    this.quotaApplicationId,
    this.rank,
    this.entranceExamScore,
    this.gateValidUpto,
    this.sSLCUniversityOrBoard,
    this.sSLCInstituteLeftOn,
    this.sSLCMediumOfInstruction,
    this.sSLCRegisterNo,
    this.sSLCYearOfPassing,
    this.sSLCMarksObtained,
    this.sSLCMaximumMarks,
    this.sSLCPercentage,
    this.sSLCCountry,
    this.pUCUniversityOrBoard,
    this.pUCInstituteLeftOn,
    this.pUCMediumOfInstruction,
    this.pUCRegisterNo,
    this.pUCYearOfPassing,
    this.pUCMarksObtained,
    this.pUCMaximumMarks,
    this.pUCPhysicsObtained,
    this.pUCPhysicsTotal,
    this.pUCChemistryObtained,
    this.pUCChemistryTotal,
    this.pUCMathObtained,
    this.pUCMathTotal,
    this.pCMObtained,
    this.pCMPCMTotal,
    this.classesId,
    this.sectionName,
    this.classBatchSectionId,
    this.className,
    this.departmentId,
  });

  STUDENTINFO.fromJson(Map<String, dynamic> json)
      : userId = json['UserId'] as String?,
        loginId = json['LoginId'] as String?,
        sRN = json['SRN'] as String?,
        status = json['Status'] as int?,
        stateName = json['StateName'] as String?,
        firstName = json['FirstName'] as String?,
        middleName = json['MiddleName'] as String?,
        lastName = json['LastName'] as String?,
        nameAsInSSLC = json['NameAsInSSLC'] as String?,
        email = json['Email'] as String?,
        dateOfBirth = json['DateOfBirth'] as String?,
        placeOfBirth = json['PlaceOfBirth'] as String?,
        gender = json['Gender'] as String?,
        religion = json['Religion'] as String?,
        minority = json['Minority'] as String?,
        caste = json['Caste'] as String?,
        language = json['Language'] as String?,
        otherLanguage = json['OtherLanguage'] as String?,
        citizenship = json['Citizenship'] as String?,
        familySize = json['FamilySize'] as String?,
        bloodGroup = json['BloodGroup'] as String?,
        cocurricular = json['Cocurricular'] as String?,
        nationality = json['Nationality'] as String?,
        otherNationality = json['OtherNationality'] as String?,
        mobile = json['Mobile'] as String?,
        handicapped = json['Handicapped'] as String?,
        physicallyChallenged = json['PhysicallyChallenged'] as String?,
        visuallyChallenged = json['VisuallyChallenged'] as String?,
        fatherName = json['FatherName'] as String?,
        fatherEmail = json['FatherEmail'] as String?,
        fatherMobileNo = json['FatherMobileNo'] as String?,
        fatherQualification = json['FatherQualification'] as String?,
        fatherOccupation = json['FatherOccupation'] as String?,
        fatherDesignation = json['FatherDesignation'] as String?,
        fatherEmployerDetails = json['FatherEmployerDetails'] as String?,
        fatherAnnualIncome = json['FatherAnnualIncome'] as double?,
        fatherIsAlumni = json['FatherIsAlumni'] as String?,
        motherName = json['MotherName'] as String?,
        motherEmail = json['MotherEmail'] as String?,
        motherMobileNo = json['MotherMobileNo'] as String?,
        motherQualification = json['MotherQualification'] as String?,
        motherOccupation = json['MotherOccupation'] as String?,
        motherDesignation = json['MotherDesignation'] as String?,
        motherEmployerDetails = json['MotherEmployerDetails'] as String?,
        motherAnnualIncome = json['MotherAnnualIncome'] as double?,
        motherIsAlumni = json['MotherIsAlumni'] as String?,
        permanentAddress = json['PermanentAddress'] as String?,
        permanentState = json['PermanentState'] as String?,
        permanentOtherState = json['PermanentOtherState'] as String?,
        permanentCountry = json['PermanentCountry'] as String?,
        permanentPinCode = json['PermanentPinCode'] as String?,
        permanentMobilePhone = json['PermanentMobilePhone'] as String?,
        permanentResidencePhone = json['PermanentResidencePhone'] as String?,
        localAddress = json['LocalAddress'] as String?,
        localState = json['LocalState'] as String?,
        localOtherState = json['LocalOtherState'] as String?,
        localCountry = json['LocalCountry'] as String?,
        localPinCode = json['LocalPinCode'] as String?,
        localMobilePhone = json['LocalMobilePhone'] as String?,
        localResidencePhone = json['LocalResidencePhone'] as String?,
        submittedOn = json['SubmittedOn'] as int?,
        approvedDate = json['ApprovedDate'] as int?,
        programId = json['ProgramId'] as int?,
        program = json['Program'] as String?,
        programAbbreviation = json['ProgramAbbreviation'] as String?,
        branchId = json['BranchId'] as int?,
        branchAbbreviation = json['BranchAbbreviation'] as String?,
        branch = json['Branch'] as String?,
        quotaId = json['QuotaId'] as int?,
        quota = json['Quota'] as String?,
        entranceExamId = json['EntranceExamId'] as int?,
        entranceExam = json['EntranceExam'] as String?,
        actualCategoryId = json['ActualCategoryId'] as int?,
        actualCategory = json['ActualCategory'] as String?,
        allottedCategory = json['AllottedCategory'] as int?,
        admissionCategory = json['AdmissionCategory'] as String?,
        isNormalEntry = json['IsNormalEntry'] as int?,
        otherAllottedCategory = json['OtherAllottedCategory'] as String?,
        batchId = json['BatchId'] as int?,
        domicileId = json['DomicileId'] as int?,
        domicile = json['Domicile'] as String?,
        qualifyingExamination = json['QualifyingExamination'] as String?,
        anyOneQualifyingSubjects = json['AnyOneQualifyingSubjects'] as String?,
        allotmentNumber = json['AllotmentNumber'] as String?,
        allotmentDate = json['AllotmentDate'] as String?,
        entranceExamRollNo = json['EntranceExamRollNo'] as String?,
        quotaApplicationId = json['QuotaApplicationId'],
        rank = json['Rank'] as String?,
        entranceExamScore = json['EntranceExamScore'] as String?,
        gateValidUpto = json['GateValidUpto'] as String?,
        sSLCUniversityOrBoard = json['SSLCUniversityOrBoard'] as String?,
        sSLCInstituteLeftOn = json['SSLCInstituteLeftOn'] as String?,
        sSLCMediumOfInstruction = json['SSLCMediumOfInstruction'] as String?,
        sSLCRegisterNo = json['SSLCRegisterNo'] as String?,
        sSLCYearOfPassing = json['SSLCYearOfPassing'] as String?,
        sSLCMarksObtained = json['SSLCMarksObtained'] as String?,
        sSLCMaximumMarks = json['SSLCMaximumMarks'] as String?,
        sSLCPercentage = json['SSLCPercentage'] as String?,
        sSLCCountry = json['SSLCCountry'] as String?,
        pUCUniversityOrBoard = json['PUCUniversityOrBoard'] as String?,
        pUCInstituteLeftOn = json['PUCInstituteLeftOn'] as String?,
        pUCMediumOfInstruction = json['PUCMediumOfInstruction'] as String?,
        pUCRegisterNo = json['PUCRegisterNo'] as String?,
        pUCYearOfPassing = json['PUCYearOfPassing'] as String?,
        pUCMarksObtained = json['PUCMarksObtained'] as String?,
        pUCMaximumMarks = json['PUCMaximumMarks'] as String?,
        pUCPhysicsObtained = json['PUCPhysicsObtained'] as String?,
        pUCPhysicsTotal = json['PUCPhysicsTotal'] as String?,
        pUCChemistryObtained = json['PUCChemistryObtained'] as String?,
        pUCChemistryTotal = json['PUCChemistryTotal'] as String?,
        pUCMathObtained = json['PUCMathObtained'] as String?,
        pUCMathTotal = json['PUCMathTotal'] as String?,
        pCMObtained = json['PCMObtained'] as String?,
        pCMPCMTotal = json['PCMPCMTotal'] as String?,
        classesId = json['ClassesId'] as int?,
        sectionName = json['SectionName'] as String?,
        classBatchSectionId = json['ClassBatchSectionId'] as int?,
        className = json['ClassName'] as String?,
        departmentId = json['DepartmentId'] as int?;

  Map<String, dynamic> toJson() => {
    'UserId' : userId,
    'LoginId' : loginId,
    'SRN' : sRN,
    'Status' : status,
    'StateName' : stateName,
    'FirstName' : firstName,
    'MiddleName' : middleName,
    'LastName' : lastName,
    'NameAsInSSLC' : nameAsInSSLC,
    'Email' : email,
    'DateOfBirth' : dateOfBirth,
    'PlaceOfBirth' : placeOfBirth,
    'Gender' : gender,
    'Religion' : religion,
    'Minority' : minority,
    'Caste' : caste,
    'Language' : language,
    'OtherLanguage' : otherLanguage,
    'Citizenship' : citizenship,
    'FamilySize' : familySize,
    'BloodGroup' : bloodGroup,
    'Cocurricular' : cocurricular,
    'Nationality' : nationality,
    'OtherNationality' : otherNationality,
    'Mobile' : mobile,
    'Handicapped' : handicapped,
    'PhysicallyChallenged' : physicallyChallenged,
    'VisuallyChallenged' : visuallyChallenged,
    'FatherName' : fatherName,
    'FatherEmail' : fatherEmail,
    'FatherMobileNo' : fatherMobileNo,
    'FatherQualification' : fatherQualification,
    'FatherOccupation' : fatherOccupation,
    'FatherDesignation' : fatherDesignation,
    'FatherEmployerDetails' : fatherEmployerDetails,
    'FatherAnnualIncome' : fatherAnnualIncome,
    'FatherIsAlumni' : fatherIsAlumni,
    'MotherName' : motherName,
    'MotherEmail' : motherEmail,
    'MotherMobileNo' : motherMobileNo,
    'MotherQualification' : motherQualification,
    'MotherOccupation' : motherOccupation,
    'MotherDesignation' : motherDesignation,
    'MotherEmployerDetails' : motherEmployerDetails,
    'MotherAnnualIncome' : motherAnnualIncome,
    'MotherIsAlumni' : motherIsAlumni,
    'PermanentAddress' : permanentAddress,
    'PermanentState' : permanentState,
    'PermanentOtherState' : permanentOtherState,
    'PermanentCountry' : permanentCountry,
    'PermanentPinCode' : permanentPinCode,
    'PermanentMobilePhone' : permanentMobilePhone,
    'PermanentResidencePhone' : permanentResidencePhone,
    'LocalAddress' : localAddress,
    'LocalState' : localState,
    'LocalOtherState' : localOtherState,
    'LocalCountry' : localCountry,
    'LocalPinCode' : localPinCode,
    'LocalMobilePhone' : localMobilePhone,
    'LocalResidencePhone' : localResidencePhone,
    'SubmittedOn' : submittedOn,
    'ApprovedDate' : approvedDate,
    'ProgramId' : programId,
    'Program' : program,
    'ProgramAbbreviation' : programAbbreviation,
    'BranchId' : branchId,
    'BranchAbbreviation' : branchAbbreviation,
    'Branch' : branch,
    'QuotaId' : quotaId,
    'Quota' : quota,
    'EntranceExamId' : entranceExamId,
    'EntranceExam' : entranceExam,
    'ActualCategoryId' : actualCategoryId,
    'ActualCategory' : actualCategory,
    'AllottedCategory' : allottedCategory,
    'AdmissionCategory' : admissionCategory,
    'IsNormalEntry' : isNormalEntry,
    'OtherAllottedCategory' : otherAllottedCategory,
    'BatchId' : batchId,
    'DomicileId' : domicileId,
    'Domicile' : domicile,
    'QualifyingExamination' : qualifyingExamination,
    'AnyOneQualifyingSubjects' : anyOneQualifyingSubjects,
    'AllotmentNumber' : allotmentNumber,
    'AllotmentDate' : allotmentDate,
    'EntranceExamRollNo' : entranceExamRollNo,
    'QuotaApplicationId' : quotaApplicationId,
    'Rank' : rank,
    'EntranceExamScore' : entranceExamScore,
    'GateValidUpto' : gateValidUpto,
    'SSLCUniversityOrBoard' : sSLCUniversityOrBoard,
    'SSLCInstituteLeftOn' : sSLCInstituteLeftOn,
    'SSLCMediumOfInstruction' : sSLCMediumOfInstruction,
    'SSLCRegisterNo' : sSLCRegisterNo,
    'SSLCYearOfPassing' : sSLCYearOfPassing,
    'SSLCMarksObtained' : sSLCMarksObtained,
    'SSLCMaximumMarks' : sSLCMaximumMarks,
    'SSLCPercentage' : sSLCPercentage,
    'SSLCCountry' : sSLCCountry,
    'PUCUniversityOrBoard' : pUCUniversityOrBoard,
    'PUCInstituteLeftOn' : pUCInstituteLeftOn,
    'PUCMediumOfInstruction' : pUCMediumOfInstruction,
    'PUCRegisterNo' : pUCRegisterNo,
    'PUCYearOfPassing' : pUCYearOfPassing,
    'PUCMarksObtained' : pUCMarksObtained,
    'PUCMaximumMarks' : pUCMaximumMarks,
    'PUCPhysicsObtained' : pUCPhysicsObtained,
    'PUCPhysicsTotal' : pUCPhysicsTotal,
    'PUCChemistryObtained' : pUCChemistryObtained,
    'PUCChemistryTotal' : pUCChemistryTotal,
    'PUCMathObtained' : pUCMathObtained,
    'PUCMathTotal' : pUCMathTotal,
    'PCMObtained' : pCMObtained,
    'PCMPCMTotal' : pCMPCMTotal,
    'ClassesId' : classesId,
    'SectionName' : sectionName,
    'ClassBatchSectionId' : classBatchSectionId,
    'ClassName' : className,
    'DepartmentId' : departmentId
  };
}

class STUDENTSEMESTERS {
  final String? studentId;
  final int? studentRollNo;
  final bool? studentRollNoNull;
  final int? status;
  final bool? statusNull;
  final int? isPromoted;
  final bool? isPromotedNull;
  final int? classBatchSectionId;
  final int? batchClassId;
  final int? classId;
  final bool? classIdNull;
  final String? className;
  final int? batchClassOrder;

  STUDENTSEMESTERS({
    this.studentId,
    this.studentRollNo,
    this.studentRollNoNull,
    this.status,
    this.statusNull,
    this.isPromoted,
    this.isPromotedNull,
    this.classBatchSectionId,
    this.batchClassId,
    this.classId,
    this.classIdNull,
    this.className,
    this.batchClassOrder,
  });

  STUDENTSEMESTERS.fromJson(Map<String, dynamic> json)
      : studentId = json['studentId'] as String?,
        studentRollNo = json['studentRollNo'] as int?,
        studentRollNoNull = json['studentRollNoNull'] as bool?,
        status = json['status'] as int?,
        statusNull = json['statusNull'] as bool?,
        isPromoted = json['isPromoted'] as int?,
        isPromotedNull = json['isPromotedNull'] as bool?,
        classBatchSectionId = json['classBatchSectionId'] as int?,
        batchClassId = json['batchClassId'] as int?,
        classId = json['classId'] as int?,
        classIdNull = json['classIdNull'] as bool?,
        className = json['className'] as String?,
        batchClassOrder = json['batchClassOrder'] as int?;

  Map<String, dynamic> toJson() => {
    'studentId' : studentId,
    'studentRollNo' : studentRollNo,
    'studentRollNoNull' : studentRollNoNull,
    'status' : status,
    'statusNull' : statusNull,
    'isPromoted' : isPromoted,
    'isPromotedNull' : isPromotedNull,
    'classBatchSectionId' : classBatchSectionId,
    'batchClassId' : batchClassId,
    'classId' : classId,
    'classIdNull' : classIdNull,
    'className' : className,
    'batchClassOrder' : batchClassOrder
  };
}

class STUDENTCGPADETAILS {
  final String? uSN;
  final dynamic? credits;
  final dynamic? earnedCredits;
  final dynamic? cGPA;

  STUDENTCGPADETAILS({
    this.uSN,
    this.credits,
    this.earnedCredits,
    this.cGPA,
  });

  STUDENTCGPADETAILS.fromJson(Map<String, dynamic> json)
      : uSN = json['USN'] as String?,
        credits = json['Credits'] as dynamic?,
        earnedCredits = json['EarnedCredits'] as dynamic?,
        cGPA = json['CGPA'] as dynamic?;

  Map<String, dynamic> toJson() => {
    'USN' : uSN,
    'Credits' : credits,
    'EarnedCredits' : earnedCredits,
    'CGPA' : cGPA
  };
}