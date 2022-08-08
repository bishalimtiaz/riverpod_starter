import '/app/core/values/app_values.dart';

class PagingController<T> {
  List<T> listItems = [];
  int pageNumber = AppValues.defaultPageNumber;

  bool _loadingController = false;

  bool get isLoadingPage => _loadingController;

  void setIsLoading(bool value) {
    _loadingController = value;
  }

  bool _endOfListController = false;

  bool get endOfList => _endOfListController;

  bool _isInitialLoadController = true;

  bool get isInitialLoad => _isInitialLoadController;

  initRefresh() {
    listItems = [];
    pageNumber = AppValues.defaultPageNumber;
    setIsLoading(false);
    _endOfListController = false;
    _isInitialLoadController = true;
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
    setIsLoading(false);
    if (isInitialLoad) _isInitialLoadController = false;
  }
}
