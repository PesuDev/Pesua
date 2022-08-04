class CourseDropDownModel {
  String? studentId;
  int? studentRollNo;
  bool? studentRollNoNull;
  int? status;
  bool? statusNull;
  int? isPromoted;
  bool? isPromotedNull;
  int? classBatchSectionId;
  int? batchClassId;
  int? classId;
  bool? classIdNull;
  String? className;
  int? batchClassOrder;

  CourseDropDownModel(
      {this.studentId,
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
      this.batchClassOrder});

  CourseDropDownModel.fromJson(Map<String, dynamic> json) {
    studentId = json['studentId'];
    studentRollNo = json['studentRollNo'];
    studentRollNoNull = json['studentRollNoNull'];
    status = json['status'];
    statusNull = json['statusNull'];
    isPromoted = json['isPromoted'];
    isPromotedNull = json['isPromotedNull'];
    classBatchSectionId = json['classBatchSectionId'];
    batchClassId = json['batchClassId'];
    classId = json['classId'];
    classIdNull = json['classIdNull'];
    className = json['className'];
    batchClassOrder = json['batchClassOrder'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['studentId'] = this.studentId;
    data['studentRollNo'] = this.studentRollNo;
    data['studentRollNoNull'] = this.studentRollNoNull;
    data['status'] = this.status;
    data['statusNull'] = this.statusNull;
    data['isPromoted'] = this.isPromoted;
    data['isPromotedNull'] = this.isPromotedNull;
    data['classBatchSectionId'] = this.classBatchSectionId;
    data['batchClassId'] = this.batchClassId;
    data['classId'] = this.classId;
    data['classIdNull'] = this.classIdNull;
    data['className'] = this.className;
    data['batchClassOrder'] = this.batchClassOrder;
    return data;
  }
}
