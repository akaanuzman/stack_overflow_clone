import 'package:json_annotation/json_annotation.dart';

part 'password_model.g.dart';

@JsonSerializable()
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

  factory PasswordModel.fromJson(Map<String, dynamic> json) =>
      _$PasswordModelFromJson(json);

  Map<String, dynamic> passwordModelToJson(PasswordModel model) =>
      _$PasswordModelToJson(model);
}
