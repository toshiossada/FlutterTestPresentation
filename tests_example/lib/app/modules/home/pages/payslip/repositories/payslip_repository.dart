import 'dart:io';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tests_example/app/modules/home/pages/payslip/models/month_model.dart';
import 'package:tests_example/app/modules/home/pages/payslip/models/payment_model.dart';
import 'package:tests_example/app/shared/custom_dio/custom_dio.dart';

import 'interfaces/payslip_repository_interface.dart';

class PayslipRepository extends Disposable implements IPayslipRepository {
  final CustomDio _dio;
  final String controllerName = '/payslip';
  PayslipRepository(this._dio);
  @override
  void dispose() {}

  @override
  Future<List<MonthModel>> getMonth() async {
    var months = [
      MonthModel(id: 1, month: 1, year: 2020),
      MonthModel(id: 2, month: 2, year: 2020),
    ];
    return months;
  }

  @override
  Future<List<PaymentModel>> getPayment() async {
    var payments = [
      PaymentModel(id: 1, description: '01 - Pagamento mensal'),
      PaymentModel(id: 2, description: '02 - Pagamento anual'),
    ];
    return payments;
  }

  Future<String> downloadPdf(MonthModel month, PaymentModel payment) async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = '${appDocDir.path}/holerite.pdf';
    await _dio.client.download(
      'http://www.rrsantos.com.br/holerite/holerite.pdf',
      appDocPath,
      onReceiveProgress: _showDownloadProgress,
      deleteOnError: true,
    );

    return appDocPath;
  }

  void _showDownloadProgress(received, total) {
    if (total != -1) {
      print((received / total * 100).toStringAsFixed(0) + "%");
    }
  }
}
