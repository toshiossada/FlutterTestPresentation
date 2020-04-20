import 'package:mobx/mobx.dart';

import 'models/month_model.dart';
import 'models/payment_model.dart';
import 'services/interfaces/payslip_service_interface.dart';

part 'payslip_controller.g.dart';

class PayslipController = _PayslipControllerBase with _$PayslipController;

abstract class _PayslipControllerBase with Store {
  IPayslipService _payslipService;

  _PayslipControllerBase(this._payslipService);

  @observable
  MonthModel selectedMonth;
  @observable
  PaymentModel selectedPayment;
  @observable
  ObservableList<MonthModel> months;
  @observable
  ObservableList<PaymentModel> payment;
  @observable
  bool loading = false;

  @action
  setSelectedMonth(v) {
    selectedMonth = v;
  }

  @action
  setLoading(v) {
    loading = v;
  }

  @action
  setSelectedPayment(v) {
    selectedPayment = v;
  }

  @action
  getMonth() async {
    var list = await _payslipService.getMonth();
    months = list.asObservable();
    if (list.isNotEmpty) selectedMonth = list.first;
  }

  @action
  getPayments() async {
    var list = await _payslipService.getPayment();
    payment = list.asObservable();
    if (list.isNotEmpty) selectedPayment = list.first;
  }

  @action
  downloadPdf() async {
    try {
      loading = true;
      return await _payslipService.downloadPdf(selectedMonth, selectedPayment);
    } catch (e) {} finally {
      loading = false;
    }
  }
}
