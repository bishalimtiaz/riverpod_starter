import 'package:flutter_riverpod/flutter_riverpod.dart';


//TODO: Move it to some controller
final bottomNavSelectedIndexProvider = StateProvider<int>((ref) => 0);
//final bottomNavSelectedMenuProvider = StateProvider<MenuCode>((ref) => MenuCode.HOME);