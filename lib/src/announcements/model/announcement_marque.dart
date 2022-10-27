class Announcement_marqueModel {
  int? announcementId;
  String? announcementName;
  int? announcementType;
  int? programId;
  int? announcementForId;
  String? announcementFor;
  String? description;
  int? startdate;
  int? endDate;
  int? statusId;
  String? status;
  int? instId;
  String? instituteName;
  int? deptId;
  String? deptName;
  String? userId;
  String? loginId;
  int? createddate;
  int? modifiedDate;
  int? announcementDocId;
  String? documentPath;
  int? isReusedIcon;
  int? batchClassId;
  int? announcementPriority;
  String? announcementPriorityName;
  String? createdDateFrSorting;
  int? deadlineDate;
  int? reminderDate;
  String? pictureIconPath;
  String? iconPath;
  int? isBannerImage;
  List<dynamic>? files;

  Announcement_marqueModel(
      {this.announcementId,
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
        this.iconPath,
        this.files});

  Announcement_marqueModel.fromJson(Map<String, dynamic> json) {
    announcementId = json['announcementId'];
    announcementName = json['announcementName'];
    announcementType = json['announcementType'];
    programId = json['programId'];
    announcementForId = json['announcementForId'];
    announcementFor = json['announcementFor'];
    description = json['description'];
    startdate = json['startdate'];
    endDate = json['endDate'];
    statusId = json['statusId'];
    status = json['status'];
    instId = json['instId'];
    instituteName = json['instituteName'];
    deptId = json['deptId'];
    deptName = json['deptName'];
    userId = json['userId'];
    loginId = json['loginId'];
    createddate = json['createddate'];
    modifiedDate = json['modifiedDate'];
    announcementDocId = json['announcementDocId'];
    documentPath = json['documentPath'];
    isReusedIcon = json['isReusedIcon'];
    batchClassId = json['batchClassId'];
    announcementPriority = json['announcementPriority'];
    announcementPriorityName = json['announcementPriorityName'];
    createdDateFrSorting = json['createdDateFrSorting'];
    deadlineDate = json['deadlineDate'];
    reminderDate = json['reminderDate'];
    pictureIconPath = json['pictureIconPath'];
    iconPath = json['iconPath'];
    isBannerImage = json['isBannerImage'];
    files = json['files'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['announcementId'] = this.announcementId;
    data['announcementName'] = this.announcementName;
    data['announcementType'] = this.announcementType;
    data['programId'] = this.programId;
    data['announcementForId'] = this.announcementForId;
    data['announcementFor'] = this.announcementFor;
    data['description'] = this.description;
    data['startdate'] = this.startdate;
    data['endDate'] = this.endDate;
    data['statusId'] = this.statusId;
    data['status'] = this.status;
    data['instId'] = this.instId;
    data['instituteName'] = this.instituteName;
    data['deptId'] = this.deptId;
    data['deptName'] = this.deptName;
    data['userId'] = this.userId;
    data['loginId'] = this.loginId;
    data['createddate'] = this.createddate;
    data['modifiedDate'] = this.modifiedDate;
    data['announcementDocId'] = this.announcementDocId;
    data['documentPath'] = this.documentPath;
    data['isReusedIcon'] = this.isReusedIcon;
    data['batchClassId'] = this.batchClassId;
    data['announcementPriority'] = this.announcementPriority;
    data['announcementPriorityName'] = this.announcementPriorityName;
    data['createdDateFrSorting'] = this.createdDateFrSorting;
    data['deadlineDate'] = this.deadlineDate;
    data['reminderDate'] = this.reminderDate;
    data['pictureIconPath'] = this.pictureIconPath;
    data['iconPath'] = this.iconPath;
    data['isBannerImage'] = this.isBannerImage;
    data['files'] = this.files;
    return data;
  }
}
