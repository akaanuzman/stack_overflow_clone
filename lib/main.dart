import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stack Overflow Clone',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Stack Overflow Clone'),
        ),
        body: const Center(
          child:  Text('Hello World'),
        ),
      ),
    );
  }
}