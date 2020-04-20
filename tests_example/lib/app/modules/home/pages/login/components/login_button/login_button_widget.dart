import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tests_example/app/modules/home/components/loading/loading_widget.dart';
import 'package:tests_example/app/modules/home/pages/login/components/circular_button/circular_button_widget.dart';

import '../../login_controller.dart';

class LoginButtonWidget extends StatelessWidget {
  final LoginController _controller = Modular.get();
  final Function onError;

  LoginButtonWidget({Key key, this.onError}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Observer(
        builder: (_) => _controller.loading
            ? LoadingWidget()
            : CircularButtonWidget(
                width: MediaQuery.of(context).size.width - 100,
                backgroundColor: Colors.blue[800],
                label: "Acessar",
                icon: Icon(
                  Icons.done,
                  color: Colors.white,
                ),
                onTap: () async {
                  try {
                    _controller.setLoading(true);
                    var user = _controller.getAuthentication();
                    await _controller.authentication(authentication: user);

                    if (_controller.hasUser)
                      Modular.to.pushReplacementNamed('/home');
                    else
                      onError();
                  } catch (e) {
                    onError();
                  } finally {
                    _controller.setLoading(false);
                  }
                },
              ),
      ),
    );
  }
}
