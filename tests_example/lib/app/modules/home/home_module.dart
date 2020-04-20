import 'package:tests_example/app/modules/home/pages/payslip/repositories/payslip_repository.dart';
import 'package:tests_example/app/modules/home/pages/payslip/services/payslip_service.dart';
import 'package:tests_example/app/modules/home/pages/login/components/password_field/password_field_controller.dart';
import 'package:tests_example/app/modules/home/pages/login/login_controller.dart';
import 'package:tests_example/app/modules/home/pages/payslip/payslip_controller.dart';
import 'package:tests_example/app/modules/home/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tests_example/app/modules/home/home_page.dart';
import 'package:tests_example/app/shared/custom_dio/custom_dio.dart';
import 'package:tests_example/app/shared/services/interfaces/user_service_interface.dart';

import '../../app_module.dart';
import 'pages/login/login_page.dart';
import 'pages/payslip/payslip_page.dart';
import 'pages/payslip/repositories/interfaces/payslip_repository_interface.dart';
import 'pages/payslip/services/interfaces/payslip_service_interface.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<IPayslipRepository>(
            (i) => PayslipRepository(AppModule.to.get<CustomDio>())),
        Bind<IPayslipService>(
            (i) => PayslipService(i.get<IPayslipRepository>())),
        Bind((i) => PasswordFieldController()),
        Bind((i) => LoginController(AppModule.to.get<IUserService>())),
        Bind((i) => PayslipController(i.get<IPayslipService>())),
        Bind((i) => HomeController(AppModule.to.get<IUserService>())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => LoginPage()),
        Router('/home', child: (_, args) => HomePage()),
        Router('/payslip', child: (_, args) => PayslipPage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
