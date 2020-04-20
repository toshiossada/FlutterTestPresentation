// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payslip_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PayslipController on _PayslipControllerBase, Store {
  final _$selectedMonthAtom =
      Atom(name: '_PayslipControllerBase.selectedMonth');

  @override
  MonthModel get selectedMonth {
    _$selectedMonthAtom.context.enforceReadPolicy(_$selectedMonthAtom);
    _$selectedMonthAtom.reportObserved();
    return super.selectedMonth;
  }

  @override
  set selectedMonth(MonthModel value) {
    _$selectedMonthAtom.context.conditionallyRunInAction(() {
      super.selectedMonth = value;
      _$selectedMonthAtom.reportChanged();
    }, _$selectedMonthAtom, name: '${_$selectedMonthAtom.name}_set');
  }

  final _$selectedPaymentAtom =
      Atom(name: '_PayslipControllerBase.selectedPayment');

  @override
  PaymentModel get selectedPayment {
    _$selectedPaymentAtom.context.enforceReadPolicy(_$selectedPaymentAtom);
    _$selectedPaymentAtom.reportObserved();
    return super.selectedPayment;
  }

  @override
  set selectedPayment(PaymentModel value) {
    _$selectedPaymentAtom.context.conditionallyRunInAction(() {
      super.selectedPayment = value;
      _$selectedPaymentAtom.reportChanged();
    }, _$selectedPaymentAtom, name: '${_$selectedPaymentAtom.name}_set');
  }

  final _$monthsAtom = Atom(name: '_PayslipControllerBase.months');

  @override
  ObservableList<MonthModel> get months {
    _$monthsAtom.context.enforceReadPolicy(_$monthsAtom);
    _$monthsAtom.reportObserved();
    return super.months;
  }

  @override
  set months(ObservableList<MonthModel> value) {
    _$monthsAtom.context.conditionallyRunInAction(() {
      super.months = value;
      _$monthsAtom.reportChanged();
    }, _$monthsAtom, name: '${_$monthsAtom.name}_set');
  }

  final _$paymentAtom = Atom(name: '_PayslipControllerBase.payment');

  @override
  ObservableList<PaymentModel> get payment {
    _$paymentAtom.context.enforceReadPolicy(_$paymentAtom);
    _$paymentAtom.reportObserved();
    return super.payment;
  }

  @override
  set payment(ObservableList<PaymentModel> value) {
    _$paymentAtom.context.conditionallyRunInAction(() {
      super.payment = value;
      _$paymentAtom.reportChanged();
    }, _$paymentAtom, name: '${_$paymentAtom.name}_set');
  }

  final _$loadingAtom = Atom(name: '_PayslipControllerBase.loading');

  @override
  bool get loading {
    _$loadingAtom.context.enforceReadPolicy(_$loadingAtom);
    _$loadingAtom.reportObserved();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.context.conditionallyRunInAction(() {
      super.loading = value;
      _$loadingAtom.reportChanged();
    }, _$loadingAtom, name: '${_$loadingAtom.name}_set');
  }

  final _$getMonthAsyncAction = AsyncAction('getMonth');

  @override
  Future getMonth() {
    return _$getMonthAsyncAction.run(() => super.getMonth());
  }

  final _$getPaymentsAsyncAction = AsyncAction('getPayments');

  @override
  Future getPayments() {
    return _$getPaymentsAsyncAction.run(() => super.getPayments());
  }

  final _$downloadPdfAsyncAction = AsyncAction('downloadPdf');

  @override
  Future downloadPdf() {
    return _$downloadPdfAsyncAction.run(() => super.downloadPdf());
  }

  final _$_PayslipControllerBaseActionController =
      ActionController(name: '_PayslipControllerBase');

  @override
  dynamic setSelectedMonth(dynamic v) {
    final _$actionInfo = _$_PayslipControllerBaseActionController.startAction();
    try {
      return super.setSelectedMonth(v);
    } finally {
      _$_PayslipControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setLoading(dynamic v) {
    final _$actionInfo = _$_PayslipControllerBaseActionController.startAction();
    try {
      return super.setLoading(v);
    } finally {
      _$_PayslipControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSelectedPayment(dynamic v) {
    final _$actionInfo = _$_PayslipControllerBaseActionController.startAction();
    try {
      return super.setSelectedPayment(v);
    } finally {
      _$_PayslipControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'selectedMonth: ${selectedMonth.toString()},selectedPayment: ${selectedPayment.toString()},months: ${months.toString()},payment: ${payment.toString()},loading: ${loading.toString()}';
    return '{$string}';
  }
}
