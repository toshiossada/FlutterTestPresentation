import 'package:flutter_modular/flutter_modular.dart';
import 'package:tests_example/app/shared/models/authentication_model.dart';
import 'package:tests_example/app/shared/models/user_model.dart';
import 'package:tests_example/app/shared/repositories/interfaces/user_respository_interface.dart';
import 'package:tests_example/app/shared/services/interfaces/user_service_interface.dart';

import 'interfaces/user_storage_service_interface.dart';

class UserService extends Disposable implements IUserService {
  //dispose will be called automatically
  @override
  void dispose() {}

  final IUserRepository _userRepository;
  final IUserStorageService _storage;

  UserService(this._userRepository, this._storage);

  Future<UserModel> authenticate({AuthenticationModel model}) async {
    var res = await _userRepository.authenticate(model: model);

    var count = await _storage.count();
    if (count > 0) await _storage.clear();
    await _storage.add(res);

    return res;
  }

  Future<UserModel> getCurrentUser() async {
    var count = await _storage.count();
    if (count > 0) {
      var user = await _storage.getAll();
      return user.first;
    }

    return null;
  }

  logout() async {
    await _storage.clear();
  }
}
