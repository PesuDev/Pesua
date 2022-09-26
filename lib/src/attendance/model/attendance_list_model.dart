class AttendanceListModel {
  List<ATTENDANCELIST>? aTTENDANCELIST;
  bool? iSWITHDRAWLLINESOPENED;
  bool? iSACTIVEBATCHCLASS;
  List<STUDENTSUBJECTS>? sTUDENTSUBJECTS;
  bool? iSELECTIVELINESOPENED;
  bool? iSFACULTYSUBJECTFEEDBACKLINESOPENED;

  AttendanceListModel(
      {this.aTTENDANCELIST,
        this.iSWITHDRAWLLINESOPENED,
        this.iSACTIVEBATCHCLASS,
        this.sTUDENTSUBJECTS,
        this.iSELECTIVELINESOPENED,
        this.iSFACULTYSUBJECTFEEDBACKLINESOPENED});

  AttendanceListModel.fromJson(Map<String, dynamic> json) {
    if (json['ATTENDANCE_LIST'] != null) {
      aTTENDANCELIST = <ATTENDANCELIST>[];
      json['ATTENDANCE_LIST'].forEach((v) {
        aTTENDANCELIST!.add(new ATTENDANCELIST.fromJson(v));
      });
    }
    iSWITHDRAWLLINESOPENED = json['IS_WITHDRAWL_LINES_OPENED'];
    iSACTIVEBATCHCLASS = json['IS_ACTIVE_BATCHCLASS'];
    if (json['STUDENT_SUBJECTS'] != null) {
      sTUDENTSUBJECTS = <STUDENTSUBJECTS>[];
      json['STUDENT_SUBJECTS'].forEach((v) {
        sTUDENTSUBJECTS!.add(new STUDENTSUBJECTS.fromJson(v));
      });
    }
    iSELECTIVELINESOPENED = json['IS_ELECTIVE_LINES_OPENED'];
    iSFACULTYSUBJECTFEEDBACKLINESOPENED =
    json['IS_FACULTY_SUBJECT_FEEDBACK_LINES_OPENED'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.aTTENDANCELIST != null) {
      data['ATTENDANCE_LIST'] =
          this.aTTENDANCELIST!.map((v) => v.toJson()).toList();
    }
    data['IS_WITHDRAWL_LINES_OPENED'] = this.iSWITHDRAWLLINESOPENED;
    data['IS_ACTIVE_BATCHCLASS'] = this.iSACTIVEBATCHCLASS;
    if (this.sTUDENTSUBJECTS != null) {
      data['STUDENT_SUBJECTS'] =
          this.sTUDENTSUBJECTS!.map((v) => v.toJson()).toList();
    }
    data['IS_ELECTIVE_LINES_OPENED'] = this.iSELECTIVELINESOPENED;
    data['IS_FACULTY_SUBJECT_FEEDBACK_LINES_OPENED'] =
        this.iSFACULTYSUBJECTFEEDBACKLINESOPENED;
    return data;
  }
}

class ATTENDANCELIST {
  int? subjectId;
  String? subjectName;
  String? subjectCode;
  int? idType;
 double? attendedClasses;
int? totalClasses;
  double? attendancePercenrage;

  ATTENDANCELIST(
      {this.subjectId,
        this.subjectName,
        this.subjectCode,
        this.idType,
        this.attendedClasses,
        this.totalClasses,
        this.attendancePercenrage});

  ATTENDANCELIST.fromJson(Map<String, dynamic> json) {
    subjectId = json['SubjectId'];
    subjectName = json['SubjectName'];
    subjectCode = json['SubjectCode'];
    idType = json['IdType'];
    attendedClasses = json['AttendedClasses'];
    totalClasses = json['TotalClasses'];
    attendancePercenrage = json['AttendancePercenrage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SubjectId'] = this.subjectId;
    data['SubjectName'] = this.subjectName;
    data['SubjectCode'] = this.subjectCode;
    data['IdType'] = this.idType;
    data['AttendedClasses'] = this.attendedClasses;
    data['TotalClasses'] = this.totalClasses;
    data['AttendancePercenrage'] = this.attendancePercenrage;
    return data;
  }
}

class STUDENTSUBJECTS {
  int? subjectId;
  String? subjectCode;
  String? subjectName;
  double? credits;
  int? status;
  String? subjectStatusText;
  int? studentSubjectId;
  String? studentId;
  int? subjectTypeId;
  String? name;
  String? description;
  String? feedBackUserId;
  String? response;
  int? departmentId;
  int? batchClassId;
  int? classId;
  int? cycle;
  int? programId;
  Null? image;
  int? classBatchSectionId;

  STUDENTSUBJECTS(
      {this.subjectId,
        this.subjectCode,
        this.subjectName,
        this.credits,
        this.status,
        this.subjectStatusText,
        this.studentSubjectId,
        this.studentId,
        this.subjectTypeId,
        this.name,
        this.description,
        this.feedBackUserId,
        this.response,
        this.departmentId,
        this.batchClassId,
        this.classId,
        this.cycle,
        this.programId,
        this.image,
        this.classBatchSectionId});

  STUDENTSUBJECTS.fromJson(Map<String, dynamic> json) {
    subjectId = json['SubjectId'];
    subjectCode = json['SubjectCode'];
    subjectName = json['SubjectName'];
    credits = json['Credits'];
    status = json['Status'];
    subjectStatusText = json['SubjectStatusText'];
    studentSubjectId = json['StudentSubjectId'];
    studentId = json['StudentId'];
    subjectTypeId = json['SubjectTypeId'];
    name = json['Name'];
    description = json['Description'];
    feedBackUserId = json['FeedBackUserId'];
    response = json['Response'];
    departmentId = json['DepartmentId'];
    batchClassId = json['BatchClassId'];
    classId = json['ClassId'];
    cycle = json['Cycle'];
    programId = json['ProgramId'];
    image = json['Image'];
    classBatchSectionId = json['ClassBatchSectionId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SubjectId'] = this.subjectId;
    data['SubjectCode'] = this.subjectCode;
    data['SubjectName'] = this.subjectName;
    data['Credits'] = this.credits;
    data['Status'] = this.status;
    data['SubjectStatusText'] = this.subjectStatusText;
    data['StudentSubjectId'] = this.studentSubjectId;
    data['StudentId'] = this.studentId;
    data['SubjectTypeId'] = this.subjectTypeId;
    data['Name'] = this.name;
    data['Description'] = this.description;
    data['FeedBackUserId'] = this.feedBackUserId;
    data['Response'] = this.response;
    data['DepartmentId'] = this.departmentId;
    data['BatchClassId'] = this.batchClassId;
    data['ClassId'] = this.classId;
    data['Cycle'] = this.cycle;
    data['ProgramId'] = this.programId;
    data['Image'] = this.image;
    data['ClassBatchSectionId'] = this.classBatchSectionId;
    return data;
  }
}
