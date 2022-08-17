import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/app/core/base/paging_controller.dart';
import '/app/core/values/app_colors.dart';
import '/app/core/utils/debouncer.dart';
import '/app/core/values/app_values.dart';

///ignore: must_be_immutable
class PagingView extends ConsumerWidget {
  final Widget child;
  final Function() onLoadNextPage;
  final Future<void> Function()? onRefresh;
  final ProviderBase<PagingController<dynamic>> pagingControllerProvider;

  PagingView({
    Key? key,
    required this.child,
    required this.onLoadNextPage,
    required this.pagingControllerProvider,
    this.onRefresh,
  }) : super(key: key);

  final ScrollController _scrollController = ScrollController();

  final _debouncer = Debouncer(milliseconds: 500);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // print("paging_debug: pageNumber: ${pagingController.pageNumber} isLoading: ${pagingController.isLoadingPage} end: ${pagingController.endOfList}");

    return NotificationListener(
      onNotification: (ScrollNotification scrollInfo) {
        var triggerFetchMoreSize =
            0.75 * _scrollController.position.maxScrollExtent;

        if (_scrollController.position.pixels >= triggerFetchMoreSize &&
            (_scrollController.position.userScrollDirection ==
                ScrollDirection.reverse)) {
          _debouncer.run(() {
            if (ref.read(pagingControllerProvider).canLoadNextPage()) {
              ref.read(pagingControllerProvider).setIsLoading(true);
              onLoadNextPage();
            }
          });
        }

        return true;
      },
      child: onRefresh == null
          ? _getScrollableView()
          : RefreshIndicator(
              child: _getScrollableView(),
              onRefresh: () async {
                ref.read(pagingControllerProvider).initRefresh();
                ref.read(pagingControllerProvider).setIsLoading(true);
                onRefresh!();
              },
            ),
    );
  }

  Widget _getScrollableView() {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        children: [
          child,
          _getFooter(),
        ],
      ),
    );
  }

  Widget _getFooter() {
    return Consumer(builder: (context, ref, _) {
      var controller = ref.watch(pagingControllerProvider);

      return Container(
        margin: EdgeInsets.only(
            bottom: !controller.endOfList ? AppValues.margin_20 : 0),
        height: !controller.endOfList ? AppValues.margin_40 : 0,
        child: (!controller.endOfList && controller.isLoadingPage)
            ? const CircularProgressIndicator(
                color: AppColors.colorPrimary,
              )
            : const SizedBox(),
      );
    });
  }
}
