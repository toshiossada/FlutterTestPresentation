import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'components/header/header_widget.dart';
import 'components/master/master_widget.dart';
import 'home_controller.dart';
import 'pages/login/login_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  final LoginController _controller = Modular.get();
  @override
  Widget build(BuildContext context) {
    return MasterWidget(
      title: '${_controller.user.name},',
      subTitle: 'Abaixo temos suas opções:',
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.exit_to_app,
              size: 30,
              color: Colors.blue[800],
            ),
            onPressed: () async {
              await _controller.logOut();
              Modular.to.pushReplacementNamed('/');
            },
          ),
        ],
      ),
      body: Container(
        child: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: <Widget>[
            ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 10),
              title: HeaderWidget(
                title: 'Holerites',
                subtitleStyle: TextStyle(color: Colors.grey),
                subTitle:
                    'Encontre seus holerites informando o periodo e o tipo',
              ),
              onTap: () {
                Modular.to.pushNamed('/payslip');
              },
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 10),
              title: HeaderWidget(
                title: 'Comprovante de residência',
                subtitleStyle: TextStyle(color: Colors.grey),
                titleStyle: TextStyle(
                  fontSize: 22,
                  color: Colors.blue[800],
                ),
                subTitle:
                    'Encontre seus holerites informando o periodo e o tipo',
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
