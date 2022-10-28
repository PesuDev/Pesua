class IsaGraphModel {
  List<Data>? data;
  List<GRAPHSTATUS>? gRAPHSTATUS;

  IsaGraphModel({this.data, this.gRAPHSTATUS});

  IsaGraphModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    if (json['GRAPH_STATUS'] != null) {
      gRAPHSTATUS = <GRAPHSTATUS>[];
      json['GRAPH_STATUS'].forEach((v) {
        gRAPHSTATUS!.add(new GRAPHSTATUS.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.gRAPHSTATUS != null) {
      data['GRAPH_STATUS'] = this.gRAPHSTATUS!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  double? x;
  int? y;
  String? usn;
  String? color;
  int? avg;
  double? tolal;
  double? total;
  Null? grade;
  Null? subjectName;

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

class GRAPHSTATUS {
  int? i88100;
  int? i7688;
  int? i6476;
  int? i5060;
  int? i4050;
  int? i3040;
  int? i030;

  GRAPHSTATUS(
      {this.i88100,
        this.i7688,
        this.i6476,
        this.i5060,
        this.i4050,
        this.i3040,
        this.i030});

  GRAPHSTATUS.fromJson(Map<String, dynamic> json) {
    i88100 = json['88-100%'];
    i7688 = json['76 -88%'];
    i6476 = json['64 -76%'];
    i5060 = json['50 -60%'];
    i4050 = json['40 -50%'];
    i3040 = json['30 -40%'];
    i030 = json['0  -30%'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['88-100%'] = this.i88100;
    data['76 -88%'] = this.i7688;
    data['64 -76%'] = this.i6476;
    data['50 -60%'] = this.i5060;
    data['40 -50%'] = this.i4050;
    data['30 -40%'] = this.i3040;
    data['0  -30%'] = this.i030;
    return data;
  }
}
