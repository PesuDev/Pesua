class SubjectModel {
  List<COURSECONTENT>? cOURSECONTENT;

  SubjectModel({this.cOURSECONTENT});

  SubjectModel.fromJson(Map<String, dynamic> json) {
    if (json['COURSE_CONTENT'] != null) {
      cOURSECONTENT = <COURSECONTENT>[];
      json['COURSE_CONTENT'].forEach((v) {
        cOURSECONTENT!.add(new COURSECONTENT.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cOURSECONTENT != null) {
      data['COURSE_CONTENT'] =
          this.cOURSECONTENT!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class COURSECONTENT {
  int? courseContentId;
  Null? subjectId;
  int? courseContentTypeId;
  String? courseContentType;
  String? heading;
  String? courseContent;
  int? style;
  int? courseContentTypeOrder;
  int? courseContentOrder;
  Null? data1;
  Null? data2;
  String? createdBy;
  int? createdDate;
  String? modifiedby;
  int? modifiedDate;
  int? status;
  var subjectCode;
  Null? subjectName;

  COURSECONTENT(
      {this.courseContentId,
      this.subjectId,
      this.courseContentTypeId,
      this.courseContentType,
      this.heading,
      this.courseContent,
      this.style,
      this.courseContentTypeOrder,
      this.courseContentOrder,
      this.data1,
      this.data2,
      this.createdBy,
      this.createdDate,
      this.modifiedby,
      this.modifiedDate,
      this.status,
      this.subjectCode,
      this.subjectName});

  COURSECONTENT.fromJson(Map<String, dynamic> json) {
    courseContentId = json['CourseContentId'];
    subjectId = json['SubjectId'];
    courseContentTypeId = json['CourseContentTypeId'];
    courseContentType = json['CourseContentType'];
    heading = json['Heading'];
    courseContent = json['CourseContent'];
    style = json['Style'];
    courseContentTypeOrder = json['CourseContentTypeOrder'];
    courseContentOrder = json['CourseContentOrder'];
    data1 = json['Data1'];
    data2 = json['Data2'];
    createdBy = json['CreatedBy'];
    createdDate = json['CreatedDate'];
    modifiedby = json['Modifiedby'];
    modifiedDate = json['ModifiedDate'];
    status = json['Status'];
    subjectCode = json['SubjectCode'];
    subjectName = json['SubjectName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CourseContentId'] = this.courseContentId;
    data['SubjectId'] = this.subjectId;
    data['CourseContentTypeId'] = this.courseContentTypeId;
    data['CourseContentType'] = this.courseContentType;
    data['Heading'] = this.heading;
    data['CourseContent'] = this.courseContent;
    data['Style'] = this.style;
    data['CourseContentTypeOrder'] = this.courseContentTypeOrder;
    data['CourseContentOrder'] = this.courseContentOrder;
    data['Data1'] = this.data1;
    data['Data2'] = this.data2;
    data['CreatedBy'] = this.createdBy;
    data['CreatedDate'] = this.createdDate;
    data['Modifiedby'] = this.modifiedby;
    data['ModifiedDate'] = this.modifiedDate;
    data['Status'] = this.status;
    data['SubjectCode'] = this.subjectCode;
    data['SubjectName'] = this.subjectName;
    return data;
  }
}
