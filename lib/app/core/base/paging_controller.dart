import 'package:flutter/widgets.dart';
import '/app/core/values/app_values.dart';

class PagingController<T> extends ChangeNotifier {
  List<T> listItems = [];
  int pageNumber = AppValues.defaultPageNumber;

  bool _loadingController = false;

  bool get isLoadingPage => _loadingController;

  void setIsLoading(bool value) {
    if (_loadingController != value) {
      _loadingController = value;
      notifyListeners();
    }
  }

  bool _endOfListController = false;

  bool get endOfList => _endOfListController;

  bool _isInitialLoadController = true;

  bool get isInitialLoad => _isInitialLoadController;

  initRefresh() {
    listItems = [];
    pageNumber = AppValues.defaultPageNumber;
    _endOfListController = false;
    _isInitialLoadController = true;
    setIsLoading(false);
  }

  bool canLoadNextPage() {
    return !isLoadingPage && !endOfList;
  }

  appendData(List<T> items) {
    if (items.isEmpty) {
      _endOfListController = true;
      pageNumber--;
    } else {
      listItems.addAll(items);
      pageNumber++;
    }
    if (isInitialLoad) _isInitialLoadController = false;
    setIsLoading(false);
  }
}
