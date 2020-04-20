import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:tests_example/app/app_module.dart';
import 'package:tests_example/app/modules/home/home_module.dart';

import 'package:tests_example/app/modules/home/home_page.dart';
import 'package:tests_example/app/modules/home/pages/login/login_controller.dart';
import 'package:tests_example/app/shared/models/authentication_model.dart';
import 'package:tests_example/app/shared/repositories/interfaces/user_local_storage_repository_interface.dart';
import 'package:tests_example/app/shared/repositories/mocks/user_local_storage_repository_mock.dart';

main() {
  LoginController loginController;
  setUp(() async {
    initModule(HomeModule());
    initModule(AppModule(), changeBinds: [
      Bind<IUserLocalStorageRepository>(
          (i) => UserLocalStorageRepositoryMock()),
    ]);

    loginController = Modular.get();
    await loginController.authentication(
        authentication:
            AuthenticationModel(login: 'Toshi Ossada', password: '123456'));
  });

  group('PayslipPage Tests', () {
    testWidgets('PayslipPage has title', (WidgetTester tester) async {
      await tester.pumpWidget(buildTestableWidget(HomePage()));
      await tester.pump();
      final titleFinder = find.text('${loginController.user.name},');
      expect(titleFinder, findsOneWidget);
    });
  });
}
