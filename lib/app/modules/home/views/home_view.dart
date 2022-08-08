import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/app/core/base/base_view.dart';
import '/app/core/di/controller_provider.dart';
import '/app/core/values/app_values.dart';
import '/app/modules/home/controllers/home_controller.dart';
import '/app/modules/home/widget/item_github_project.dart';

class HomeView extends BaseView<HomeController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }



  @override
  Widget body(BuildContext context) {
    return  SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(AppValues.padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListView.separated(
              shrinkWrap: true,
              itemCount: ref.watch(controller).githubProjectList.length,
              primary: false,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                var model = ref.watch(controller).githubProjectList[index];

                return ItemGithubProject(dataModel: model);
              },
              separatorBuilder: (BuildContext context, int index) =>
              const SizedBox(height: AppValues.smallMargin),
            )
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement controller
  ProviderBase<HomeController> get controller => homeControllerProvider;


}
