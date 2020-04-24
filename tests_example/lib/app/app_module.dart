import 'package:dio/dio.dart';
import 'package:tests_example/app/shared/custom_dio/custom_dio.dart';
import 'package:tests_example/app/shared/services/interfaces/user_storage_service_interface.dart';
import 'package:tests_example/app/shared/services/user_storage_service.dart';
import 'package:tests_example/app/shared/repositories/user_local_storage_repository.dart';
import 'package:tests_example/app/shared/repositories/user_repository.dart';
import 'package:tests_example/app/shared/services/user_service.dart';
import 'package:tests_example/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:tests_example/app/app_widget.dart';
import 'package:tests_example/app/modules/home/home_module.dart';
import 'package:tests_example/app/shared/utils/settings.dart';

import 'shared/repositories/interfaces/user_local_storage_repository_interface.dart';
import 'shared/repositories/interfaces/user_respository_interface.dart';
import 'shared/repositories/mocks/user_repository_mock.dart';
import 'shared/services/interfaces/user_service_interface.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind<IUserStorageService>(
            (i) => UserStorageService(i.get<IUserLocalStorageRepository>())),
        Bind<IUserLocalStorageRepository>((i) => UserLocalStorageRepository()),
        Bind<IUserRepository>((i) => UserRepositoryMock()),
        Bind<IUserService>((i) => UserService(
              i.get<IUserRepository>(),
              i.get<IUserStorageService>(),
            )),
        Bind((i) => AppController()),
        Bind((i) => Dio(BaseOptions(baseUrl: Settings.apiUrl))),
        Bind((i) => CustomDio(i.get<Dio>())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
