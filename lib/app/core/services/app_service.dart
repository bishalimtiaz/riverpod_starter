import 'package:flutter/material.dart';
import '/app/routes/app_pages.dart';

abstract class AppService {
  AppService._();

  static BuildContext get context => AppPages.router.routerDelegate.navigatorKey.currentContext!;
}