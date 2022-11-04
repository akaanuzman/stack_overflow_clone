// ignore_for_file: avoid_print

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:stack_overflow_clone/core/helpers/api.dart';
import 'package:stack_overflow_clone/products/models/user_model.dart';

import '../../core/helpers/token.dart';

class UserViewModel extends ChangeNotifier {
  UserModel _user = UserModel();
  UserModel get user => _user;

  final _api = Api();

  Future<void> get getMyDetails async {
    final tokenResult = await Token.readToken("userId");
    if (tokenResult != null) {
      final result = await _api.dioGet(url: "/users/$tokenResult");
      if (result?.statusCode == HttpStatus.ok) {
        try {
          _user = UserModel.fromJson(result?.data["user"]);
        } catch (e) {
          print(e);
        }
      } else {
        _user = UserModel();
      }
      notifyListeners();
    } else {
      print("user id is null");
    }
  }
}
