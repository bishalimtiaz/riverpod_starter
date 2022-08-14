import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';
import '/app/core/base/base_controller.dart';
import '/app/core/ui_model/page_state.dart';
import '/app/core/services/app_service.dart';
import '/app/core/values/app_colors.dart';
import '/app/core/widget/loading.dart';
import '/flavors/build_config.dart';

abstract class BaseView<T extends BaseController> extends StatelessWidget {
  BaseView({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  AppLocalizations get appLocalization => AppLocalizations.of(AppService.context)!;

  final Logger logger = BuildConfig.instance.config.logger;

  Widget body(BuildContext context);

  PreferredSizeWidget? appBar(BuildContext context);

  abstract final ProviderBase<T> controller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Stack(
        children: [
          annotatedRegion(context),
          _loading(),
          _message(),
        ],
      ),
    );
  }

  Widget _loading() {
    return Consumer(builder: (context, ref, _) {
      final PageState pageState = ref.watch(controller).pageState;

      return pageState == PageState.LOADING ? _showLoading() : const SizedBox();
    });
  }

  Widget _message() {
    return Consumer(builder: (context, ref, _) {
      final String message = ref.watch(controller).errorMessage;

      return message.isNotEmpty ? showErrorSnackBar(message) : const SizedBox();
    });
  }

  Widget annotatedRegion(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        //Status bar color for android
        statusBarColor: statusBarColor(),
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Material(
        color: Colors.transparent,
        child: pageScaffold(context),
      ),
    );
  }

  Widget pageScaffold(BuildContext context) {
    return Scaffold(
      //sets ios status bar color
      backgroundColor: pageBackgroundColor(),
      key: globalKey,
      appBar: appBar(context),
      floatingActionButton: floatingActionButton(),
      body: pageContent(context),
      bottomNavigationBar: bottomNavigationBar(),
      drawer: drawer(),
    );
  }

  Widget pageContent(BuildContext context) {
    return SafeArea(
      child: body(context),
    );
  }

  Widget showErrorSnackBar(String message) {
    final snackBar = SnackBar(content: Text(message));
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ScaffoldMessenger.of(globalKey.currentContext!).showSnackBar(snackBar);
    });

    return Container();
  }

  void showToast(String message) {
    Fluttertoast.showToast(
        msg: message, toastLength: Toast.LENGTH_SHORT, timeInSecForIosWeb: 1);
  }

  Color pageBackgroundColor() {
    return AppColors.pageBackground;
  }

  Color statusBarColor() {
    return AppColors.pageBackground;
  }

  Widget? floatingActionButton() {
    return null;
  }

  Widget? bottomNavigationBar() {
    return null;
  }

  Widget? drawer() {
    return null;
  }

  Widget _showLoading() {
    return const Loading();
  }
}
