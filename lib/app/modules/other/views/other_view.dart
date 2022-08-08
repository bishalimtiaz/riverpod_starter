import 'package:flutter/material.dart';
import 'package:riverpod/src/framework.dart';
import 'package:riverpod_starter/app/core/base/base_controller.dart';
import 'package:riverpod_starter/app/core/base/base_view.dart';

class OtherView extends BaseView {
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
  // TODO: implement controller
  ProviderBase<BaseController> get controller => throw UnimplementedError();
}
