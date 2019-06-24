class MessageData {
  String message;
  int code;
  String statusCode;
  MessageData(this.statusCode,this.message,this.code);

  factory MessageData.fromJson(Map<String, dynamic> map){
    return MessageData(map['statusCode'],map['message'],map['code']);
  }
}

class StatusCode {
  String message;
  int code;
  StatusCode(this.message, this.code);
  static final StatusCode OK = StatusCode("成功", 0);
  static final StatusCode USER_NOT_EXIST = StatusCode("用户不存在", 1001);
  static final StatusCode USER_ALREADY_EXIST = StatusCode("用户已注册", 1002);
  static final StatusCode USER_PASSWORD_ERROR = StatusCode("密码错误", 1003);
}
