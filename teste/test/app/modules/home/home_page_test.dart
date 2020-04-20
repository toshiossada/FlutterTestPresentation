import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:teste/app/modules/home/home_controller.dart';
import 'package:teste/app/modules/home/home_module.dart';

import 'package:teste/app/modules/home/home_page.dart';

main() {
  HomeController _homeController;
  setUp(() {
    initModules([HomeModule()]);
    _homeController = Modular.get<HomeController>();
  });

  group('Home Page Test', () {
    testWidgets('Aciona botão de incrementar uma vez e decrementar duas vezes',
        (WidgetTester tester) async {
      await tester.pumpWidget(buildTestableWidget(HomePage(title: 'Home')));

      expect(find.text('0'), findsOneWidget);
      final decrement = find.byTooltip('Decrement');
      final increment = find.byTooltip('Increment');
      expect(decrement, findsOneWidget);
      expect(increment, findsOneWidget);

      await tester.tap(increment);
      await tester.tap(decrement);
      await tester.tap(decrement);
      await tester.pump();
      expect(find.text('-1'), findsOneWidget);
    });
  });
}
