import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/app/core/values/app_colors.dart';
import '/app/core/values/app_values.dart';
import '/app/core/values/text_styles.dart';
import '/app/core/widget/custom_app_bar.dart';
import '/app/core/widget/icon_text_widgets.dart';
import '/app/modules/project_details/controllers/project_details_controller.dart';
import '/app/core/base/base_view.dart';
import '/app/core/di/controller_provider.dart';

class ProjectDetailsView extends BaseView<ProjectDetailsController> {
  ProjectDetailsView({Key? key}) : super(key: key);

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(
      appBarTitleText: 'Repository details',
      isBackButtonEnabled: true,
    );
  }

  @override
  Widget body(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      String repositoryName =
          ref.watch(controller).githubProjectUiModel.repositoryName;

      return repositoryName.isEmpty
          ? const SizedBox()
          : Container(
              margin: const EdgeInsets.all(AppValues.margin_20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    repositoryName,
                    style: cardTitleStyle,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  _getAuthor(),
                  const SizedBox(height: AppValues.margin_4),
                  _getForkStarWatcherView(),
                  const SizedBox(height: AppValues.margin_30),
                  _getDescription()
                ],
              ),
            );
    });
  }

  Widget _getAuthor() {
    return Row(
      children: [
        Consumer(builder: (context, ref, _) {
          String imgUrl =
              ref.watch(controller).githubProjectUiModel.ownerAvatar;

          return CircleAvatar(
            backgroundImage: NetworkImage(imgUrl),
            radius: AppValues.iconSmallSize,
          );
        }),
        const SizedBox(width: AppValues.margin_6),
        Consumer(builder: (context, ref, _) {
          String ownerName =
              ref.watch(controller).githubProjectUiModel.ownerLoginName;

          return Text(
            ownerName,
            style: cardSubtitleStyle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          );
        }),
      ],
    );
  }

  Widget _getForkStarWatcherView() {
    return Container(
      margin: const EdgeInsets.only(left: AppValues.margin_40),
      child: Row(
        children: [
          Consumer(builder: (context, ref, _) {
            int numberOfFork =
                ref.watch(controller).githubProjectUiModel.numberOfFork;

            return IconTextWidget(
              fileName: "ic_fork.svg",
              value: numberOfFork.toString(),
              height: AppValues.iconSize_20,
              width: AppValues.iconSize_20,
              color: AppColors.iconColorDefault,
            );
          }),
          Consumer(builder: (context, ref, _) {
            int numberOfStar =
                ref.watch(controller).githubProjectUiModel.numberOfStar;

            return IconTextWidget(
              icon: Icons.star_border,
              value: numberOfStar.toString(),
              size: AppValues.iconSize_20,
              color: AppColors.iconColorDefault,
            );
          }),
          Consumer(builder: (context, ref, _) {
            int watchers = ref.watch(controller).githubProjectUiModel.watchers;

            return IconTextWidget(
              icon: Icons.visibility_outlined,
              value: watchers.toString(),
              size: AppValues.iconSize_20,
              color: AppColors.iconColorDefault,
            );
          }),
        ],
      ),
    );
  }

  Widget _getDescription() {
    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Consumer(builder: (context, ref, _) {
          String description =
              ref.watch(controller).githubProjectUiModel.description;

          return Text(
            description,
            style: descriptionTextStyle,
          );
        }),
      ),
    );
  }

  @override
  ProviderBase<ProjectDetailsController> get controller =>
      projectDetailsControllerProvider;
}
