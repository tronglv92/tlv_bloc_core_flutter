import 'dart:async';

import 'package:tlv_bloc_core_flutter_master/models/request/categories_request.dart';
import 'package:tlv_bloc_core_flutter_master/models/response/categories.dart';
import 'package:tlv_bloc_core_flutter_master/models/response/category.dart';
import 'package:tlv_bloc_core_flutter_master/screens/home/explore/explore_services.dart';
import 'package:rxdart/rxdart.dart';

class ExploreBloc {
  final BehaviorSubject<List<Category>> _categories =
      new BehaviorSubject<List<Category>>();
  final StreamController<CategoriesRequest> _categoriesController =
      StreamController<CategoriesRequest>();
  ExploreServices api = new ExploreServices();

  ExploreBloc() {
    _categoriesController.stream.listen((categoriesRequest) {
      api
          .getCategories(categoriesRequest.page, categoriesRequest.pageSize)
          .then((Categories categories) {
        _categories.add(categories.data);
      }).catchError((Object error) {
        _categories.addError(error);
      });
    });
  }

  Sink<CategoriesRequest> get categories => _categoriesController.sink;

  Stream<List<Category>> get categoriesStream => _categories.stream;

  void dispose() {
    _categories.close();
  }
}
