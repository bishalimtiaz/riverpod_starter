
import 'package:flutter/material.dart';
import 'package:riverpod_starter/app/core/base/base_view.dart';

class FavouriteView extends BaseView{
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
    return  Center(
      child: Text(
        appLocalization.bottomNavFavorite,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

}