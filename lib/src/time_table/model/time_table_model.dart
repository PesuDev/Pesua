class TimeTableModel {
  String? timeTableId;
  int? classBatchSectionId;
  bool? classBatchSectionIdNull;
  String? userId;
  int? subjectId;
  bool? subjectIdNull;
  int? labBatchDetailId;
  bool? labBatchDetailIdNull;
  int? roomId;
  bool? roomIdNull;
  String? timeTableTemplateDetailsId;
  int? day;
  bool? dayNull;
  int? status;
  bool? statusNull;
  int? rowPositionAtTimeSlot;
  bool? rowPositionAtTimeSlotNull;
  String? facultyName;
  String? facultyNameAbbreviation;
  String? subjectName;
  String? subjectCode;
  String? roomName;
  String? batchName;
  int? timeSlotOrder;
  bool? timeSlotOrderNull;
  String? startTime;
  String? endTime;
  int? isHistory;
  bool? isHistoryNull;
  String? finalizedDate;
  String? templateId;
  String? templateName;
  String? timeTableTemplateDescription;
  int? noOfDays;
  bool? noOfDaysNull;
  int? instId;
  bool? instIdNull;
  int? type;
  bool? typeNull;
  int? timeTableTemplateStatus;
  bool? timeTableTemplateStatusNull;
  int? programId;
  bool? programIdNull;
  int? branchId;
  bool? branchIdNull;
  String? additionalInfo;

  TimeTableModel(
      {this.timeTableId,
        this.classBatchSectionId,
        this.classBatchSectionIdNull,
        this.userId,
        this.subjectId,
        this.subjectIdNull,
        this.labBatchDetailId,
        this.labBatchDetailIdNull,
        this.roomId,
        this.roomIdNull,
        this.timeTableTemplateDetailsId,
        this.day,
        this.dayNull,
        this.status,
        this.statusNull,
        this.rowPositionAtTimeSlot,
        this.rowPositionAtTimeSlotNull,
        this.facultyName,
        this.facultyNameAbbreviation,
        this.subjectName,
        this.subjectCode,
        this.roomName,
        this.batchName,
        this.timeSlotOrder,
        this.timeSlotOrderNull,
        this.startTime,
        this.endTime,
        this.isHistory,
        this.isHistoryNull,
        this.finalizedDate,
        this.templateId,
        this.templateName,
        this.timeTableTemplateDescription,
        this.noOfDays,
        this.noOfDaysNull,
        this.instId,
        this.instIdNull,
        this.type,
        this.typeNull,
        this.timeTableTemplateStatus,
        this.timeTableTemplateStatusNull,
        this.programId,
        this.programIdNull,
        this.branchId,
        this.branchIdNull,
        this.additionalInfo});

  TimeTableModel.fromJson(Map<String, dynamic> json) {
    timeTableId = json['timeTableId'];
    classBatchSectionId = json['classBatchSectionId'];
    classBatchSectionIdNull = json['classBatchSectionIdNull'];
    userId = json['userId'];
    subjectId = json['subjectId'];
    subjectIdNull = json['subjectIdNull'];
    labBatchDetailId = json['labBatchDetailId'];
    labBatchDetailIdNull = json['labBatchDetailIdNull'];
    roomId = json['roomId'];
    roomIdNull = json['roomIdNull'];
    timeTableTemplateDetailsId = json['timeTableTemplateDetailsId'];
    day = json['day'];
    dayNull = json['dayNull'];
    status = json['status'];
    statusNull = json['statusNull'];
    rowPositionAtTimeSlot = json['rowPositionAtTimeSlot'];
    rowPositionAtTimeSlotNull = json['rowPositionAtTimeSlotNull'];
    facultyName = json['facultyName'];
    facultyNameAbbreviation = json['facultyNameAbbreviation'];
    subjectName = json['subjectName'];
    subjectCode = json['subjectCode'];
    roomName = json['roomName'];
    batchName = json['batchName'];
    timeSlotOrder = json['timeSlotOrder'];
    timeSlotOrderNull = json['timeSlotOrderNull'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    isHistory = json['isHistory'];
    isHistoryNull = json['isHistoryNull'];
    finalizedDate = json['finalizedDate'];
    templateId = json['templateId'];
    templateName = json['templateName'];
    timeTableTemplateDescription = json['timeTableTemplateDescription'];
    noOfDays = json['noOfDays'];
    noOfDaysNull = json['noOfDaysNull'];
    instId = json['instId'];
    instIdNull = json['instIdNull'];
    type = json['type'];
    typeNull = json['typeNull'];
    timeTableTemplateStatus = json['timeTableTemplateStatus'];
    timeTableTemplateStatusNull = json['timeTableTemplateStatusNull'];
    programId = json['programId'];
    programIdNull = json['programIdNull'];
    branchId = json['branchId'];
    branchIdNull = json['branchIdNull'];
    additionalInfo = json['additionalInfo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['timeTableId'] = this.timeTableId;
    data['classBatchSectionId'] = this.classBatchSectionId;
    data['classBatchSectionIdNull'] = this.classBatchSectionIdNull;
    data['userId'] = this.userId;
    data['subjectId'] = this.subjectId;
    data['subjectIdNull'] = this.subjectIdNull;
    data['labBatchDetailId'] = this.labBatchDetailId;
    data['labBatchDetailIdNull'] = this.labBatchDetailIdNull;
    data['roomId'] = this.roomId;
    data['roomIdNull'] = this.roomIdNull;
    data['timeTableTemplateDetailsId'] = this.timeTableTemplateDetailsId;
    data['day'] = this.day;
    data['dayNull'] = this.dayNull;
    data['status'] = this.status;
    data['statusNull'] = this.statusNull;
    data['rowPositionAtTimeSlot'] = this.rowPositionAtTimeSlot;
    data['rowPositionAtTimeSlotNull'] = this.rowPositionAtTimeSlotNull;
    data['facultyName'] = this.facultyName;
    data['facultyNameAbbreviation'] = this.facultyNameAbbreviation;
    data['subjectName'] = this.subjectName;
    data['subjectCode'] = this.subjectCode;
    data['roomName'] = this.roomName;
    data['batchName'] = this.batchName;
    data['timeSlotOrder'] = this.timeSlotOrder;
    data['timeSlotOrderNull'] = this.timeSlotOrderNull;
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    data['isHistory'] = this.isHistory;
    data['isHistoryNull'] = this.isHistoryNull;
    data['finalizedDate'] = this.finalizedDate;
    data['templateId'] = this.templateId;
    data['templateName'] = this.templateName;
    data['timeTableTemplateDescription'] = this.timeTableTemplateDescription;
    data['noOfDays'] = this.noOfDays;
    data['noOfDaysNull'] = this.noOfDaysNull;
    data['instId'] = this.instId;
    data['instIdNull'] = this.instIdNull;
    data['type'] = this.type;
    data['typeNull'] = this.typeNull;
    data['timeTableTemplateStatus'] = this.timeTableTemplateStatus;
    data['timeTableTemplateStatusNull'] = this.timeTableTemplateStatusNull;
    data['programId'] = this.programId;
    data['programIdNull'] = this.programIdNull;
    data['branchId'] = this.branchId;
    data['branchIdNull'] = this.branchIdNull;
    data['additionalInfo'] = this.additionalInfo;
    return data;
  }
}