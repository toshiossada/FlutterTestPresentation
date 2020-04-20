import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tests_example/app/shared/models/authentication_model.dart';
import 'package:tests_example/app/shared/services/interfaces/user_service_interface.dart';

import 'custom_dio.dart';

class CustomInterceptors extends InterceptorsWrapper {
  @override
  Future onRequest(RequestOptions options) async {
    IUserService userService = Modular.get();
    CustomDio dio = Modular.get();
    var user = await userService.getCurrentUser();
    if (user != null) {
      if (options.headers['Authorization'] == null) {
        dio.client.lock();

        options.headers.addAll({"Authorization": 'Bearer ${user.accessToken}'});

        dio.client.unlock();
      }
    }
    print(
        'URL ${options.baseUrl} - Request[${options.method}] => PATH: ${options.path} : ');
    if (options.data != null) print(options.data.toJson());
    print('Authorization: ${options.headers['Authorization']}');

    // TODO: implement onRequest
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    print('Response[${response.statusCode}] => PATH: ${response.request.path}');

    // TODO: implement onResponse
    return super.onResponse(response);
  }

  @override
  Future onError(DioError e) async {
    //print('Response[${e.response.statusCode}] => PATH: ${e.request.path}');
    IUserService userService = Modular.get();
    var user = await userService.getCurrentUser();

    if (user != null && e.response.statusCode == 401) {
      CustomDio dio = Modular.get();

      var options = e.response.request;

      if (user.accessToken == options.headers['Authorization']) {
        options.headers['Authorization'] = user.accessToken;
        return dio.client.request(options.path, options: options);
      }
      dio.client.lock();
      dio.client.interceptors.responseLock.lock();
      dio.client.interceptors.errorLock.lock();

      return userService
          .authenticate(
              model: AuthenticationModel(
                  login: user.userName, password: user.userName))
          .then((d) {
        options.headers['Authorization'] = d.accessToken;
      }).whenComplete(() {
        dio.client.unlock();
        dio.client.interceptors.responseLock.unlock();
        dio.client.interceptors.errorLock.unlock();
      }).then((e) => dio.client.request(options.path, options: options));
    } else {
      throw e.response.data[0] ?? e.response.data['errorMessage'];
    }
  }
}
