class SeatingInfoModel {
  String? studentId;
  int? status;
  String? subjectName;
  String? assessmentName;
  String? terminalName;
  int? assessmentId;
  int? testEndTime;
  int? testStartTime;
  String? roomName;
  String? subjectCode;

  SeatingInfoModel(
      {this.studentId,
        this.status,
        this.subjectName,
        this.assessmentName,
        this.terminalName,
        this.assessmentId,
        this.testEndTime,
        this.testStartTime,
        this.roomName,
        this.subjectCode});

  SeatingInfoModel.fromJson(Map<String, dynamic> json) {
    studentId = json['StudentId'];
    status = json['Status'];
    subjectName = json['SubjectName'];
    assessmentName = json['AssessmentName'];
    terminalName = json['TerminalName'];
    assessmentId = json['AssessmentId'];
    testEndTime = json['TestEndTime'];
    testStartTime = json['TestStartTime'];
    roomName = json['RoomName'];
    subjectCode = json['SubjectCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['StudentId'] = this.studentId;
    data['Status'] = this.status;
    data['SubjectName'] = this.subjectName;
    data['AssessmentName'] = this.assessmentName;
    data['TerminalName'] = this.terminalName;
    data['AssessmentId'] = this.assessmentId;
    data['TestEndTime'] = this.testEndTime;
    data['TestStartTime'] = this.testStartTime;
    data['RoomName'] = this.roomName;
    data['SubjectCode'] = this.subjectCode;
    return data;
  }
}


