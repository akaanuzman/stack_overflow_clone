import 'package:flutter/material.dart';
class NavigationService {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static final context = GlobalKey<NavigatorState>().currentContext!;
}