import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:teste/app/modules/home/home_controller.dart';
import 'package:teste/app/modules/home/home_module.dart';

void main() {
  initModule(HomeModule());
  HomeController _homeController;

  setUp(() {
    _homeController = HomeModule.to.get<HomeController>();
  });

  group('HomeController Test', () {
    test("First Test", () {
      expect(_homeController, isInstanceOf<HomeController>());
    });

    test('Quando estiver 0 e incrementar devera retornar 1', () {
      expect(_homeController.value, 0);
      _homeController.increment();
      expect(_homeController.value, 1);
    });
  });
}


