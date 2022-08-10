import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/app/core/base/base_controller.dart';

class OtherController extends BaseController {
  OtherController({
    required ChangeNotifierProviderRef<ChangeNotifier> ref,
  }) : super(ref: ref);
}
