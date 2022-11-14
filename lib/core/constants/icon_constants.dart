import 'package:flutter/material.dart';

class IconConstants {
  static IconConstants? _instance;
  static IconConstants get instance {
    if (_instance != null) {
      return _instance!;
    } else {
      _instance = IconConstants.init();
      return _instance!;
    }
  }

  IconConstants.init();

  Icon get email => const Icon(Icons.email);
  Icon get lock => const Icon(Icons.lock);
  Icon get person => const Icon(Icons.person);


}
