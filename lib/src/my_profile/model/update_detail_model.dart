class UpdateDetailModel {
  int? action;
  int? mode;
  String? email;
  String? phone;
  String? userId;
  double? randomNum;

  UpdateDetailModel({this.action, this.mode, this.userId, this.randomNum,this.phone,this.email});

  UpdateDetailModel.fromJson(Map<String, dynamic> json) {
    action = json['action'];
    mode = json['mode'];
    userId = json['userId'];
    randomNum = json['randomNum'];
    email = json['email'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['action'] = this.action;
    data['mode'] = this.mode;
    data['userId'] = this.userId;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['randomNum'] = this.randomNum;
    return data;
  }
}
