import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/app/core/base/base_controller.dart';
import '/app/modules/landing/ui_model/menu_code.dart';

class LandingController extends BaseController {
  MenuCode bottomNavSelectedMenu = MenuCode.HOME;

  LandingController({
    required Ref<ChangeNotifier> ref,
  }) : super(ref: ref);

  void onMenuSelected(MenuCode menuCode) {
    bottomNavSelectedMenu = menuCode;
    notifyListeners();
  }
}
