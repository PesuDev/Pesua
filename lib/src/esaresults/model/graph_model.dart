class GraphModel {
  List<Data>? data;
  String? subjectName;
  String? studentName;

  GraphModel({this.data, this.subjectName, this.studentName});

  GraphModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    subjectName = json['SubjectName'];
    studentName = json['StudentName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['SubjectName'] = this.subjectName;
    data['StudentName'] = this.studentName;
    return data;
  }
}

class Data {
  int? x;
  int? y;
  String? usn;
  String? color;
  int? avg;
  int? tolal;
  int? total;
  String? grade;
  String? subjectName;

  Data(
      {this.x,
        this.y,
        this.usn,
        this.color,
        this.avg,
        this.tolal,
        this.total,
        this.grade,
        this.subjectName});

  Data.fromJson(Map<String, dynamic> json) {
    x = json['x'];
    y = json['y'];
    usn = json['usn'];
    color = json['color'];
    avg = json['avg'];
    tolal = json['tolal'];
    total = json['total'];
    grade = json['grade'];
    subjectName = json['subjectName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['x'] = this.x;
    data['y'] = this.y;
    data['usn'] = this.usn;
    data['color'] = this.color;
    data['avg'] = this.avg;
    data['tolal'] = this.tolal;
    data['total'] = this.total;
    data['grade'] = this.grade;
    data['subjectName'] = this.subjectName;
    return data;
  }
}