import 'package:mobx/mobx.dart';
import 'package:tests_example/app/shared/models/authentication_model.dart';
import 'package:tests_example/app/shared/models/user_model.dart';
import 'package:tests_example/app/shared/services/interfaces/user_service_interface.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  IUserService _userService;

  _LoginControllerBase(this._userService) {
    user = null;
  }

  @observable
  UserModel user;
  @observable
  String email;
  @observable
  String password;
  @computed
  bool get hasUser => (user?.userName ?? '').isNotEmpty;

  AuthenticationModel getAuthentication() =>
      AuthenticationModel(login: email, password: password);

  @action
  authentication({AuthenticationModel authentication}) async {
    try {
      if (authentication.login.isEmpty || authentication.password.isEmpty)
        user = UserModel();
      else
        user = await _userService.authenticate(model: authentication);
    } catch (e) {
      user = UserModel();
    }
  }

  @action
  logOut() async {
    user = await _userService.logout();
    user = UserModel();
  }

  @action
  getUser() async {
    try {
      user = await _userService.getCurrentUser() ?? UserModel();
    } catch (e) {
      user = UserModel();
    }
  }

  @observable
  bool loading = false;

  @action
  void setLoading(bool v) => loading = v;

  @action
  void setLogin(String v) => user.userName = v;
  @action
  void setPassword(String v) => user.userName = v;
}
