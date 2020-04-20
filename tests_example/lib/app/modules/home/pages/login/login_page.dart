import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tests_example/app/modules/home/components/loading/loading_widget.dart';
import 'package:tests_example/app/modules/home/components/master/master_widget.dart';

import 'components/login_button/login_button_widget.dart';
import 'components/password_field/password_field_widget.dart';
import 'components/rounded_text_field/rounded_text_field_widget.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  final String title;
  LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  initState() {
    super.initState();

    verifyLoggedIn();
  }

  verifyLoggedIn() async {
    await controller.getUser();

    if (controller.hasUser) Modular.to.pushReplacementNamed('/home');
  }

  @override
  Widget build(BuildContext context) {
    return MasterWidget(
      scaffoldKey: _scaffoldKey,
      title: 'Bem Vindo!',
      subTitle: 'Insira seus dados para continuar.',
      body: Observer(
        builder: (_) {
          if (controller.user == null) return LoadingWidget();

          return Column(
            children: <Widget>[
              RoundedTextFieldWidget(
                showBorder: true,
                labelText: 'Email',
                fontColor: Colors.black,
                backgroundColor: Colors.white,
                labelStyleColor: Colors.blue,
                onChanged: controller.setLogin,
                validator: (value) {
                  if (value.isEmpty)
                    return 'Usuário Inválido';
                  else
                    return null;
                },
              ),
              PasswordFieldWidget(
                showBorder: true,
                onChanged: controller.setPassword,
                fontColor: Colors.black,
                backgroundColor: Colors.white,
                labelStyleColor: Colors.blue,
                validator: (value) {
                  if (value.isEmpty)
                    return 'Senha Inválido';
                  else
                    return null;
                },
                label: 'Senha',
              ),
              SizedBox(height: 30),
              LoginButtonWidget(
                onError: () {
                  final snackBar = SnackBar(
                    content: Text('Usuário ou senha invalidos'),
                    backgroundColor: Colors.red,
                  );
                  _scaffoldKey.currentState.showSnackBar(snackBar);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
