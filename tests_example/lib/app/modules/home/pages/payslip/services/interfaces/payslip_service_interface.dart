import 'package:tests_example/app/modules/home/pages/payslip/models/month_model.dart';
import 'package:tests_example/app/modules/home/pages/payslip/models/payment_model.dart';

abstract class IPayslipService {
  Future<List<MonthModel>> getMonth();
  Future<List<PaymentModel>> getPayment();
  Future<String> downloadPdf(MonthModel month, PaymentModel payment);
}
