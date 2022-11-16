// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnswerModel _$AnswerModelFromJson(Map<String, dynamic> json) => AnswerModel(
      sId: json['_id'] as String?,
      content: json['content'] as String?,
      createdAt: json['createdAt'] as String?,
      fav: (json['fav'] as List<dynamic>?)
          ?.map((e) => Fav.fromJson(e as Map<String, dynamic>))
          .toList(),
      user: json['user'] == null
          ? null
          : Fav.fromJson(json['user'] as Map<String, dynamic>),
      question: json['question'] == null
          ? null
          : Question.fromJson(json['question'] as Map<String, dynamic>),
      isActive: json['isActive'] as bool?,
      iV: json['__v'] as int?,
    );

Map<String, dynamic> _$AnswerModelToJson(AnswerModel instance) =>
    <String, dynamic>{
      '_id': instance.sId,
      'content': instance.content,
      'createdAt': instance.createdAt,
      'fav': instance.fav,
      'user': instance.user,
      'question': instance.question,
      'isActive': instance.isActive,
      '__v': instance.iV,
    };

Fav _$FavFromJson(Map<String, dynamic> json) => Fav(
      sId: json['_id'] as String?,
      name: json['name'] as String?,
      lastname: json['lastname'] as String?,
      email: json['email'] as String?,
      role: json['role'] as String?,
      img: json['img'] as String?,
      isBlocked: json['isBlocked'] as bool?,
      isActive: json['isActive'] as bool?,
      createdAt: json['createdAt'] as String?,
      iV: json['__v'] as int?,
      about: json['about'] as String?,
      place: json['place'] as String?,
      title: json['title'] as String?,
      website: json['website'] as String?,
      question: (json['question'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$FavToJson(Fav instance) => <String, dynamic>{
      '_id': instance.sId,
      'name': instance.name,
      'lastname': instance.lastname,
      'email': instance.email,
      'role': instance.role,
      'img': instance.img,
      'isBlocked': instance.isBlocked,
      'isActive': instance.isActive,
      'createdAt': instance.createdAt,
      '__v': instance.iV,
      'about': instance.about,
      'place': instance.place,
      'title': instance.title,
      'website': instance.website,
      'question': instance.question,
    };

Question _$QuestionFromJson(Map<String, dynamic> json) => Question(
      sId: json['_id'] as String?,
      title: json['title'] as String?,
      subtitle: json['subtitle'] as String?,
      createdAt: json['createdAt'] as String?,
      isActive: json['isActive'] as bool?,
      user: json['user'] as String?,
      fav: (json['fav'] as List<dynamic>?)?.map((e) => e as String).toList(),
      answer:
          (json['answer'] as List<dynamic>?)?.map((e) => e as String).toList(),
      slug: json['slug'] as String?,
      iV: json['__v'] as int?,
    );

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
      '_id': instance.sId,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'createdAt': instance.createdAt,
      'isActive': instance.isActive,
      'user': instance.user,
      'fav': instance.fav,
      'answer': instance.answer,
      'slug': instance.slug,
      '__v': instance.iV,
    };
