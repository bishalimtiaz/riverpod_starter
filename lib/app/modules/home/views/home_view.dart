import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '/app/modules/project_details/models/project_details_arg.dart';
import '/app/routes/app_routes.dart';
import '/app/core/widget/paging_view.dart';
import '/app/core/base/base_view.dart';
import '/app/core/di/controller_provider.dart';
import '/app/core/values/app_values.dart';
import '/app/modules/home/controllers/home_controller.dart';
import '/app/modules/home/widget/item_github_project.dart';

class HomeView extends BaseView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      return PagingView(
        pagingControllerProvider: ref.read(controller).pagingControllerProvider,
        onRefresh: () async {
          ref.read(controller).onRefreshPage();
        },
        onLoadNextPage: () {
          ref.read(controller).onLoadNextPage();
        },
        child: Padding(
          padding: const EdgeInsets.all(AppValues.padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Consumer(builder: (context, ref, _) {
                return ListView.separated(
                  shrinkWrap: true,
                  itemCount: ref.watch(controller).githubProjectList.length,
                  primary: false,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    var model = ref.watch(controller).githubProjectList[index];

                    return ItemGithubProject(
                      dataModel: model,
                      onTap: () {
                        /// extras is not recommended to use. arguments may not fit if you target web app.
                        /// Because browser back button, browser refresh, deep linking can't pass argument and ypu will get this argument null
                        /// prefer using queryParams instead.
                        context.pushNamed(
                          Routes.PROJECT_DETAILS,
                          extra: ProjectDetailsArg(
                              userName: model.ownerLoginName,
                              repoName: model.repositoryName),
                        );
                      },
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(height: AppValues.smallMargin),
                );
              })
            ],
          ),
        ),
      );
    });
  }

  @override
  ProviderBase<HomeController> get controller => homeControllerProvider;
}
