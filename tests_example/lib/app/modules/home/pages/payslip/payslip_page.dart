import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:open_file/open_file.dart';
import 'package:tests_example/app/modules/home/components/loading/loading_widget.dart';
import 'package:tests_example/app/modules/home/components/master/master_widget.dart';
import 'package:tests_example/app/modules/home/home_controller.dart';
import 'package:tests_example/app/modules/home/pages/login/components/circular_button/circular_button_widget.dart';
import 'package:tests_example/app/modules/home/pages/login/login_controller.dart';
import 'package:tests_example/app/shared/models/user_model.dart';

import 'payslip_controller.dart';

class PayslipPage extends StatefulWidget {
  final String title;
  const PayslipPage({Key key, this.title = "Payslip"}) : super(key: key);

  @override
  _PayslipPageState createState() => _PayslipPageState();
}

class _PayslipPageState extends ModularState<PayslipPage, PayslipController> {
  final HomeController _homeController = Modular.get();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    controller.getMonth();
    controller.getPayments();
  }

  @override
  Widget build(BuildContext context) {
    return  FutureBuilder<UserModel>(
        future: _homeController.user,
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.data == null)
            return CircularProgressIndicator();
          return MasterWidget(
            title: snapshot.data.name,
            subTitle: 'você selecionou holerites:',
            scaffoldKey: _scaffoldKey,
            appBar: AppBar(
              iconTheme: IconThemeData(color: Colors.black),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: Container(
              child: Column(
                children: <Widget>[
                  Observer(
                    builder: (_) {
                      return controller.months == null
                          ? LoadingWidget()
                          : DropdownButton(
                              items: controller.months.map((value) {
                                return DropdownMenuItem(
                                  value: value,
                                  child: new Text(
                                    '${value.monthFormated()}/${value.year}',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                );
                              }).toList(),
                              underline: Text(''),
                              iconEnabledColor: Colors.black,
                              value: controller.selectedMonth,
                              style: TextStyle(color: Colors.grey),
                              isExpanded: true,
                              onChanged: controller.setSelectedMonth,
                            );
                    },
                  ),
                  Container(color: Colors.grey, height: 2),
                  Observer(
                    builder: (_) {
                      return controller.payment == null
                          ? LoadingWidget()
                          : DropdownButton(
                              items: controller.payment.map((value) {
                                return DropdownMenuItem(
                                  value: value,
                                  child: new Text(
                                    value.description,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                );
                              }).toList(),
                              underline: Text(''),
                              iconEnabledColor: Colors.black,
                              value: controller.selectedPayment,
                              style: TextStyle(color: Colors.grey),
                              isExpanded: true,
                              onChanged: controller.setSelectedPayment,
                            );
                    },
                  ),
                  Container(color: Colors.grey, height: 2),
                  SizedBox(height: 10),
                  Container(
                    child: Observer(
                      builder: (_) => controller.loading ?? false
                          ? LoadingWidget()
                          : CircularButtonWidget(
                              width: MediaQuery.of(context).size.width - 100,
                              backgroundColor: Colors.blue[800],
                              label: "Consultar",
                              icon: Icon(
                                Icons.done,
                                color: Colors.white,
                              ),
                              onTap: () async {
                                try {
                                  var file = await controller.downloadPdf();
                                  OpenFile.open(file, type: "application/pdf");
                                } catch (e) {
                                  onError();
                                } finally {
                                  controller.setLoading(false);
                                }
                              },
                            ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  onError() {
    controller.setLoading(true);

    final snackBar = SnackBar(
      content: Text('Erro ao tentar gerar holerite'),
      backgroundColor: Colors.red,
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }
}
