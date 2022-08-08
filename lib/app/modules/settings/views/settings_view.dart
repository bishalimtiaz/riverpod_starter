import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_starter/app/core/base/base_view.dart';
import 'package:riverpod_starter/app/core/di/controller_provider.dart';
import 'package:riverpod_starter/app/modules/settings/controllers/settings_controller.dart';

class SettingsView extends BaseView<SettingsController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Color pageBackgroundColor() {
    return Colors.green;
  }

  @override
  Widget body(BuildContext context) {
    return Center(
      child: Text(
        appLocalization.bottomNavSettings,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  ProviderBase<SettingsController> get controller => settingsControllerProvider;
}
