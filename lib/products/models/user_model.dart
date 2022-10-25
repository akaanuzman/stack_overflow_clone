class UserModel {
  String? sId;
  String? name;
  String? lastname;
  String? email;
  String? role;
  String? password;
  String? img;
  bool? isBlocked;
  bool? isActive;
  String? createdAt;
  int? iV;
  String? about;
  String? place;
  String? title;
  String? website;

  UserModel(
      {this.sId,
      this.name,
      this.lastname,
      this.email,
      this.role,
      this.password,
      this.img,
      this.isBlocked,
      this.isActive,
      this.createdAt,
      this.iV,
      this.about,
      this.place,
      this.title,
      this.website});

  UserModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    lastname = json['lastname'];
    email = json['email'];
    role = json['role'];
    password = json['password'];
    img = json['img'];
    isBlocked = json['isBlocked'];
    isActive = json['isActive'];
    createdAt = json['createdAt'];
    iV = json['__v'];
    about = json['about'];
    place = json['place'];
    title = json['title'];
    website = json['website'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['lastname'] = lastname;
    data['email'] = email;
    data['role'] = role;
    data['password'] = password;
    data['img'] = img;
    data['isBlocked'] = isBlocked;
    data['isActive'] = isActive;
    data['createdAt'] = createdAt;
    data['__v'] = iV;
    data['about'] = about;
    data['place'] = place;
    data['title'] = title;
    data['website'] = website;
    return data;
  }
}
