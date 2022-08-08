import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_starter/app/core/base/base_view.dart';
import 'package:riverpod_starter/app/core/di/controller_provider.dart';
import 'package:riverpod_starter/app/modules/favourite/controllers/favourite_controller.dart';

class FavouriteView extends BaseView<FavouriteController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Color pageBackgroundColor() {
    return Colors.yellow;
  }

  @override
  Widget body(BuildContext context) {
    return Center(
      child: Text(
        appLocalization.bottomNavFavorite,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  ProviderBase<FavouriteController> get controller =>
      favouriteControllerProvider;
}
