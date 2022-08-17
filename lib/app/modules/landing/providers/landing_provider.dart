import 'package:flutter_riverpod/flutter_riverpod.dart';

final bottomNavSelectedIndexProvider =
    StateProvider.autoDispose<int>((ref) => 0);
