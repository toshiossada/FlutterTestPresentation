import 'package:tests_example/app/shared/models/user_model.dart';

abstract class IUserStorageService {
  Future<List<UserModel>> getAll();
  Future<UserModel> get(int id);
  Future<int> count();
  Future<UserModel> add(UserModel model);
  update(UserModel model);
  remove(String username);
  clear();
}
