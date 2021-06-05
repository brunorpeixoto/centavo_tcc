import 'package:centavo_tcc/stores/filter_store.dart';
import 'package:mobx/mobx.dart';
import 'package:centavo_tcc/models/ad.dart';
import 'package:centavo_tcc/models/category.dart';
import 'package:centavo_tcc/repositories/ad_repository.dart';

import '../models/category.dart';
import '../models/category.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  _HomeStore() {
    autorun((_) async {
      final newAds = await AdRepository().getHomeAdList(
        filter: filter,
        search: search,
        category: category,
      );
      print(newAds);
    });
  }

  @observable
  String search = '';

  @action
  void setSearch(String value) {
    search = value;
  }

  @observable
  Category category;

  @action
  void setCategory(Category value) => category = value;

  @observable
  FilterStore filter = FilterStore();

  FilterStore get clonedFilter => filter.clone();

  @action
  void setFilter(FilterStore value) => filter = value;
}
