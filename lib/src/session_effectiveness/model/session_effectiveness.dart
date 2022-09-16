class SessionEffectivenessModel {
  List<Stuentsubjectlist>? stuentsubjectlist;
  List<TimetableList>? timetableList;
  List<Subjectlist>? subjectlist;

  SessionEffectivenessModel(
      {this.stuentsubjectlist, this.timetableList, this.subjectlist});

  SessionEffectivenessModel.fromJson(Map<String, dynamic> json) {
    if (json['stuentsubjectlist'] != null) {
      stuentsubjectlist = <Stuentsubjectlist>[];
      json['stuentsubjectlist'].forEach((v) {
        stuentsubjectlist!.add(new Stuentsubjectlist.fromJson(v));
      });
    }
    if (json['timetableList'] != null) {
      timetableList = <TimetableList>[];
      json['timetableList'].forEach((v) {
        timetableList!.add(new TimetableList.fromJson(v));
      });
    }
    if (json['subjectlist'] != null) {
      subjectlist = <Subjectlist>[];
      json['subjectlist'].forEach((v) {
        subjectlist!.add(new Subjectlist.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.stuentsubjectlist != null) {
      data['stuentsubjectlist'] =
          this.stuentsubjectlist!.map((v) => v.toJson()).toList();
    }
    if (this.timetableList != null) {
      data['timetableList'] =
          this.timetableList!.map((v) => v.toJson()).toList();
    }
    if (this.subjectlist != null) {
      data['subjectlist'] = this.subjectlist!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Stuentsubjectlist {
  int? subjectId;
  String? subjectCode;
  String? subjectName;
  String? currentDate;
  int? status;
  String? subjectStatusText;
  int? studentSubjectId;
  String? studentId;
  int? departmentId;
  int? batchClassId;
  int? batchId;
  int? classId;
  int? cycle;
  int? programId;
  int? classBatchSectionId;

  Stuentsubjectlist(
      {this.subjectId,
        this.subjectCode,
        this.subjectName,
        this.currentDate,
        this.status,
        this.subjectStatusText,
        this.studentSubjectId,
        this.studentId,
        this.departmentId,
        this.batchClassId,
        this.batchId,
        this.classId,
        this.cycle,
        this.programId,
        this.classBatchSectionId});

  Stuentsubjectlist.fromJson(Map<String, dynamic> json) {
    subjectId = json['SubjectId'];
    subjectCode = json['SubjectCode'];
    subjectName = json['SubjectName'];
    currentDate = json['CurrentDate'];
    status = json['Status'];
    subjectStatusText = json['SubjectStatusText'];
    studentSubjectId = json['StudentSubjectId'];
    studentId = json['StudentId'];
    departmentId = json['DepartmentId'];
    batchClassId = json['BatchClassId'];
    batchId = json['BatchId'];
    classId = json['ClassId'];
    cycle = json['Cycle'];
    programId = json['ProgramId'];
    classBatchSectionId = json['ClassBatchSectionId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SubjectId'] = this.subjectId;
    data['SubjectCode'] = this.subjectCode;
    data['SubjectName'] = this.subjectName;
    data['CurrentDate'] = this.currentDate;
    data['Status'] = this.status;
    data['SubjectStatusText'] = this.subjectStatusText;
    data['StudentSubjectId'] = this.studentSubjectId;
    data['StudentId'] = this.studentId;
    data['DepartmentId'] = this.departmentId;
    data['BatchClassId'] = this.batchClassId;
    data['BatchId'] = this.batchId;
    data['ClassId'] = this.classId;
    data['Cycle'] = this.cycle;
    data['ProgramId'] = this.programId;
    data['ClassBatchSectionId'] = this.classBatchSectionId;
    return data;
  }
}

class TimetableList {
  int? subjectId;
  int? sub;
  String? timeTableId;
  int? day;
  String? startTiming;
  String? timeTableTemplateDetailsId;
  int? classBatchSectionId;
  int? timeClasbySec;
  String? subjectCode;
  String? subjectName;
  String? currentDate;
  int? status;
  String? studentId;
  int? subjectBatchDetailId;

  TimetableList(
      {this.subjectId,
        this.sub,
        this.timeTableId,
        this.day,
        this.startTiming,
        this.timeTableTemplateDetailsId,
        this.classBatchSectionId,
        this.timeClasbySec,
        this.subjectCode,
        this.subjectName,
        this.currentDate,
        this.status,
        this.studentId,
        this.subjectBatchDetailId});

  TimetableList.fromJson(Map<String, dynamic> json) {
    subjectId = json['SubjectId'];
    sub = json['Sub'];
    timeTableId = json['TimeTableId'];
    day = json['day'];
    startTiming = json['startTiming'];
    timeTableTemplateDetailsId = json['TimeTableTemplateDetailsId'];
    classBatchSectionId = json['ClassBatchSectionId'];
    timeClasbySec = json['TimeClasbySec'];
    subjectCode = json['SubjectCode'];
    subjectName = json['SubjectName'];
    currentDate = json['CurrentDate'];
    status = json['Status'];
    studentId = json['StudentId'];
    subjectBatchDetailId = json['SubjectBatchDetailId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SubjectId'] = this.subjectId;
    data['Sub'] = this.sub;
    data['TimeTableId'] = this.timeTableId;
    data['day'] = this.day;
    data['startTiming'] = this.startTiming;
    data['TimeTableTemplateDetailsId'] = this.timeTableTemplateDetailsId;
    data['ClassBatchSectionId'] = this.classBatchSectionId;
    data['TimeClasbySec'] = this.timeClasbySec;
    data['SubjectCode'] = this.subjectCode;
    data['SubjectName'] = this.subjectName;
    data['CurrentDate'] = this.currentDate;
    data['Status'] = this.status;
    data['StudentId'] = this.studentId;
    data['SubjectBatchDetailId'] = this.subjectBatchDetailId;
    return data;
  }
}

class Subjectlist {
  int? subjectId;
  Null? timeTableTemplateDetailsId;
  String? subjectCode;
  String? subjectName;
  Null? feedbackSubmitedDate;
  Null? feddbackStatus;
  String? currentDate;
  int? status;
  String? subjectStatusText;
  int? studentSubjectId;
  String? studentId;
  int? departmentId;
  int? batchClassId;
  int? batchId;
  int? classId;
  int? cycle;
  int? programId;
  int? classBatchSectionId;

  Subjectlist(
      {this.subjectId,
        this.timeTableTemplateDetailsId,
        this.subjectCode,
        this.subjectName,
        this.feedbackSubmitedDate,
        this.feddbackStatus,
        this.currentDate,
        this.status,
        this.subjectStatusText,
        this.studentSubjectId,
        this.studentId,
        this.departmentId,
        this.batchClassId,
        this.batchId,
        this.classId,
        this.cycle,
        this.programId,
        this.classBatchSectionId});

  Subjectlist.fromJson(Map<String, dynamic> json) {
    subjectId = json['SubjectId'];
    timeTableTemplateDetailsId = json['TimeTableTemplateDetailsId'];
    subjectCode = json['SubjectCode'];
    subjectName = json['SubjectName'];
    feedbackSubmitedDate = json['feedbackSubmitedDate'];
    feddbackStatus = json['FeddbackStatus'];
    currentDate = json['CurrentDate'];
    status = json['Status'];
    subjectStatusText = json['SubjectStatusText'];
    studentSubjectId = json['StudentSubjectId'];
    studentId = json['StudentId'];
    departmentId = json['DepartmentId'];
    batchClassId = json['BatchClassId'];
    batchId = json['BatchId'];
    classId = json['ClassId'];
    cycle = json['Cycle'];
    programId = json['ProgramId'];
    classBatchSectionId = json['ClassBatchSectionId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SubjectId'] = this.subjectId;
    data['TimeTableTemplateDetailsId'] = this.timeTableTemplateDetailsId;
    data['SubjectCode'] = this.subjectCode;
    data['SubjectName'] = this.subjectName;
    data['feedbackSubmitedDate'] = this.feedbackSubmitedDate;
    data['FeddbackStatus'] = this.feddbackStatus;
    data['CurrentDate'] = this.currentDate;
    data['Status'] = this.status;
    data['SubjectStatusText'] = this.subjectStatusText;
    data['StudentSubjectId'] = this.studentSubjectId;
    data['StudentId'] = this.studentId;
    data['DepartmentId'] = this.departmentId;
    data['BatchClassId'] = this.batchClassId;
    data['BatchId'] = this.batchId;
    data['ClassId'] = this.classId;
    data['Cycle'] = this.cycle;
    data['ProgramId'] = this.programId;
    data['ClassBatchSectionId'] = this.classBatchSectionId;
    return data;
  }
}