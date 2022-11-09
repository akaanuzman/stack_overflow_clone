class PasswordModel {
  bool? success;
  String? message;
  int? token;
  String userTokenDTO = "";

  PasswordModel({
    this.success,
    this.message,
    this.token,
    this.userTokenDTO = "",
  });

  PasswordModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    data['token'] = token;
    return data;
  }
}
