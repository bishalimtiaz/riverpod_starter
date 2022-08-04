import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:riverpod_starter/app/core/values/app_colors.dart';
import 'package:riverpod_starter/app/core/values/app_values.dart';
import 'package:riverpod_starter/app/modules/landing/providers/landing_provider.dart';
import 'package:riverpod_starter/app/modules/landing/ui_model/menu_code.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:riverpod_starter/app/modules/landing/ui_model/menu_item.dart';

class BottomNavBar extends ConsumerWidget {
  final Color selectedItemColor = Colors.white;
  final unselectedItemColor = Colors.grey;
  final Function(MenuCode menuCode) onNewMenuSelected;
  late final AppLocalizations appLocalization;

  late final List<BottomNavItem> _navItems;

  BottomNavBar({
    Key? key,
    required this.onNewMenuSelected,
  }) : super(key: key){
    _navItems = _getNavItems();
  }


  final Key bottomNavKey = GlobalKey();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //TODO: Take A Look If You Can Optimize
    int selectedIndex = ref.watch(bottomNavSelectedIndexProvider);

    return BottomNavigationBar(
      key: bottomNavKey,
      items: _navItems
          .map(
            (BottomNavItem navItem) => BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "images/${navItem.iconSvgName}",
              height: AppValues.iconDefaultSize,
              width: AppValues.iconDefaultSize,
              color:
              _navItems.indexOf(navItem) == selectedIndex
                  ? selectedItemColor
                  : unselectedItemColor,
            ),
            label: navItem.navTitle,
            tooltip: ""),
      )
          .toList(),
      showSelectedLabels: true,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.colorAccent,
      selectedItemColor: selectedItemColor,
      unselectedItemColor: unselectedItemColor,
      currentIndex: selectedIndex,
      onTap: (index) {
        //TODO: Take A Look If You Can Optimize
        ref.read(bottomNavSelectedIndexProvider.notifier).state = index;
        onNewMenuSelected(_navItems[index].menuCode);
      },
    );
  }

  List<BottomNavItem> _getNavItems() {
    return [
      BottomNavItem(
        navTitle: appLocalization.bottomNavHome,
        iconSvgName: "ic_home.svg",
        menuCode: MenuCode.HOME,
      ),
      BottomNavItem(
          navTitle: appLocalization.bottomNavFavorite,
          iconSvgName: "ic_favorite.svg",
          menuCode: MenuCode.FAVORITE),
      BottomNavItem(
          navTitle: appLocalization.bottomNavSettings,
          iconSvgName: "ic_settings.svg",
          menuCode: MenuCode.SETTINGS)
    ];
  }
}
