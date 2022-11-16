import 'package:json_annotation/json_annotation.dart';

part 'question_model.g.dart';

@JsonSerializable()
class QuestionModel {
  @JsonKey(name: "_id")
  String? sId;
  String? title;
  String? subtitle;
  String? createdAt;
  String? modifiedAt;
  bool? isActive;
  User? user;
  List<Fav>? fav;
  List<Answer>? answer;
  String? slug;
  @JsonKey(name: "__v")
  int? iV;

  QuestionModel(
      {this.sId,
      this.title,
      this.subtitle,
      this.createdAt,
      this.modifiedAt,
      this.isActive,
      this.user,
      this.fav,
      this.answer,
      this.slug,
      this.iV});

  factory QuestionModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionModelFromJson(json);

  Map<String, dynamic> questionModelToJson(QuestionModel questionModel) =>
      _$QuestionModelToJson(questionModel);
}

class User {
  String? sId;
  String? name;
  String? lastname;
  List<String>? question;

  User({this.sId, this.name, this.lastname, this.question});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    lastname = json['lastname'];
    question = json['question'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['lastname'] = lastname;
    data['question'] = question;
    return data;
  }
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
class Answer {
  @JsonKey(name: "_id")
  String? sId;

  String? content;
  String? createdAt;
  List<Fav>? fav;
  Fav? user;
  QuestionModel? question;
  bool? isActive;
  @JsonKey(name: "__v")
  int? iV;

  Answer(
      {this.sId,
      this.content,
      this.createdAt,
      this.fav,
      this.user,
      this.question,
      this.isActive,
      this.iV});

  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);

  Map<String, dynamic> answerModelToJson(Answer model) => _$AnswerToJson(model);
}
