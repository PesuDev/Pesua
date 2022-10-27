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
  int? i88100Rgba512516;
  int? i7688Rgba1221822356;
  int? i6476Rgba25513606;
  int? i5060Rgba21046116;
  int? i4050Rgba10442356;
  int? i3040Rgba251342386;
  int? i030Rgba1811811816;

  GRAPHSTATUS(
      {this.i88100Rgba512516,
      this.i7688Rgba1221822356,
      this.i6476Rgba25513606,
      this.i5060Rgba21046116,
      this.i4050Rgba10442356,
      this.i3040Rgba251342386,
      this.i030Rgba1811811816});

  GRAPHSTATUS.fromJson(Map<String, dynamic> json) {
    i88100Rgba512516 = json['88-100%||rgba(5, 125, 1, .6)'];
    i7688Rgba1221822356 = json['76 -88%||rgba(122, 182, 235, 6)'];
    i6476Rgba25513606 = json['64 -76%||rgba(255, 136, 0, .6) '];
    i5060Rgba21046116 = json['50 -60%||rgba(210, 46, 11, .6) '];
    i4050Rgba10442356 = json['40 -50%|| rgba(104, 42, 35, .6)'];
    i3040Rgba251342386 = json['30 -40%|| rgba(251, 34, 238, .6)'];
    i030Rgba1811811816 = json['0  -30%|| rgba(181, 181, 181, .6)'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['88-100%||rgba(5, 125, 1, .6)'] = this.i88100Rgba512516;
    data['76 -88%||rgba(122, 182, 235, 6)'] = this.i7688Rgba1221822356;
    data['64 -76%||rgba(255, 136, 0, .6) '] = this.i6476Rgba25513606;
    data['50 -60%||rgba(210, 46, 11, .6) '] = this.i5060Rgba21046116;
    data['40 -50%|| rgba(104, 42, 35, .6)'] = this.i4050Rgba10442356;
    data['30 -40%|| rgba(251, 34, 238, .6)'] = this.i3040Rgba251342386;
    data['0  -30%|| rgba(181, 181, 181, .6)'] = this.i030Rgba1811811816;
    return data;
  }
}
