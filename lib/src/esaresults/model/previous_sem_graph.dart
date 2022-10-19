// ignore: camel_case_types
class esaGraphModel {
  List<StudentSemester>? studentSemester;
  bool? isprovisional;

  esaGraphModel({this.studentSemester, this.isprovisional});

  esaGraphModel.fromJson(Map<String, dynamic> json) {
    if (json['StudentSemester'] != null) {
      studentSemester = <StudentSemester>[];
      json['StudentSemester'].forEach((v) {
        studentSemester!.add(new StudentSemester.fromJson(v));
      });
    }
    isprovisional = json['isprovisional'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.studentSemester != null) {
      data['StudentSemester'] =
          this.studentSemester!.map((v) => v.toJson()).toList();
    }
    data['isprovisional'] = this.isprovisional;
    return data;
  }
}
class StudentSemester {
  String? studentId;
  int? batchClassId;
  int? programId;
  String? description;
  int? classessId;
  String? className;
  String? sGPA;
  String? cGPA;
  int? classStatus;
  int? batchClassOrder;
  String? semesterStatus;

  StudentSemester(
      {this.studentId,
        this.batchClassId,
        this.programId,
        this.description,
        this.classessId,
        this.className,
        this.sGPA,
        this.cGPA,
        this.classStatus,
        this.batchClassOrder,
        this.semesterStatus});

  StudentSemester.fromJson(Map<String, dynamic> json) {
    studentId = json['StudentId'];
    batchClassId = json['BatchClassId'];
    programId = json['ProgramId'];
    description = json['Description'];
    classessId = json['ClassessId'];
    className = json['ClassName'];
    sGPA = json['SGPA'];
    cGPA = json['CGPA'];
    classStatus = json['ClassStatus'];
    batchClassOrder = json['BatchClassOrder'];
    semesterStatus = json['SemesterStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['StudentId'] = this.studentId;
    data['BatchClassId'] = this.batchClassId;
    data['ProgramId'] = this.programId;
    data['Description'] = this.description;
    data['ClassessId'] = this.classessId;
    data['ClassName'] = this.className;
    data['SGPA'] = this.sGPA;
    data['CGPA'] = this.cGPA;
    data['ClassStatus'] = this.classStatus;
    data['BatchClassOrder'] = this.batchClassOrder;
    data['SemesterStatus'] = this.semesterStatus;
    return data;
  }
}


