import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_starter/app/routes/app_routes.dart';
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
                        context.pushNamed(
                          Routes.PROJECT_DETAILS,
                          queryParams: {
                            // 'userName': model.ownerLoginName,
                            // 'repositoryName' : model.repositoryName,
                          }
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
