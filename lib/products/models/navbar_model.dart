import 'package:flutter/material.dart';

class NavbarModel extends BottomNavigationBarItem {
  NavbarModel({
    Key? key,
    required IconData icon,
    required String label,
  }) : super(
          icon: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Icon(icon)
          ),
          label: label,
        );
}
