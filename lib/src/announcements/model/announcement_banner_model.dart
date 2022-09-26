class AnnouncementBannerModel {
  final int? announcementId;
  final String? announcementName;
  final int? announcementType;
  final int? programId;
  final int? announcementForId;
  final String? announcementFor;
  final String? description;
  final int? startdate;
  final int? endDate;
  final int? statusId;
  final String? status;
  final int? instId;
  final String? instituteName;
  final int? deptId;
  final dynamic deptName;
  final String? userId;
  final String? loginId;
  final int? createddate;
  final dynamic modifiedDate;
  final int? announcementDocId;
  final dynamic documentPath;
  final int? isReusedIcon;
  final dynamic batchClassId;
  final int? announcementPriority;
  final String? announcementPriorityName;
  final String? createdDateFrSorting;
  final int? deadlineDate;
  final int? reminderDate;
  final String? pictureIconPath;
  final int? isBannerImage;
  final List<dynamic>? files;

  AnnouncementBannerModel({
    this.announcementId,
    this.announcementName,
    this.announcementType,
    this.programId,
    this.announcementForId,
    this.announcementFor,
    this.description,
    this.startdate,
    this.endDate,
    this.statusId,
    this.status,
    this.instId,
    this.instituteName,
    this.deptId,
    this.deptName,
    this.userId,
    this.loginId,
    this.createddate,
    this.modifiedDate,
    this.announcementDocId,
    this.documentPath,
    this.isReusedIcon,
    this.batchClassId,
    this.announcementPriority,
    this.announcementPriorityName,
    this.createdDateFrSorting,
    this.deadlineDate,
    this.reminderDate,
    this.pictureIconPath,
    this.isBannerImage,
    this.files,
  });

  AnnouncementBannerModel.fromJson(Map<String, dynamic> json)
      : announcementId = json['announcementId'] as int?,
        announcementName = json['announcementName'] as String?,
        announcementType = json['announcementType'] as int?,
        programId = json['programId'] as int?,
        announcementForId = json['announcementForId'] as int?,
        announcementFor = json['announcementFor'] as String?,
        description = json['description'] as String?,
        startdate = json['startdate'] as int?,
        endDate = json['endDate'] as int?,
        statusId = json['statusId'] as int?,
        status = json['status'] as String?,
        instId = json['instId'] as int?,
        instituteName = json['instituteName'] as String?,
        deptId = json['deptId'] as int?,
        deptName = json['deptName'],
        userId = json['userId'] as String?,
        loginId = json['loginId'] as String?,
        createddate = json['createddate'] as int?,
        modifiedDate = json['modifiedDate'],
        announcementDocId = json['announcementDocId'] as int?,
        documentPath = json['documentPath'],
        isReusedIcon = json['isReusedIcon'] as int?,
        batchClassId = json['batchClassId'],
        announcementPriority = json['announcementPriority'] as int?,
        announcementPriorityName = json['announcementPriorityName'] as String?,
        createdDateFrSorting = json['createdDateFrSorting'] as String?,
        deadlineDate = json['deadlineDate'] as int?,
        reminderDate = json['reminderDate'] as int?,
        pictureIconPath = json['pictureIconPath'] as String?,
        isBannerImage = json['isBannerImage'] as int?,
        files = json['files'] as List?;

  Map<String, dynamic> toJson() => {
    'announcementId' : announcementId,
    'announcementName' : announcementName,
    'announcementType' : announcementType,
    'programId' : programId,
    'announcementForId' : announcementForId,
    'announcementFor' : announcementFor,
    'description' : description,
    'startdate' : startdate,
    'endDate' : endDate,
    'statusId' : statusId,
    'status' : status,
    'instId' : instId,
    'instituteName' : instituteName,
    'deptId' : deptId,
    'deptName' : deptName,
    'userId' : userId,
    'loginId' : loginId,
    'createddate' : createddate,
    'modifiedDate' : modifiedDate,
    'announcementDocId' : announcementDocId,
    'documentPath' : documentPath,
    'isReusedIcon' : isReusedIcon,
    'batchClassId' : batchClassId,
    'announcementPriority' : announcementPriority,
    'announcementPriorityName' : announcementPriorityName,
    'createdDateFrSorting' : createdDateFrSorting,
    'deadlineDate' : deadlineDate,
    'reminderDate' : reminderDate,
    'pictureIconPath' : pictureIconPath,
    'isBannerImage' : isBannerImage,
    'files' : files
  };
}