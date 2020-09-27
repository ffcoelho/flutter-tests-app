import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import 'package:tests_app/app/shared/models/auth_model.dart';
import 'package:tests_app/app/shared/components/loading.dart';
import 'package:tests_app/app/shared/models/user_model.dart';
import 'package:tests_app/app/shared/services/interfaces/user_service_interface.dart';
import 'package:tests_app/app/shared/stores/user_store.dart';

part 'login_controller.g.dart';

@Injectable()
class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final ILoading _loading;
  final IUserService _userService;
  final UserStore userStore;

  @observable
  UserModel user;

  @observable
  String username;

  @observable
  String password;

  _LoginControllerBase(this._loading, this._userService, this.userStore);

  @computed
  AuthModel get credential => AuthModel(username: username, password: password);

  @computed
  bool get isValid => credential.isValidEmail && credential.isValidPassword;

  @action
  void setLogin(String v) => username = v;

  @action
  void setPassword(String v) => password = v;

  Future<void> authenticate() async {
    try {
      //_loading.show();
      //await Future.delayed(Duration(seconds: 1));
      var result = await _userService.login(credential);
      result.fold((failure) {
        debugPrint('LoginController.authenticate() - failure: ${failure.toString()}');
      }, (user) {
        userStore.setUser(user);
        this.user = user;
        Modular.to.pushReplacementNamed('/login/user');
      });
    } catch (e) {
      debugPrint('LoginController.authenticate() - error: ${e.toString()}');
    } finally {
      //await _loading.hide();
    }
  }
}
