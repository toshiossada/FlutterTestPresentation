import 'package:flutter_modular/flutter_modular.dart';
import 'package:tests_example/app/modules/home/pages/payslip/models/month_model.dart';
import 'package:tests_example/app/modules/home/pages/payslip/models/payment_model.dart';
import 'package:tests_example/app/modules/home/pages/payslip/repositories/interfaces/payslip_repository_interface.dart';

import 'interfaces/payslip_service_interface.dart';

class PayslipService extends Disposable implements IPayslipService {
  IPayslipRepository _repository;

  PayslipService(this._repository);

  @override
  void dispose() {}

  @override
  Future<List<MonthModel>> getMonth() async {
    return await _repository.getMonth();
  }

  @override
  Future<List<PaymentModel>> getPayment() async {
    return await _repository.getPayment();
  }

  @override
  Future<String> downloadPdf(MonthModel month, PaymentModel payment) async {
    return await _repository.downloadPdf(month, payment);
  }
}
