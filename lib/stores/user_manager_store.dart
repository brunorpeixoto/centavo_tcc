import 'package:mobx/mobx.dart';
import 'package:centavo_tcc/models/user.dart';
import 'package:centavo_tcc/repositories/user_repository.dart';

part 'user_manager_store.g.dart';

class UserManagerStore = _UserManagerStore with _$UserManagerStore;

abstract class _UserManagerStore with Store {

  _UserManagerStore(){
    _getCurrentUser();
  }

  @observable
  User user;

  @action
  void setUser(User value) => user = value;

  @computed
  bool get isLoggedIn => user != null;

  Future<void> _getCurrentUser() async {
    final user = await UserRepository().currentUser();
    setUser(user);
  }

  Future<void> logout() async {
    await UserRepository().logout();
    setUser(null);
  }
/*
  void updateUserOneSignal(User user) {
    if (user != null) {
      OneSignal.shared.setExternalUserId(user.id);
    } else {
      OneSignal.shared.removeExternalUserId();
    }
  }*/

}