import 'package:mobx/mobx.dart';
import 'package:tests_example/app/shared/models/user_model.dart';
import 'package:tests_example/app/shared/services/interfaces/user_service_interface.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  IUserService _userService;
  @observable
  UserModel userModel;
  @computed
  Future<UserModel> get user async {
    if (userModel == null)
      userModel = await _userService.getCurrentUser() ?? UserModel();

    return userModel;
  }

  _HomeControllerBase(this._userService);
}
