class AnswerModel {
  String? sId;
  String? content;
  String? createdAt;
  List<Fav>? fav;
  Fav? user;
  Question? question;
  bool? isActive;
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

  AnswerModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    content = json['content'];
    createdAt = json['createdAt'];
    if (json['fav'] != null) {
      fav = <Fav>[];
      json['fav'].forEach((v) {
        fav!.add(Fav.fromJson(v));
      });
    }
    user = json['user'] != null ? Fav.fromJson(json['user']) : null;
    question =
        json['question'] != null ? Question.fromJson(json['question']) : null;
    isActive = json['isActive'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['content'] = content;
    data['createdAt'] = createdAt;
    if (fav != null) {
      data['fav'] = fav!.map((v) => v.toJson()).toList();
    }
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (question != null) {
      data['question'] = question!.toJson();
    }
    data['isActive'] = isActive;
    data['__v'] = iV;
    return data;
  }
}

class Fav {
  String? sId;
  String? name;
  String? lastname;
  String? email;
  String? role;
  String? img;
  bool? isBlocked;
  bool? isActive;
  String? createdAt;
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

  Fav.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    lastname = json['lastname'];
    email = json['email'];
    role = json['role'];
    img = json['img'];
    isBlocked = json['isBlocked'];
    isActive = json['isActive'];
    createdAt = json['createdAt'];
    iV = json['__v'];
    about = json['about'];
    place = json['place'];
    title = json['title'];
    website = json['website'];
    question = json['question'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['lastname'] = lastname;
    data['email'] = email;
    data['role'] = role;
    data['img'] = img;
    data['isBlocked'] = isBlocked;
    data['isActive'] = isActive;
    data['createdAt'] = createdAt;
    data['__v'] = iV;
    data['about'] = about;
    data['place'] = place;
    data['title'] = title;
    data['website'] = website;
    data['question'] = question;
    return data;
  }
}

class Question {
  String? sId;
  String? title;
  String? subtitle;
  String? createdAt;
  bool? isActive;
  String? user;
  List<String>? fav;
  List<String>? answer;
  String? slug;
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

  Question.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    subtitle = json['subtitle'];
    createdAt = json['createdAt'];
    isActive = json['isActive'];
    user = json['user'];
    fav = json['fav'].cast<String>();
    answer = json['answer'].cast<String>();
    slug = json['slug'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['subtitle'] = subtitle;
    data['createdAt'] = createdAt;
    data['isActive'] = isActive;
    data['user'] = user;
    data['fav'] = fav;
    data['answer'] = answer;
    data['slug'] = slug;
    data['__v'] = iV;
    return data;
  }
}
