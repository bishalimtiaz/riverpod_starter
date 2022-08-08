import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_starter/app/core/base/base_controller.dart';
import 'package:riverpod_starter/app/core/model/page_state.dart';
import '/app/core/services/navigation_service.dart';
import '/app/core/values/app_colors.dart';
import '/app/core/widget/loading.dart';
import '/flavors/build_config.dart';


abstract class BaseView<T extends BaseController> extends ConsumerWidget {

  final GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  AppLocalizations get appLocalization => AppLocalizations.of(NavigationService.navigatorKey.currentContext!)!;

  final Logger logger = BuildConfig.instance.config.logger;

  Widget body(BuildContext context);

  PreferredSizeWidget? appBar(BuildContext context);


  //TODO: Take a look if we can make final and this variable not causing memory leakage
  late WidgetRef ref;

  abstract final ProviderBase<T> controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    this.ref = ref;

    return GestureDetector(
      child: Stack(
        children: [
          annotatedRegion(context),
          ref.watch(controller).pageState == PageState.LOADING //TODO: Take a look if you can refactorr
              ? _showLoading()
              : const SizedBox(),
          ref.watch(controller).errorMessage.isNotEmpty
              ? showErrorSnackBar( ref.watch(controller).errorMessage) //TODO: Take a look if you can refactorr
              : const SizedBox(),
          const SizedBox(), //TODO: Take a look why this widget is needed
        ],
      ),
    );
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
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 1
    );
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
