import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:tests_example/app/app_module.dart';
import 'package:tests_example/app/modules/home/home_module.dart';

import 'package:tests_example/app/modules/home/pages/login/login_page.dart';
import 'package:tests_example/app/shared/repositories/interfaces/user_local_storage_repository_interface.dart';
import 'package:tests_example/app/shared/repositories/mocks/user_local_storage_repository_mock.dart';

main() {
  setUp(() {
    initModule(AppModule(), changeBinds: [
      Bind<IUserLocalStorageRepository>(
          (i) => UserLocalStorageRepositoryMock()),
    ]);
    initModule(HomeModule());
  });

  testWidgets('LoginPage has Welcome', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(LoginPage()));
    await tester.pump();
    final titleFinder = find.text('Bem Vindo!');
    expect(titleFinder, findsNothing);
  });
}
