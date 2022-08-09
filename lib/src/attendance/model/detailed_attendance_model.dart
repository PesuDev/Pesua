class DetailedAttendanceModel {
  String? dateOfAttendance;
  int? status;
  String? createdBy;
  int? lastMarkedDate;
  String? startTime;
  String? endTime;

  DetailedAttendanceModel(
      {this.dateOfAttendance,
        this.status,
        this.createdBy,
        this.lastMarkedDate,
        this.startTime,
        this.endTime});

  DetailedAttendanceModel.fromJson(Map<String, dynamic> json) {
    dateOfAttendance = json['DateOfAttendance'];
    status = json['Status'];
    createdBy = json['CreatedBy'];
    lastMarkedDate = json['LastMarkedDate'];
    startTime = json['StartTime'];
    endTime = json['EndTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['DateOfAttendance'] = this.dateOfAttendance;
    data['Status'] = this.status;
    data['CreatedBy'] = this.createdBy;
    data['LastMarkedDate'] = this.lastMarkedDate;
    data['StartTime'] = this.startTime;
    data['EndTime'] = this.endTime;
    return data;
  }
}
