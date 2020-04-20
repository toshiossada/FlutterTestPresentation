import 'package:tests_example/app/shared/models/user_model.dart';

abstract class IUserLocalStorageRepository {
  Future<List<UserModel>> getAll();
  Future<UserModel> get(int id);
  Future<int> count();
  Future<UserModel> add(UserModel model);
  update(UserModel model);
  remove(String userName);
  clear();
}
