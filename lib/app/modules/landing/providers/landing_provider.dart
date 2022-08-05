import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_starter/app/modules/landing/ui_model/menu_code.dart';

final bottomNavSelectedIndexProvider = StateProvider<int>((ref) => 0);
final bottomNavSelectedMenuProvider = StateProvider<MenuCode>((ref) => MenuCode.HOME);