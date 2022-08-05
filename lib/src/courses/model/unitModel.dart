class UnitModel {
  int? courseNoteId;
  int? type;
  int? subjectId;
  int? courseContentId;
  String? topicTitle;
  String? title;

  UnitModel(
      {this.courseNoteId,
      this.type,
      this.subjectId,
      this.courseContentId,
      this.topicTitle,
      this.title});

  UnitModel.fromJson(Map<String, dynamic> json) {
    courseNoteId = json['CourseNoteId'];
    type = json['Type'];
    subjectId = json['SubjectId'];
    courseContentId = json['CourseContentId'];
    topicTitle = json['TopicTitle'];
    title = json['Title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CourseNoteId'] = this.courseNoteId;
    data['Type'] = this.type;
    data['SubjectId'] = this.subjectId;
    data['CourseContentId'] = this.courseContentId;
    data['TopicTitle'] = this.topicTitle;
    data['Title'] = this.title;
    return data;
  }
}
