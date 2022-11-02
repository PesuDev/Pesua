class DetailedArguments{

  String? subjectCode;
  String? subjectName;
  String? percentage;
  String? attendance;
  int? subjectId;
  String?   fetchId;
  String? classBatchSectionId;
  int? iSAMarksMasterId;
  int? batchClassId;

DetailedArguments({this.fetchId,this.batchClassId,this.iSAMarksMasterId,this.classBatchSectionId,this.subjectId,this.subjectCode,this.subjectName,this.attendance,this.percentage});
}
class CourseArgument{

  String? subjectCode;
  String? subjectName;
  int? ccId;
  CourseArgument({this.ccId,this.subjectName,this.subjectCode});

}