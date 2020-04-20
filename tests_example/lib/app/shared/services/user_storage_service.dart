import 'package:flutter_modular/flutter_modular.dart';
import 'package:tests_example/app/shared/models/user_model.dart';
import 'package:tests_example/app/shared/repositories/interfaces/user_local_storage_repository_interface.dart';

import 'interfaces/user_storage_service_interface.dart';

class UserStorageService extends Disposable implements IUserStorageService {
  final IUserLocalStorageRepository _userLocalStorageRepositoryRepository;
  UserStorageService(this._userLocalStorageRepositoryRepository);

  Future<List<UserModel>> getAll() async {
    return await _userLocalStorageRepositoryRepository.getAll();
  }

  Future<int> count() async {
    return await _userLocalStorageRepositoryRepository.count();
  }

  Future<UserModel> get(int id) async {
    return await _userLocalStorageRepositoryRepository.get(id);
  }

  Future<UserModel> add(UserModel model) async {
    return await _userLocalStorageRepositoryRepository.add(model);
  }

  update(UserModel model) async {
    await _userLocalStorageRepositoryRepository.update(model);
  }

  remove(String username) async {
    await _userLocalStorageRepositoryRepository.remove(username);
  }

  clear() async {
    await _userLocalStorageRepositoryRepository.clear();
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
