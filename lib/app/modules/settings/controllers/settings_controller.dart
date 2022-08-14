import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/app/core/base/base_controller.dart';

class SettingsController extends BaseController {
  SettingsController({
    required Ref<ChangeNotifier> ref,
  }) : super(ref: ref);
}
