import 'package:flutter/material.dart';

import '../../../core/helpers/token.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ElevatedButton(
        onPressed: () {
          Token.deleteAll();
        },
        child: Text("weokfwkoeo"),
      ),
    );
  }
}
