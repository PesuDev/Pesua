class FeedbackModel {
  int? action;
  int? mode;
  int? subjectId;
  int? status;
  int? BatchId;
  int? BatchClassId;
  int? ClassBatchSectionId;
  int? ClassId;
  int? DepartmentId;
  int? ProgramId;
  String?isLocallySavedData;
  String? subjectCode;
  String? userId;
  String? timeTableTemplateDetailsId;
  double? randomNum;

  FeedbackModel({this.action, this.mode, this.subjectId,
    this.randomNum,this.subjectCode,this.status,
    this.userId,this.BatchClassId,this.BatchId,this.ClassBatchSectionId,
    this.ClassId,this.DepartmentId,this.ProgramId,this.isLocallySavedData,
  this.timeTableTemplateDetailsId});

  FeedbackModel.fromJson(Map<String, dynamic> json) {
    action = json['action'];
    mode = json['mode'];
    subjectId = json['subjectId'];
    status = json['status'];
    subjectCode = json['subjectCode'];
    userId = json['userId'];
    BatchClassId = json['BatchClassId'];
    BatchId = json['BatchId'];
    ClassBatchSectionId = json['ClassBatchSectionId'];
    DepartmentId = json['DepartmentId'];
    ClassId = json['ClassId'];
    ProgramId = json['ProgramId'];
    isLocallySavedData = json['isLocallySavedData'];
    timeTableTemplateDetailsId = json['timeTableTemplateDetailsId'];
    randomNum = json['randomNum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['action'] = this.action;
    data['mode'] = this.mode;
    data['subjectId'] = this.subjectId;
    data['subjectCode'] = this.subjectCode;
    data['status'] = this.status;
    data['userId'] = this.userId;
    data['BatchClassId'] = this.BatchClassId;
    data['BatchId'] = this.BatchId;
    data['ClassBatchSectionId'] = this.ClassBatchSectionId;
    data['ClassId'] = this.ClassId;
    data['DepartmentId'] = this.DepartmentId;
    data['isLocallySavedData'] = this.isLocallySavedData;
    data['ProgramId'] = this.ProgramId;
    data['timeTableTemplateDetailsId'] = this.timeTableTemplateDetailsId;
    data['randomNum'] = this.randomNum;
    return data;
  }
}
