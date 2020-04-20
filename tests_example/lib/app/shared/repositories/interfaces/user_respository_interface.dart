import 'package:tests_example/app/shared/models/authentication_model.dart';
import 'package:tests_example/app/shared/models/user_model.dart';

abstract class IUserRepository {
  Future<UserModel> authenticate({AuthenticationModel model});
}
