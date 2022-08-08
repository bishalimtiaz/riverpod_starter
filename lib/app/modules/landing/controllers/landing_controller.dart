import 'package:riverpod_starter/app/core/base/base_controller.dart';
import 'package:riverpod_starter/app/modules/landing/ui_model/menu_code.dart';

class LandingController extends BaseController{

  MenuCode bottomNavSelectedMenu = MenuCode.HOME;
  void onMenuSelected(MenuCode menuCode){
    bottomNavSelectedMenu = menuCode;
    notifyListeners();
  }

}