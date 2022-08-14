import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/app/core/services/app_service.dart';
import '/app/core/values/app_colors.dart';
import '/app/core/values/app_values.dart';
import '/app/modules/landing/providers/landing_provider.dart';
import '/app/modules/landing/ui_model/menu_code.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '/app/modules/landing/ui_model/menu_item.dart';

class BottomNavBar extends ConsumerWidget {
  final Function(MenuCode menuCode) onNewMenuSelected;

  late final List<BottomNavItem> _navItems;

  BottomNavBar({
    Key? key,
    required this.onNewMenuSelected,
  }) : super(key: key) {
    _navItems = _getNavItems();
  }

  final Key bottomNavKey = GlobalKey();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                  color: _navItems.indexOf(navItem) == selectedIndex
                      ? AppColors.selectedItemColor
                      : AppColors.unselectedItemColor,
                ),
                label: navItem.navTitle,
                tooltip: ""),
          )
          .toList(),
      showSelectedLabels: true,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.colorAccent,
      selectedItemColor: AppColors.selectedItemColor,
      unselectedItemColor: AppColors.unselectedItemColor,
      currentIndex: selectedIndex,
      onTap: (index) {
        if(selectedIndex != index){
          ref.read(bottomNavSelectedIndexProvider.notifier).state = index;
          onNewMenuSelected(_navItems[index].menuCode);
        }
      },
    );
  }

  List<BottomNavItem> _getNavItems() {
    final AppLocalizations appLocalization = AppLocalizations.of(AppService.context)!;

    return [
      BottomNavItem(
        navTitle: appLocalization.bottomNavHome,
        iconSvgName: "ic_home.svg",
        menuCode: MenuCode.HOME,
      ),
      BottomNavItem(
        navTitle: appLocalization.bottomNavFavorite,
        iconSvgName: "ic_favorite.svg",
        menuCode: MenuCode.FAVORITE,
      ),
      BottomNavItem(
        navTitle: appLocalization.bottomNavSettings,
        iconSvgName: "ic_settings.svg",
        menuCode: MenuCode.SETTINGS,
      )
    ];
  }
}
