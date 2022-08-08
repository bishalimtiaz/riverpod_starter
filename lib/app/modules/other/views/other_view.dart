import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_starter/app/core/base/base_view.dart';
import 'package:riverpod_starter/app/core/di/controller_provider.dart';
import 'package:riverpod_starter/app/modules/other/controllers/other_controller.dart';

class OtherView extends BaseView<OtherController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
   return null;
  }

  @override
  Widget body(BuildContext context) {
    return const Center(
      child: Text(
        "Other",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  ProviderBase<OtherController> get controller => otherControllerProvider;
}
