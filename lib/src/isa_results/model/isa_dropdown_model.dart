class Isa_downdown_model {
  String? userId;
  String? loginId;
  int? batchClassId;
  int? classBatchSectionId;
  int? cBSStatus;
  int? isPromoted;
  int? classessId;
  String? className;
  int? batchClassOrder;
  bool? current;

  Isa_downdown_model(
      {this.userId,
      this.loginId,
      this.batchClassId,
      this.classBatchSectionId,
      this.cBSStatus,
      this.isPromoted,
      this.classessId,
      this.className,
      this.batchClassOrder,
      this.current});

  Isa_downdown_model.fromJson(Map<String, dynamic> json) {
    userId = json['UserId'];
    loginId = json['LoginId'];
    batchClassId = json['BatchClassId'];
    classBatchSectionId = json['ClassBatchSectionId'];
    cBSStatus = json['CBSStatus'];
    isPromoted = json['IsPromoted'];
    classessId = json['ClassessId'];
    className = json['ClassName'];
    batchClassOrder = json['BatchClassOrder'];
    current = json['current'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['UserId'] = this.userId;
    data['LoginId'] = this.loginId;
    data['BatchClassId'] = this.batchClassId;
    data['ClassBatchSectionId'] = this.classBatchSectionId;
    data['CBSStatus'] = this.cBSStatus;
    data['IsPromoted'] = this.isPromoted;
    data['ClassessId'] = this.classessId;
    data['ClassName'] = this.className;
    data['BatchClassOrder'] = this.batchClassOrder;
    data['current'] = this.current;
    return data;
  }
}
