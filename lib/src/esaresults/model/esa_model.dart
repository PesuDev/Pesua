class ESAModel1 {
  List<Results>? results;
  String? status;
  String? usn;

  ESAModel1({this.results, this.status, this.usn});

  ESAModel1.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
    status = json['status'];
    usn = json['usn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['usn'] = this.usn;
    return data;
  }
}

class Results {
  int? esaresultsid;
  String? srn;
  String? subjectCode;
  String? subjectName;
  int? subjectOrder;
  bool? subjectOrderNull;
  String? grade;
  String? semester;
  String? info;
  int? status;
  bool? statusNull;
  String? esaresultsdetailid;
  int? modifiedDate;
  String? modifiedBy;
  String? modifierName;

  Results(
      {this.esaresultsid,
        this.srn,
        this.subjectCode,
        this.subjectName,
        this.subjectOrder,
        this.subjectOrderNull,
        this.grade,
        this.semester,
        this.info,
        this.status,
        this.statusNull,
        this.esaresultsdetailid,
        this.modifiedDate,
        this.modifiedBy,
        this.modifierName});

  Results.fromJson(Map<String, dynamic> json) {
    esaresultsid = json['esaresultsid'];
    srn = json['srn'];
    subjectCode = json['subjectCode'];
    subjectName = json['subjectName'];
    subjectOrder = json['subjectOrder'];
    subjectOrderNull = json['subjectOrderNull'];
    grade = json['grade'];
    semester = json['semester'];
    info = json['info'];
    status = json['status'];
    statusNull = json['statusNull'];
    esaresultsdetailid = json['esaresultsdetailid'];
    modifiedDate = json['modifiedDate'];
    modifiedBy = json['modifiedBy'];
    modifierName = json['modifierName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['esaresultsid'] = this.esaresultsid;
    data['srn'] = this.srn;
    data['subjectCode'] = this.subjectCode;
    data['subjectName'] = this.subjectName;
    data['subjectOrder'] = this.subjectOrder;
    data['subjectOrderNull'] = this.subjectOrderNull;
    data['grade'] = this.grade;
    data['semester'] = this.semester;
    data['info'] = this.info;
    data['status'] = this.status;
    data['statusNull'] = this.statusNull;
    data['esaresultsdetailid'] = this.esaresultsdetailid;
    data['modifiedDate'] = this.modifiedDate;
    data['modifiedBy'] = this.modifiedBy;
    data['modifierName'] = this.modifierName;
    return data;
  }
}


// >>>>>>>>>>>>>>>>>>>>>>

class ESAModel2 {
  List<StudentCGPAWISE>? studentCGPAWISE;
  List<StudentSemesterWise>? studentSemesterWise;

  ESAModel2({this.studentCGPAWISE, this.studentSemesterWise});

  ESAModel2.fromJson(Map<String, dynamic> json) {
    if (json['StudentCGPAWISE'] != null) {
      studentCGPAWISE = <StudentCGPAWISE>[];
      json['StudentCGPAWISE'].forEach((v) {
        studentCGPAWISE!.add(new StudentCGPAWISE.fromJson(v));
      });
    }
    if (json['StudentSemesterWise'] != null) {
      studentSemesterWise = <StudentSemesterWise>[];
      json['StudentSemesterWise'].forEach((v) {
        studentSemesterWise!.add(new StudentSemesterWise.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.studentCGPAWISE != null) {
      data['StudentCGPAWISE'] =
          this.studentCGPAWISE!.map((v) => v.toJson()).toList();
    }
    if (this.studentSemesterWise != null) {
      data['StudentSemesterWise'] =
          this.studentSemesterWise!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StudentCGPAWISE {
  String? uSN;
  dynamic? credits;
  dynamic? earnedCredits;
  dynamic? cGPA;

  StudentCGPAWISE({this.uSN, this.credits, this.earnedCredits, this.cGPA});

  StudentCGPAWISE.fromJson(Map<String, dynamic> json) {
    uSN = json['USN'];
    credits = json['Credits'];
    earnedCredits = json['EarnedCredits'];
    cGPA = json['CGPA'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['USN'] = this.uSN;
    data['Credits'] = this.credits;
    data['EarnedCredits'] = this.earnedCredits;
    data['CGPA'] = this.cGPA;
    return data;
  }
}

class StudentSemesterWise {
  int? batchClassId;
  int? programId;
  int? classessId;
  String? className;
  String? userId;
  String? uSN;

  StudentSemesterWise(
      {this.batchClassId,
        this.programId,
        this.classessId,
        this.className,
        this.userId,
        this.uSN});

  StudentSemesterWise.fromJson(Map<String, dynamic> json) {
    batchClassId = json['BatchClassId'];
    programId = json['ProgramId'];
    classessId = json['ClassessId'];
    className = json['ClassName'];
    userId = json['UserId'];
    uSN = json['USN'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['BatchClassId'] = this.batchClassId;
    data['ProgramId'] = this.programId;
    data['ClassessId'] = this.classessId;
    data['ClassName'] = this.className;
    data['UserId'] = this.userId;
    data['USN'] = this.uSN;
    return data;
  }
}


// ?????????????????????



class ESAModel4 {
  final List<RESULTS>? rESULTS;
  final List<CGPASEMESTERWISE>? cGPASEMESTERWISE;

  ESAModel4({
    this.rESULTS,
    this.cGPASEMESTERWISE,
  });

  ESAModel4.fromJson(Map<String, dynamic> json)
      : rESULTS = (json['RESULTS'] as List?)?.map((dynamic e) => RESULTS.fromJson(e as Map<String,dynamic>)).toList(),
        cGPASEMESTERWISE = (json['CGPA_SEMESTERWISE'] as List?)?.map((dynamic e) => CGPASEMESTERWISE.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'RESULTS' : rESULTS?.map((e) => e.toJson()).toList(),
    'CGPA_SEMESTERWISE' : cGPASEMESTERWISE?.map((e) => e.toJson()).toList()
  };
}

class RESULTS {
  final String? subjectCode;
  final int? semester;
  final String? grade;
  final String? subjectName;
  final dynamic? earnedCredit;
  final dynamic? credits;
  final int? esaId;
  final String? description;
  final int? subjectId;
  final List<dynamic>? sUMMARY;

  RESULTS({
    this.subjectCode,
    this.semester,
    this.grade,
    this.subjectName,
    this.earnedCredit,
    this.credits,
    this.esaId,
    this.description,
    this.subjectId,
    this.sUMMARY,
  });

  RESULTS.fromJson(Map<String, dynamic> json)
      : subjectCode = json['subjectCode'] as String?,
        semester = json['Semester'] as int?,
        grade = json['grade'] as String?,
        subjectName = json['SubjectName'] as String?,
        earnedCredit = json['EarnedCredit'] as dynamic?,
        credits = json['Credits'] as dynamic?,
        esaId = json['EsaId'] as int?,
        description = json['Description'] as String?,
        subjectId = json['SubjectId'] as int?,
        sUMMARY = json['SUMMARY'] as List?;

  Map<String, dynamic> toJson() => {
    'subjectCode' : subjectCode,
    'Semester' : semester,
    'grade' : grade,
    'SubjectName' : subjectName,
    'EarnedCredit' : earnedCredit,
    'Credits' : credits,
    'EsaId' : esaId,
    'Description' : description,
    'SubjectId' : subjectId,
    'SUMMARY' : sUMMARY
  };
}

class CGPASEMESTERWISE {
  final String? studentId;
  final int? esaId;
  final String? grade;
  final String? semester;
  final int? batchClassId;
  final String? description;
  final dynamic? earnedCredits;
  final dynamic? credits;
  final String? sGPA;
  final String? cGPA;

  CGPASEMESTERWISE({
    this.studentId,
    this.esaId,
    this.grade,
    this.semester,
    this.batchClassId,
    this.description,
    this.earnedCredits,
    this.credits,
    this.sGPA,
    this.cGPA,
  });

  CGPASEMESTERWISE.fromJson(Map<String, dynamic> json)
      : studentId = json['StudentId'] as String?,
        esaId = json['EsaId'] as int?,
        grade = json['Grade'] as String?,
        semester = json['Semester'] as String?,
        batchClassId = json['BatchClassId'] as int?,
        description = json['Description'] as String?,
        earnedCredits = json['EarnedCredits'] as dynamic?,
        credits = json['Credits'] as dynamic?,
        sGPA = json['SGPA'] as String?,
        cGPA = json['CGPA'] as String?;

  Map<String, dynamic> toJson() => {
    'StudentId' : studentId,
    'EsaId' : esaId,
    'Grade' : grade,
    'Semester' : semester,
    'BatchClassId' : batchClassId,
    'Description' : description,
    'EarnedCredits' : earnedCredits,
    'Credits' : credits,
    'SGPA' : sGPA,
    'CGPA' : cGPA
  };
}