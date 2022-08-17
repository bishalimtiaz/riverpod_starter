import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:logger/logger.dart';
import '/app/core/services/app_service.dart';
import '/flavors/build_config.dart';

mixin BaseWidgetMixin on StatelessWidget {
  AppLocalizations get appLocalization =>
      AppLocalizations.of(AppService.context)!;
  final Logger logger = BuildConfig.instance.config.logger;

  @override
  Widget build(BuildContext context) {
    return body(context);
  }

  Widget body(BuildContext context);
}
