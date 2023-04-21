import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/base/base_singleton.dart';
import '../../../core/extensions/ui_extensions.dart';
import '../../../uikit/decoration/special_container_decoration.dart';
import '../../models/navbar_model.dart';
import '../../viewmodels/navbar_view_model.dart';
import '../home/profile/profile_view.dart';
import '../home/question/home_view.dart';

class NavbarView extends StatelessWidget with BaseSingleton {
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

  final List<Widget> _views = [
    HomeView(),
    const ProfileView(),
  ];
  NavbarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NavbarViewModel>(
      builder: (BuildContext context, NavbarViewModel provider, Widget? child) {
        return Scaffold(
          body: _views.elementAt(provider.currentIndex),
          bottomNavigationBar: _navbar(context, provider),
        );
      },
    );
  }

  Container _navbar(BuildContext context, NavbarViewModel provider) =>
      Container(
        decoration: SpecialContainerDecoration(
          context: context,
          borderRadius: context.borderRadius4x,
        ),
        child: _navBarItems(context, provider),
      );

  FadeInUp _navBarItems(BuildContext context, NavbarViewModel provider) {
    double selectedIconSize = 28;
    double unselectedIconSize = 24;
    return FadeInUp(
      child: BottomNavigationBar(
        selectedIconTheme: IconThemeData(
          color: colors.orange,
          size: selectedIconSize,
        ),
        selectedItemColor: colors.orange,
        unselectedIconTheme: IconThemeData(
          color: colors.grey,
          size: unselectedIconSize,
        ),
        selectedLabelStyle:
            context.textTheme.subtitle1!.copyWith(fontWeight: context.fw700),
        unselectedLabelStyle: context.textTheme.subtitle2,
        items: _items,
        currentIndex: provider.currentIndex,
        onTap: (index) => provider.onItemTapped(index),
      ),
    );
  }
}
