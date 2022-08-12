import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/app/core/base/base_controller.dart';
import '/app/core/base/base_view.dart';
import '/app/core/di/controller_provider.dart';

class ProjectDetailsView extends BaseView {
  ProjectDetailsView({Key? key}) : super(key: key);

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return const Center(
      child: Text(
        "Project Details",
      ),
    );
  }

  @override
  ProviderBase<BaseController> get controller =>
      projectDetailsControllerProvider;
}
