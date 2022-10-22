import 'package:flutter/material.dart';
import 'package:stack_overflow_clone/core/base/base_singleton.dart';
import 'package:stack_overflow_clone/products/views/auth/login_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget with BaseSingleton {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stack Overflow Clone',
      theme: theme.themeData,
      debugShowCheckedModeBanner: false,
      home: LoginView()
    );
  }
}