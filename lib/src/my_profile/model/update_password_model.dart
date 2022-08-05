class UpdatePasswordModel{
int? action;
int? mode;
String? oldPass;
String? newPass;
String? newPass1;
int? userId;
String? loginId;
double? randomNum;

    UpdatePasswordModel(
      {
        this.action,
        this.mode,
        this.oldPass,
        this.newPass,
        this.newPass1,
        this.userId,
        this.loginId,
        this.randomNum});

    UpdatePasswordModel.fromJson(Map<String, dynamic> json) {
      action=json['action'];
      mode=json['mode'];
      oldPass=json['oldPass'];
      newPass=json['newPass'];
      newPass1=json['newPass1'];
      userId=json['userId'];
      loginId=json['LoginId'];
      randomNum=json['randomNum'];

    }
      Map<String, dynamic>toJson() {
      final Map<String, dynamic> data = new Map<String, dynamic>();
      data['action']=this.action;
      data['mode']=this.mode;
      data['oldPass']=this.oldPass;
      data['newPass']=this.newPass;
      data['newPass1']=this.newPass1;
      data['userId']=this.userId;
      data['loginId']=this.loginId;
      data['randomNum']=this.randomNum;
      return data;


    }
}