import 'package:flutter/material.dart';
import 'package:riverpod_starter/app/core/base/base_view.dart';
import 'package:riverpod_starter/app/modules/favourite/views/favourite_view.dart';
import 'package:riverpod_starter/app/modules/home/views/home_view.dart';
import 'package:riverpod_starter/app/modules/landing/providers/landing_provider.dart';
import 'package:riverpod_starter/app/modules/landing/ui_model/menu_code.dart';
import 'package:riverpod_starter/app/modules/landing/views/bottom_nav_bar.dart';
import 'package:riverpod_starter/app/modules/other/views/other_view.dart';
import 'package:riverpod_starter/app/modules/settings/views/settings_view.dart';

class LandingView extends BaseView {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    MenuCode menuCode = ref.watch(bottomNavSelectedMenuProvider);

    return Container(
      key: UniqueKey(),
      child: _getPageOnSelectedMenu(menuCode),
    );
  }

  @override
  Widget? bottomNavigationBar() {
    return BottomNavBar(
      onNewMenuSelected: (MenuCode menuCode) {
        //TODO: Take a look you can refactor it
        ref.read(bottomNavSelectedMenuProvider.notifier).state = menuCode;
      },
    );
  }

  final HomeView homeView = HomeView();
  FavouriteView? favoriteView;
  SettingsView? settingsView;

  Widget _getPageOnSelectedMenu(MenuCode menuCode) {
    switch (menuCode) {
      case MenuCode.HOME:
        return homeView;
      case MenuCode.FAVORITE:
        favoriteView ??= FavouriteView();
        return favoriteView!;
      case MenuCode.SETTINGS:
        settingsView ??= SettingsView();
        return settingsView!;
      default:
        return OtherView();
    }
  }
}
