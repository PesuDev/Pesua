class LoginRequestModel {
  String? jUsername;
  String? jPassword;
  String? jMobile;
  String? jMobileApp;
  String? jSocial;
  String? jAppId;
 String? action;
  String? mode;
  String? whichObjectId;
 // String? title;
  String? randomNum;

  LoginRequestModel(
      {this.jUsername,
        this.jPassword,
        this.jMobile,
        this.jMobileApp,
        this.jSocial,
        this.jAppId,
        this.action,
        this.mode,
        this.whichObjectId,
        this.randomNum,
       // this.title
      });

  LoginRequestModel.fromJson(Map<String, dynamic> json) {
    jUsername = json['j_username'];
    jPassword = json['j_password'];
    jMobile = json['j_mobile'];
    randomNum=json['randomNum'];
    jMobileApp = json['j_mobileApp'];
    jSocial = json['j_social'];
    jAppId = json['j_appId'];
   action = json['action'];
    mode = json['mode'];
    whichObjectId = json['whichObjectId'];
   // title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['j_username'] = this.jUsername;
    data['j_password'] = this.jPassword;
    data['j_mobile'] = this.jMobile;
    data['j_mobileApp'] = this.jMobileApp;
    data['j_social'] = this.jSocial;
    data['j_appId'] = this.jAppId;
    data['action'] = this.action;
    data['mode'] = this.mode;
    data['whichObjectId'] = this.whichObjectId;
   // data['title'] = this.title;
    data['randomNum']=this.randomNum;
    return data;
  }
}