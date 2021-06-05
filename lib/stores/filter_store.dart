import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import 'home_store.dart';

part 'filter_store.g.dart';

enum OrderBy { DATE }

const VENDOR_TYPE_PARTICULAR = 1 << 0;
const VENDOR_TYPE_PROFESSIONAL = 1 << 1;

class FilterStore = _FilterStore with _$FilterStore;

abstract class _FilterStore with Store {
  _FilterStore({
    this.orderBy = OrderBy.DATE,
    this.vendorType = VENDOR_TYPE_PARTICULAR,
  });

  @observable
  OrderBy orderBy;

  @action
  void serOrderBy(OrderBy value) => orderBy = value;

  @observable
  int vendorType;

  @action
  void selectVendorType(int value) => vendorType = value;

  void setVendorType(int type) => vendorType = vendorType | type;

  void resetVendorType(int type) => vendorType = vendorType & ~type;

  @computed
  bool get isTypeParticular => (vendorType & VENDOR_TYPE_PARTICULAR) != 0;

  bool get isTypeProfessional => (vendorType & VENDOR_TYPE_PROFESSIONAL) != 0;

  @computed
  bool get isFormValid => vendorType != null;

  void save() {
    GetIt.I<HomeStore>().setFilter(this);
  }

  FilterStore clone() {
    return FilterStore(
      orderBy: orderBy,
      vendorType: vendorType,
    );
  }
}
