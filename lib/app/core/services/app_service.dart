import 'package:flutter/material.dart';
import '/app/routes/app_pages.dart';

abstract class AppService {
  AppService._();

  static BuildContext get context => AppPages.router.routerDelegate.navigatorKey.currentContext!;

  static Object? get argument => AppPages.router.routerDelegate.currentConfiguration.last.extra;

  static Map<String,String> get queryParams => AppPages.router.routerDelegate.currentConfiguration.last.queryParams;

  static Map<String,String> get pathParams => AppPages.router.routerDelegate.currentConfiguration.last.decodedParams;

  static bool get hasQuery => AppPages.router.routerDelegate.currentConfiguration.location.hasQuery;

  static String get path => AppPages.router.routerDelegate.currentConfiguration.location.path;


  ///Use it to debug if any issue occurs with [argument]] [queryParams]] [pathParams]] [hasQuery]] [path]]
  ///Remove It Before Production
  //ignore: no-empty-block
  static void test(){

    // print("arg_debug: currentConfiguration");
    // print("arg_debug: currentConfiguration->extra: ${AppPages.router.routerDelegate.currentConfiguration.extra}");
    //
    // currentConfiguration.location
    // print("arg_debug: currentConfiguration.location");
    // print("arg_debug: currentConfiguration.location-> queryParameters: ${AppPages.router.routerDelegate.currentConfiguration.location.queryParameters}");
    // print("arg_debug: currentConfiguration.location->query: ${AppPages.router.routerDelegate.currentConfiguration.location.query}");
    // print("arg_debug: currentConfiguration.location->hasQuery: ${AppPages.router.routerDelegate.currentConfiguration.location.hasQuery}");
    // print("arg_debug: currentConfiguration.location->path: ${AppPages.router.routerDelegate.currentConfiguration.location.path}");
    //
    //
    // currentConfiguration.last
    // print("arg_debug: currentConfiguration.last");
    // print("arg_debug: currentConfiguration.last->extra: ${AppPages.router.routerDelegate.currentConfiguration.last.extra}");
    // print("arg_debug: currentConfiguration.last->queryParams: ${AppPages.router.routerDelegate.currentConfiguration.last.queryParams}");
    // print("arg_debug: currentConfiguration.last->decodedParams: ${AppPages.router.routerDelegate.currentConfiguration.last.decodedParams}");
    // print("arg_debug: currentConfiguration.last-> encodedParams: ${AppPages.router.routerDelegate.currentConfiguration.last.encodedParams}");



    //currentConfiguration.last.route
    // print("arg_debug: currentConfiguration.last.route");
    // print("arg_debug: currentConfiguration.last.route->path: ${AppPages.router.routerDelegate.currentConfiguration.last.route.path}");
    //
    // currentConfiguration.matches.last
    // print("arg_debug: ccurrentConfiguration.matches.last->");
    // print("arg_debug: ccurrentConfiguration.matches.last->extra: ${AppPages.router.routerDelegate.currentConfiguration.matches.last.extra}");
    // print("arg_debug: ccurrentConfiguration.matches.last->queryParams: ${AppPages.router.routerDelegate.currentConfiguration.matches.last.queryParams}");
    // print("arg_debug: ccurrentConfiguration.matches.last->decodedParams: ${AppPages.router.routerDelegate.currentConfiguration.matches.last.decodedParams}");
    // print("arg_debug: ccurrentConfiguration.matches.last->encodedParams ${AppPages.router.routerDelegate.currentConfiguration.matches.last.encodedParams}");

  }
}