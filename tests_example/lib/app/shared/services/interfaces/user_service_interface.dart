import 'package:tests_example/app/shared/models/authentication_model.dart';
import 'package:tests_example/app/shared/models/user_model.dart';

abstract class IUserService {
  Future<UserModel> authenticate({AuthenticationModel model});
  Future<UserModel> getCurrentUser();
  logout();
}
