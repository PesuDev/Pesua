class ForgetPasswordModel {
  int? action;
  int? mode;
  String? loginid;
  int? appid;
  double? randomNum;

  ForgetPasswordModel({this.action, this.mode, this.loginid, this.randomNum,this.appid});

  ForgetPasswordModel.fromJson(Map<String, dynamic> json) {
    action = json['action'];
    mode = json['mode'];
    loginid = json['loginid'];
    randomNum = json['randomNum'];
    appid = json['appid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['action'] = this.action;
    data['mode'] = this.mode;
    data['loginid'] = this.loginid;
    data['appid'] = this.appid;
    data['randomNum'] = this.randomNum;
    return data;
  }
}
