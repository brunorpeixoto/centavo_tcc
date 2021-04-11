import 'package:centavo_tcc/models/category.dart';
import 'package:mobx/mobx.dart';

part 'donate_store.g.dart';

class DonateStore = _DonateStore with _$DonateStore;

abstract class _DonateStore with Store {
  ObservableList images = ObservableList();

  @observable
  Category category;

  @action
  void setCategory(Category value) => category = value;

  @computed
  bool get categoryValid => category != null;

  String get categoryError {
    if (categoryValid)
      return null;
    else
      return 'Campo obrigatório';
  }
}
