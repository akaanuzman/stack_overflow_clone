class QuestionModel {
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

  QuestionModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    subtitle = json['subtitle'];
    createdAt = json['createdAt'];
    modifiedAt = json['modifiedAt'];
    isActive = json['isActive'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    if (json['fav'] != null) {
      fav = <Fav>[];
      json['fav'].forEach((v) {
        fav!.add(Fav.fromJson(v));
      });
    }
    if (json['answer'] != null) {
      answer = <Answer>[];
      json['answer'].forEach((v) {
        answer!.add(Answer.fromJson(v));
      });
    }
    slug = json['slug'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['subtitle'] = subtitle;
    data['createdAt'] = createdAt;
    data['modifiedAt'] = modifiedAt;
    data['isActive'] = isActive;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (fav != null) {
      data['fav'] = fav!.map((v) => v.toJson()).toList();
    }
    if (answer != null) {
      data['answer'] = answer!.map((v) => v.toJson()).toList();
    }
    data['slug'] = slug;
    data['__v'] = iV;
    return data;
  }
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

class Answer {
  String? sId;
  String? content;
  String? createdAt;
  List<String>? fav;
  String? user;
  String? question;
  bool? isActive;
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

  Answer.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    content = json['content'];
    createdAt = json['createdAt'];
    fav = json['fav'].cast<String>();
    user = json['user'];
    question = json['question'];
    isActive = json['isActive'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['content'] = content;
    data['createdAt'] = createdAt;
    data['fav'] = fav;
    data['user'] = user;
    data['question'] = question;
    data['isActive'] = isActive;
    data['__v'] = iV;
    return data;
  }
}
