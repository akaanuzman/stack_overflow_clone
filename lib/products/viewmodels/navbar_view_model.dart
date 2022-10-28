import 'package:flutter/material.dart';
import 'package:stack_overflow_clone/products/views/home/profile_view.dart';
import '../models/navbar_model.dart';
import '../views/home/home_view.dart';

class NavbarViewModel extends ChangeNotifier {
  int currentIndex = 0;

  final List<NavbarModel> _items = [
    NavbarModel(
      icon: Icons.home,
      label: "Home",
    ),
    NavbarModel(
      icon: Icons.person,
      label: "Profile",
    ),
  ];

  List<NavbarModel> get items => _items;

  final List<Widget> _views = [
    HomeView(),
    const ProfileView(),
  ];

  List<Widget> get views => _views;

  void onItemTapped(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
