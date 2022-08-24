class IsaResultModel {
  final String? studentId;
  final String? loginId;
  final String? nameAsInSSLC;
  final String? classBatchSectionId;
  final int? subjectId;
  final String? subjectCode;
  final String? subjectName;
  final double? credits;
  final String? marks;
  final int? iSAMarksMasterId;
  final String? iSAMaster;
  final double? cutoffMarks;
  final int? batchClassId;
  final String? maxISAMarks;

  IsaResultModel({
    this.studentId,
    this.loginId,
    this.nameAsInSSLC,
    this.classBatchSectionId,
    this.subjectId,
    this.subjectCode,
    this.subjectName,
    this.credits,
    this.marks,
    this.iSAMarksMasterId,
    this.iSAMaster,
    this.cutoffMarks,
    this.batchClassId,
    this.maxISAMarks,
  });

  IsaResultModel.fromJson(Map<String, dynamic> json)
      : studentId = json['StudentId'] as String?,
        loginId = json['LoginId'] as String?,
        nameAsInSSLC = json['NameAsInSSLC'] as String?,
        classBatchSectionId = json['classBatchSectionId'] as String?,
        subjectId = json['subjectId'] as int?,
        subjectCode = json['subjectCode'] as String?,
        subjectName = json['subjectName'] as String?,
        credits = json['Credits'] as double?,
        marks = json['marks'] as String?,
        iSAMarksMasterId = json['ISAMarksMasterId'] as int?,
        iSAMaster = json['ISAMaster'] as String?,
        cutoffMarks = json['CutoffMarks'] as double?,
        batchClassId = json['batchClassId'] as int?,
        maxISAMarks = json['maxISAMarks'] as String?;

  Map<String, dynamic> toJson() => {
        'StudentId': studentId,
        'LoginId': loginId,
        'NameAsInSSLC': nameAsInSSLC,
        'classBatchSectionId': classBatchSectionId,
        'subjectId': subjectId,
        'subjectCode': subjectCode,
        'subjectName': subjectName,
        'Credits': credits,
        'marks': marks,
        'ISAMarksMasterId': iSAMarksMasterId,
        'ISAMaster': iSAMaster,
        'CutoffMarks': cutoffMarks,
        'batchClassId': batchClassId,
        'maxISAMarks': maxISAMarks
      };
}
