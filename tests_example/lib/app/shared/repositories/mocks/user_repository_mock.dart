import 'package:mockito/mockito.dart';
import 'package:tests_example/app/shared/models/authentication_model.dart';
import 'package:tests_example/app/shared/models/user_model.dart';
import 'package:tests_example/app/shared/repositories/interfaces/user_respository_interface.dart';

class UserRepositoryMock extends Mock implements IUserRepository {
  @override
  Future<UserModel> authenticate({AuthenticationModel model}) async {
    return UserModel(
      accessToken:
          'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6WyJyaWNhcmRvLmNhaXViYUBnbWFpbC5jb20iLCJyaWNhcmRvLmNhaXViYUBnbWFpbC5jb20iXSwianRpIjoiM2ZiN2U3OTYtOGQ2My00ZTZjLTgyZjEtZjNjODFkODI3NTNhIiwibmJmIjoxNTgyMTI2MDc5LCJleHAiOjE1ODIxNTQ4NzksImlhdCI6MTU4MjEyNjA3OSwiaXNzIjoiUmljYXJkbyBSb2RyaWd1ZXMiLCJhdWQiOiJyaWNhcmRvLmNhaXViYUBnbWFpbC5jb20ifQ.xKjlvPISEO-jg17yuGC8AFdikZ0A0KuXrahaVSMlEnSu1cqIIf4hk-X3-CPS8mA22-_0NLR6yHSqRDLxhQ9x7t-UbDHesJc6R_aKLsnHByHynTlSnh5vVwWbcjkuaj2VhpUBV9uwA1JxkSKATA_v6pmbO_k9vzIGE6KxhQYKDByg1S6oyFGF3bcIyBd1ekXkZkFMswdN0JVC0C31dBM5Hb358zkveaPDZe4p9kJePRcyQqwuy4Bgfi12OA4DW5ojfZhbRr4-yFeK8ejdVgtGa8xtlhNhCuIKg-GXKNAUFzHUJs95DzZh0Fo8Eru0aTE_l0IduODOfFxVo8rCyJj0-w',
      name: 'toshiossada@gmail.com',
      userName: 'Toshi Ossada',
    );
  }
}
