import 'package:json_annotation/json_annotation.dart';

part 'answer_model.g.dart';

@JsonSerializable()
class AnswerModel {
  @JsonKey(name: "_id")
  String? sId;

  String? content;
  String? createdAt;
  List<Fav>? fav;
  Fav? user;
  Question? question;
  bool? isActive;
  @JsonKey(name: "__v")
  int? iV;

  AnswerModel(
      {this.sId,
      this.content,
      this.createdAt,
      this.fav,
      this.user,
      this.question,
      this.isActive,
      this.iV});

  factory AnswerModel.fromJson(Map<String, dynamic> json) =>
      _$AnswerModelFromJson(json);

  Map<String, dynamic> answerModelToJson(AnswerModel model) =>
      _$AnswerModelToJson(model);
}

@JsonSerializable()
class Fav {
  @JsonKey(name: "_id")
  String? sId;
  String? name;
  String? lastname;
  String? email;
  String? role;
  String? img;
  bool? isBlocked;
  bool? isActive;
  String? createdAt;
  @JsonKey(name: "__v")
  int? iV;
  String? about;
  String? place;
  String? title;
  String? website;
  List<String>? question;

  Fav(
      {this.sId,
      this.name,
      this.lastname,
      this.email,
      this.role,
      this.img,
      this.isBlocked,
      this.isActive,
      this.createdAt,
      this.iV,
      this.about,
      this.place,
      this.title,
      this.website,
      this.question});

  factory Fav.fromJson(Map<String, dynamic> json) => _$FavFromJson(json);
  Map<String, dynamic> favToJson(Fav model) => _$FavToJson(model);
}

@JsonSerializable()
class Question {
  @JsonKey(name: "_id")
  String? sId;
  String? title;
  String? subtitle;
  String? createdAt;
  bool? isActive;
  String? user;
  List<String>? fav;
  List<String>? answer;
  String? slug;
  @JsonKey(name: "__v")
  int? iV;

  Question(
      {this.sId,
      this.title,
      this.subtitle,
      this.createdAt,
      this.isActive,
      this.user,
      this.fav,
      this.answer,
      this.slug,
      this.iV});

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);

  Map<String, dynamic> questionToJson(Question model) =>
      _$QuestionToJson(model);
}
